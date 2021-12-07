#include "audio.h"
#include "keypad.h"
#include "ff.h"
#include "diskio.h"

FATFS fs;

#define BUFFER_SIZE 4000
uint32_t buffer[BUFFER_SIZE];



/*
void init_DAC()
{
  RCC->APB1ENR |= RCC_APB1ENR_DACEN;
  RCC->AHBENR |= RCC_AHBENR_GPIOAEN;
  GPIOA->MODER |= GPIO_MODER_MODER4; //set pin A4 to analog

  DAC->CR &= ~DAC_CR_EN1;
  DAC->CR &= ~DAC_CR_TSEL1;
  DAC->CR |= DAC_CR_TSEL1_1; //tim7 trigger
  DAC->CR |= DAC_CR_DMAEN1 | DAC_CR_TEN1;
  DAC->CR |= DAC_CR_EN1;
}

void init_DMA(int* addr, int size)
{
	RCC->AHBENR |= RCC_AHBENR_DMA1EN;

	DMA1_Channel3->CNDTR = size;
	DMA1_Channel3->CMAR = addr;
	DMA1_Channel3->CPAR = &(DAC->DHR12L1);

	DMA1_Channel3->CCR &= ~DMA_CCR_EN;
	DMA1_Channel3->CCR |=  DMA_CCR_PL;
	DMA1_Channel3->CCR &= ~DMA_CCR_MSIZE;
	DMA1_Channel3->CCR |=  DMA_CCR_MSIZE_0;
	DMA1_Channel3->CCR &= ~DMA_CCR_PSIZE;
	DMA1_Channel3->CCR |=  DMA_CCR_PSIZE_0;
	DMA1_Channel3->CCR |=  DMA_CCR_MINC;
	DMA1_Channel3->CCR &= ~DMA_CCR_PINC;
	DMA1_Channel3->CCR |=  DMA_CCR_CIRC;
	DMA1_Channel3->CCR |=  DMA_CCR_DIR;
	DMA1_Channel3->CCR |= DMA_CCR_EN;
}

void init_timer7()
{
  //enable timer
  RCC->APB1ENR |= RCC_APB1ENR_TIM7EN;

  TIM7->CR1 &= ~TIM_CR1_CEN;
  TIM7->PSC = 0;
  TIM7->ARR =
  TIM7->CR2 &= ~TIM_CR2_MMS;
  TIM7->CR2 |= TIM_CR2_MMS_1; //set mms to update mode
  //this triggers an update event for the dac
  TIM7->CR1 |= TIM_CR1_CEN;
}*/

wav_header header;
FIL f;
FRESULT fr;
uint32_t read = 0;

void read_song()
{
  wait_ms(100);

  //mount sdcard
  fr = f_mount(&fs, "", 1);

  wait_ms(100);

  fr = f_open(&f, "tetris.wav", FA_READ);

  fr = f_read(&f, &header, sizeof(header), &read);

  init_audio(&header);
  //playfile(fp);
}



void init_audio(wav_header* head)
{
  //enable clocks for DMA, TIM7, and DAC
  RCC->APB1ENR |= RCC_APB1ENR_DACEN;
  RCC->AHBENR  |= RCC_AHBENR_DMA1EN;
  RCC->APB1ENR |= RCC_APB1ENR_TIM7EN;

  // configure dac
  DAC->CR &= ~DAC_CR_EN1;
  DAC->CR &= ~DAC_CR_TSEL1;
  DAC->CR |= DAC_CR_TSEL1_1; //tim7 trigger
  DAC->CR |= DAC_CR_DMAEN1 | DAC_CR_TEN1;

  // configure dma
  DMA1_Channel3->CCR &= ~DMA_CCR_EN;
  DMA1_Channel3->CNDTR = BUFFER_SIZE;
  DMA1_Channel3->CMAR = (uint32_t)&(buffer[0]);
  //16 bit size peripheral, 32 bit memory size. so we skip the 2nd channel's data
  DMA1_Channel3->CPAR = (uint32_t)&(DAC->DHR12L1);
  DMA1_Channel3->CCR &= ~(DMA_CCR_MSIZE | DMA_CCR_PSIZE);
  DMA1_Channel3->CCR |=  (DMA_CCR_MSIZE_1 | DMA_CCR_PSIZE_0);
  DMA1_Channel3->CCR |= DMA_CCR_PL;

  DMA1_Channel3->CCR |= DMA_CCR_MINC | DMA_CCR_DIR | DMA_CCR_CIRC;
  DMA1_Channel3->CCR |= DMA_CCR_HTIE;
  DMA1_Channel3->CCR |= DMA_CCR_TCIE;

  NVIC->ISER[0] |= 1 << DMA1_Ch2_3_DMA2_Ch1_2_IRQn;

  //configure tim7
  TIM7->CR1 &= ~TIM_CR1_CEN;
  TIM7->PSC = 0;
  TIM7->ARR = (48000000 / head->SampleRate)-1;
  TIM7->CR2 &= ~TIM_CR2_MMS;
  TIM7->CR2 |= TIM_CR2_MMS_1; //set mms to update mode

  //clear out buffer first:
  memset(buffer, 4000, 2*BUFFER_SIZE);

  DMA1_Channel3->CCR |= DMA_CCR_EN;
  DAC->CR |= DAC_CR_EN1;
  TIM7->CR1 |= TIM_CR1_CEN;
}

