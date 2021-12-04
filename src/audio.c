#include "audio.h"

FATFS fs;
char buffer1[512];
char buffer2[512];

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

void init_DMA()
{
  RCC->AHBENR |= RCC_AHBENR_DMA1EN;

  DMA1_Channel3->CCR &= ~DMA_CCR_EN;
  DMA1_Channel3->CNDTR = 512;
  DMA1_Channel3->CMAR = buffer1;
  DMA1_Channel3->CPAR = &(DAC->DHR12R1);
  DMA1_Channel3->CCR &= ~(DMA_CCR_MSIZE | DMA_CCR_PSIZE); //8 bit size
  DMA1_Channel3->CCR |= DMA_CCR_MINC | DMA_CCR_DIR | DMA_CCR_CIRC;
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
}

void read_song()
{
  wav_header* header;
  FIL *fp;
  FRESULT fr;
  int read;
  //mount sdcard
  f_mount(&fs, "0", 0);

  fr = f_open(fp, "tetris.wav", FA_READ);

  fr = f_read(fp, header, sizeof header, &read);

  fr = f_read(fp, buffer1, sizeof buffer1, &read);

}
