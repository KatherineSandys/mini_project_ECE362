
//============================================================================
// keypad.c
//============================================================================

#include "stm32f0xx.h"
#include <stdint.h>
#include "keypad.h"
#include <string.h> // for memset() declaration

void nano_wait(unsigned int n) {
    asm(    "        mov r0,%0\n"
            "repeat: sub r0,#83\n"
            "        bgt repeat\n" : : "r"(n) : "r0", "cc");
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
	I2C1->TIMINGR |= 15 << 28;
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

// x,y as 0-3
void setLED_xy(uint8_t x, uint8_t y) {
	setLED(x*4+y);
}

void setLED(uint8_t x) {
	if (x > 15) return;
	x = ledLUT[x];
	displaybuffer[x >> 4] |= _BV(x & 0x0F);
}

void clrLED_xy(uint8_t x, uint8_t y) {
	uint8_t n = x*4+y;
	if (n > 15) return;
	n = ledLUT[n];
	displaybuffer[n >> 4] &= ~_BV(n & 0x0F);
}

void clrLED(uint8_t x) {
	if (x > 15) return;
	x = ledLUT[x];
	displaybuffer[x >> 4] &= ~_BV(x & 0x0F);
}

void sendLEDs()
{
	//send displaybuffer over
	uint8_t data[17];
	data[0] = 0x00;
	for (uint8_t i=0; i<8; i++) {
		data[i*2+1] = displaybuffer[i] & 0xFF;
		data[i*2+2] = displaybuffer[i] >> 8;
	}
	i2c_senddata(0x70, data, 17);
}

void readKeys()
{
	//read keys
	for (int i = 0; i < sizeof(keys); i++)
	{
		lastkeys[i] = keys[i];
	}

	uint8_t data = 0x40;
	i2c_senddata(0x70, &data, 1);

	i2c_recvdata(0x70, keys, 6);
}

uint8_t isKeyPressed(uint8_t k) {
  if (k > 15) return 0;
  k = buttonLUT[k];
  uint8_t ret = (keys[k>>4] & _BV(k & 0x0F));
  if (ret != 0)
	  return 1;
  return 0;
}
uint8_t wasKeyPressed(uint8_t k) {
  if (k > 15) return 0;
  k = buttonLUT[k];
  uint8_t ret = (lastkeys[k>>4] & _BV(k & 0x0F));
  if (ret != 0)
  	  return 1;
  return 0;
}

uint8_t justPressed(uint8_t k) {
  return (isKeyPressed(k) && (!wasKeyPressed(k)));
}
uint8_t justReleased(uint8_t k) {
  return ((!isKeyPressed(k)) && wasKeyPressed(k));
}

//remember last 8 key presses
int8_t last_key_presses[16];

//return index of last unprocessed key press. these are stored sequentially
// returns -1 if no keypress
int8_t get_keypress()
{
	//grab key at front
	int8_t ret_key = last_key_presses[0];

	//shift everyone
	for (int i = 0; i < sizeof(last_key_presses) - 1; i++)
	{
		last_key_presses[i] = last_key_presses[i + 1];
	}

	//fill with -1
	last_key_presses[sizeof(last_key_presses)-1] = -1;

	//return
	return ret_key;
}

void add_press_to_buffer(uint8_t key)
{
	//find an unused index and add the key
	for (int i = 0; i < sizeof(last_key_presses); i++)
	{
		if (last_key_presses[i] == -1)
		{
			last_key_presses[i] = key;
			return;
		}
		else if (i == sizeof(last_key_presses) - 1)
		{
			get_most_recent_keypress();
			last_key_presses[i] = key;
			return;
		}
	}
}

//init buffer to -1 (no press)
void init_buffer()
{
	for (int i = 0; i < sizeof(last_key_presses); i++)
	{
		last_key_presses[i] = -1;
	}
}

//if a key is pressed, add the press to the buffer
void update_keypress_buffer()
{
	for (int i = 0; i < 16; i++)
	{
		if (justPressed(i) != 0)
		{
			add_press_to_buffer(i);
			EXTI->SWIER |= EXTI_SWIER_SWIER0;
		}
	}
}

int toggle = 0;
void updateKeypad()
{
	init_i2c();
	//Initialization:
	uint8_t data[17] = { 0x21, 0x00 };
	i2c_senddata(HT16K33_ADDR, data, 1);
	data[0] = HT16K33_BLINK_CMD | HT16K33_BLINK_DISPLAYON | (HT16K33_BLINK_OFF << 1);
	i2c_senddata(HT16K33_ADDR, data, 1);
	data[0] = HT16K33_CMD_BRIGHTNESS | 15;
	i2c_senddata(HT16K33_ADDR, data, 1);
	data[0] = 0xA1;
	i2c_senddata(HT16K33_ADDR, data, 1);

	//nano_wait(1000000);

	readKeys();

	sendLEDs();

	update_keypress_buffer();

	RCC->AHBENR |= RCC_AHBENR_GPIOCEN;
	GPIOC->MODER &= ~0x0000F000;
	GPIOC->MODER |=  0x00005000;
	if (toggle == 0)
	{
		toggle = 1;
		GPIOC->BSRR  |=  0x00C00000;
	}
	else
	{
		toggle = 0;
		GPIOC->BSRR  |=  0x000000C0;
	}
}

void init_tim6() {
    RCC->APB1ENR |= RCC_APB1ENR_TIM6EN;
    TIM6->PSC = 480 - 1;
    TIM6->ARR = 3000 - 1;
    TIM6->DIER |= TIM_DIER_UIE;
    TIM6->CR1 |= TIM_CR1_CEN;
    NVIC->ISER[0] |= 1 << TIM6_DAC_IRQn;
}

void TIM6_DAC_IRQHandler(void) {
    TIM6->SR &= ~TIM_SR_UIF;

    updateKeypad();
}

void initKeypad()
{
	init_buffer();
	init_tim6();

}