void DMA1_CH2_3_DMA2_CH1_2_IRQHandler()
{
#define HALF_BUFFER_BYTES BUFFER_SIZE*sizeof(*buffer)/2

	if (DMA1->ISR & DMA_ISR_HTIF3)
	{
		DMA1->IFCR |= DMA_IFCR_CHTIF3;

		//ensure we haven't hit the end of the audio
		if (f_size(&f)-f_tell(&f) < HALF_BUFFER_BYTES)
		{
			f_lseek(&f, sizeof(header));
		}

		//load the lower half of buffer
		f_read(&f, (uint8_t*)buffer, HALF_BUFFER_BYTES, (uint32_t*)&read);
		for (int i = 0; i < BUFFER_SIZE; i++)
		{
			*((uint16_t*)buffer + i) += 0x8000;
		}
	}
	if (DMA1->ISR & DMA_ISR_TCIF3)
	{
		DMA1->IFCR |= DMA_IFCR_CTCIF3;

		//load upper half

		//ensure we haven't hit the end of the audio
		if (f_size(&f)-f_tell(&f) < HALF_BUFFER_BYTES)
		{
			f_lseek(&f, sizeof(header));
		}

		f_read(&f, (uint8_t*)buffer+HALF_BUFFER_BYTES, HALF_BUFFER_BYTES, (uint32_t*)&read);

		for (int i = BUFFER_SIZE; i < BUFFER_SIZE*2; i++)
		{
			*((uint16_t*)buffer + i) += 0x8000;
		}
	}

}


/*
void playfile(FIL* fp)
{
  while (datalen < 512)
  {
	//read 512 bytes from file to buffer2
	fr = f_read(fp, buffer2, sizeof buffer2, &read);
    //wait for dma to complete
	while(!(DMA1_Channel3->ISR & DMA_ISR_TCIF3));
	DMA1_Channel3->ICFR |= DMA_ICFR_CTCIF3;
	datalen -= 512;

	//reconfigure dma to buffer2
	DMA1_Channel3->CCR &= ~DMA_CCR_EN;
	DMA1_Channel3->CMAR = buffer2;
	DMA1_Channel3->CCR |= DMA_CCR_EN;

	if(datalen < 512)
	  break;
	//read next 512 bytes to buffer1
	fr = f_read(fp, buffer1, sizeof buffer1, &read);
	//wait for dma
	while(!(DMA1_Channel3->ISR & DMA_ISR_TCIF3));
	DMA1_Channel3->ICFR |= DMA_ICFR_CTCIF3;
	datalen -= 512;

	//reconfigure dma to buffer1
	DMA1_Channel3->CCR &= ~DMA_CCR_EN;
	DMA1_Channel3->CMAR = buffer1;
	DMA1_Channel3->CCR |= DMA_CCR_EN;
  }
  //disable dma when finished
  DMA1_Channel3->CCR &= ~DMA_CCR_EN;

  //restart when finished
//  init_audio();
}*/




//init_audio()
//  load wav file
//  setup dma based on wav file attributes
//  setup timer based on wav file

