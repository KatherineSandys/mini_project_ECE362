#include "stm32f0xx.h"
#include <string.h> // for memset() declaration
#include <math.h>   // for MA_PI

void nano_wait(unsigned int);
//const char font[];

void init_spi2(void) {
	RCC->APB1ENR |= RCC_APB1ENR_SPI2EN;
	RCC->AHBENR |= RCC_AHBENR_GPIOBEN;

	GPIOB->MODER &= ~(0xCF000000);
	GPIOB->MODER |= 0x8a000000;

	GPIOB->AFR[1] &= ~(0xF0FF0000);

	SPI2->CR1 &= ~(SPI_CR1_SPE);

	SPI2->CR1 |= SPI_CR1_BR;
	//SPI2->CR1 |= SPI_CR1_SSM;

	SPI2->CR2 |= SPI_CR2_DS;
	SPI2->CR2 |= SPI_CR2_NSSP;
	SPI2->CR2 |= SPI_CR2_SSOE;
	SPI2->CR2 |= SPI_CR2_TXDMAEN;
	SPI2->CR1 |= SPI_CR1_MSTR;

	SPI2->CR1 |= SPI_CR1_SPE;
}

void setup_spi2_dma(void) {
	RCC->AHBENR |= RCC_AHBENR_DMA1EN;
	DMA1_Channel5->CCR &= ~DMA_CCR_EN;
	DMA1_Channel5->CPAR = (uint32_t)(&(SPI2->DR));
	//DMA1_Channel5->CMAR = (uint32_t)(&msg);
	DMA1_Channel5->CNDTR = 8;
	DMA1_Channel5->CCR &= ~DMA_CCR_MSIZE;
	DMA1_Channel5->CCR |=  DMA_CCR_MSIZE_0;
	DMA1_Channel5->CCR &= ~DMA_CCR_PSIZE;
	DMA1_Channel5->CCR |=  DMA_CCR_PSIZE_0;
	DMA1_Channel5->CCR |=  DMA_CCR_MINC;
	DMA1_Channel5->CCR |=  DMA_CCR_CIRC;
	DMA1_Channel5->CCR |=  DMA_CCR_DIR;
}

void enable_spi2_dma(void) {
	DMA1_Channel5->CCR |=  DMA_CCR_EN;
}

void init_i2c(void) {
	RCC->AHBENR |= RCC_AHBENR_GPIOBEN;

	GPIOB->AFR[0] &= ~0xFF000000;
	GPIOB->AFR[0] |=  0x11000000;

	GPIOB->MODER &= ~0x0000F000;
	GPIOB->MODER |=  0x0000A000;

	RCC->APB1ENR |= RCC_APB1ENR_I2C1EN;

	I2C1->CR1 &= ~I2C_CR1_PE;
	I2C1->CR1 &= ~I2C_CR1_ANFOFF;
	I2C1->CR1 &= ~I2C_CR1_ERRIE;
	I2C1->CR1 &= ~I2C_CR1_NOSTRETCH;

	I2C1->TIMINGR = 0;
	I2C1->TIMINGR &= ~I2C_TIMINGR_PRESC;
	I2C1->TIMINGR |= 0 << 28;
	I2C1->TIMINGR |= 3 << 20;
	I2C1->TIMINGR |= 1 << 16;
	I2C1->TIMINGR |= 3 << 8;
	I2C1->TIMINGR |= 9 << 0;

	I2C1->OAR1 &= ~I2C_OAR1_OA1EN;
	I2C1->OAR2 &= ~I2C_OAR2_OA2EN;
	I2C1->CR2 &= ~I2C_CR2_ADD10;
	I2C1->CR2 |= I2C_CR2_AUTOEND;

	I2C1->CR1 |= I2C_CR1_PE;
}


//===========================================================================
// 2.3 I2C helpers
//===========================================================================

void i2c_waitidle(void) {
	while((I2C1->ISR & I2C_ISR_BUSY) == I2C_ISR_BUSY);
}

void i2c_start(uint32_t devaddr, uint8_t size, uint8_t dir) {
	uint32_t tmpreg = I2C1->CR2;
	tmpreg &= ~(I2C_CR2_SADD | I2C_CR2_NBYTES | I2C_CR2_RELOAD | I2C_CR2_AUTOEND | I2C_CR2_STOP);
	if (dir == 1)
		tmpreg |= I2C_CR2_RD_WRN;
	else
		tmpreg &= ~I2C_CR2_RD_WRN;
	tmpreg |= ((devaddr <<1) & I2C_CR2_SADD) | ((size << 16) & I2C_CR2_NBYTES);
	tmpreg |= I2C_CR2_START;
	I2C1->CR2 = tmpreg;
}

void i2c_stop(void) {
	if (I2C1->ISR & I2C_ISR_STOPF)
		return;
	// Master: Generate STOP bit after current byte has been transferred.
	I2C1->CR2 |= I2C_CR2_STOP;
	// Wait until STOPF flag is reset
	while( (I2C1->ISR & I2C_ISR_STOPF) == 0);
	I2C1->ICR |= I2C_ICR_STOPCF; // Write to clear STOPF flag
}

int i2c_checknack(void) {
	if ((I2C1->ISR & I2C_ISR_NACKF) != 0)
		return 1;
	return 0;
}

void i2c_clearnack(void) {
	I2C1->ICR |= I2C_ICR_NACKCF;
}

