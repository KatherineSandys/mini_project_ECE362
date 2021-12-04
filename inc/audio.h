#ifndef _audio_h_
#define _audio_h_

#include "stm32f0xx.h"
#include "ff.h"
#include "lcd.h"
//#include "tty.h"
//#include "commands.h"
#include <string.h>
#include <stdio.h>

typedef struct wav_header
{
  char ChunkID[4];
  uint32_t ChunkSize;
  char Format[4];
  char Subchunk1ID[4];
  uint32_t Subchunk1Size;
  uint16_t AudioFormat;
  uint16_t NumChannels;
  uint32_t SampleRate;
  uint32_t ByteRate;
  uint16_t BlockAlign;
  uint16_t BitsPerSample;
  char Subchunk2ID[4];
  uint32_t Subchunk2Size;
}wav_header;

#endif