int i2c_senddata(uint8_t devaddr, const void *data, uint8_t size) {
	int i;
	if (size <= 0 || data == 0) return -1;
	uint8_t *udata = (uint8_t*)data;
	i2c_waitidle();
	// Last argument is dir: 0 = sending data to the slave device.
	i2c_start(devaddr, size, 0);
	for(i=0; i<size; i++) {
		// TXIS bit is set by hardware when the TXDR register is empty and the
		// data to be transmitted must be written in the TXDR register. It is
		// cleared when the next data to be sent is written in the TXDR reg.
		// The TXIS flag is not set when a NACK is received.
		int count = 0;
		while( (I2C1->ISR & I2C_ISR_TXIS) == 0) {
			count += 1;
			if (count > 1000000) return -1;
			if (i2c_checknack()) { i2c_clearnack(); i2c_stop(); return -1; }
		}
		// TXIS is cleared by writing to the TXDR register.
		I2C1->TXDR = udata[i] & I2C_TXDR_TXDATA;
	}
	// Wait until TC flag is set or the NACK flag is set.
	while((I2C1->ISR & I2C_ISR_TC) == 0 && (I2C1->ISR & I2C_ISR_NACKF) == 0);

	if ( (I2C1->ISR & I2C_ISR_NACKF) != 0)
		return -1;
	i2c_stop();
	return 0;
}

int i2c_recvdata(uint8_t devaddr, void *data, uint8_t size) {
	int i;
	if (size <= 0 || data == 0) return -1;
	uint8_t *udata = (uint8_t*)data;
	i2c_waitidle();
	// Last argument is dir: 1 = receiving data from the slave device.
	i2c_start(devaddr, size, 1);
	for(i=0; i<size; i++) {
		int count = 0;
		while( (I2C1->ISR & I2C_ISR_RXNE) == 0) {
			count += 1;
			if (count > 1000000) return -1;
			if (i2c_checknack()) { i2c_clearnack(); i2c_stop(); return -1; }
		}
		udata[i] = I2C1->RXDR;
	}
	// Wait until TC flag is set or the NACK flag is set.
	while((I2C1->ISR & I2C_ISR_TC) == 0 && (I2C1->ISR & I2C_ISR_NACKF) == 0);
	if ( (I2C1->ISR & I2C_ISR_NACKF) != 0)
		return -1;
	i2c_stop();
	return 0;
}

//===========================================================================
// Main and supporting functions
//===========================================================================
void nano_wait(unsigned int n) {
    asm(    "        mov r0,%0\n"
            "repeat: sub r0,#83\n"
            "        bgt repeat\n" : : "r"(n) : "r0", "cc");
}

#define LED_ON  1
#define LED_OFF 0

#define HT16K33_BLINK_OFF    0
#define HT16K33_BLINK_2HZ    1
#define HT16K33_BLINK_1HZ    2
#define HT16K33_BLINK_HALFHZ 3

#define HT16K33_BLINK_CMD       0x80
#define HT16K33_BLINK_DISPLAYON 0x01
#define HT16K33_CMD_BRIGHTNESS  0xE0

static const uint8_t
  ledLUT[16] =
    { 0x3A, 0x37, 0x35, 0x34,
      0x28, 0x29, 0x23, 0x24,
      0x16, 0x1B, 0x11, 0x10,
      0x0E, 0x0D, 0x0C, 0x02 },
  buttonLUT[16] =
    { 0x07, 0x04, 0x02, 0x22,
      0x05, 0x06, 0x00, 0x01,
      0x03, 0x10, 0x30, 0x21,
      0x13, 0x12, 0x11, 0x31 };

uint16_t displaybuffer[8];

#define _BV(bit) (1 << (bit))

uint8_t keys[6], lastkeys[6];

void setLED(uint8_t x) {
	  if (x > 15) return;
	  x = ledLUT[x];
	  displaybuffer[x >> 4] |= _BV(x & 0x0F);
	}

void clrLED(uint8_t x) {
	  if (x > 15) return;
	  x = ledLUT[x];
	  displaybuffer[x >> 4] &= ~_BV(x & 0x0F);
	}

int main(void)
{
    // LED array SPI
    //setup_spi2_dma();
    //enable_spi2_dma();
    //init_spi2();

    // 2.2 Initialize I2C
    init_i2c();

    for(;;)
    {
    	//Initialization:

    	uint8_t data[17] = { 0x21, 0x00 };
		i2c_senddata(0x70, data, 1);

		data[0] = 0xA1;
		i2c_senddata(0x70, data, 1);

    	data[0] = HT16K33_BLINK_CMD | HT16K33_BLINK_DISPLAYON | (HT16K33_BLINK_OFF << 1);
    	i2c_senddata(0x70, data, 1);

    	data[0] = HT16K33_CMD_BRIGHTNESS | 15;
    	i2c_senddata(0x70, data, 1);

    	//read keys

    	memcpy(lastkeys, keys, sizeof(keys));

    	data[0] = 0x40;
    	i2c_senddata(0x70, data, 1);

    	i2c_recvdata(0x70, keys, 6);

		for (uint8_t i=0; i<6; i++) {
			//if (lastkeys[i] != keys[i]) {
			if (keys[i] != 0)
			{
				setLED(i);
			}
			else
			{
				clrLED(i);
			}
		}

    	//send displaybuffer over
    	data[0] = 0x00;
		for (uint8_t i=0; i<8; i++) {
			data[i*2+1] = displaybuffer[i] & 0xFF;
			data[i*2+2] = displaybuffer[i] >> 8;
		}
		i2c_senddata(0x70, data, 17);
    }

    // 2.5 Expander setup
    //init_tim7();
}
