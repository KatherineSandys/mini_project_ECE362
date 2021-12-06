#ifndef __KEYPAD_H
#define __KEYPAD_H
#include "stdlib.h"

#define LED_ON  1
#define LED_OFF 0

#define HT16K33_ADDR         0x70

#define HT16K33_BLINK_OFF    0
#define HT16K33_BLINK_2HZ    1
#define HT16K33_BLINK_1HZ    2
#define HT16K33_BLINK_HALFHZ 3

#define HT16K33_BLINK_CMD       0x80
#define HT16K33_BLINK_DISPLAYON 0x01
#define HT16K33_CMD_BRIGHTNESS  0xE0

// x,y as 0-3
void setLED_xy(uint8_t x, uint8_t y);
void setLED(uint8_t x);
void setAllLEDs();
void clrLED_xy(uint8_t x, uint8_t y);
void clrLED(uint8_t x);
void clrAllLEDs();
void sendLEDs();

void wait_ms(unsigned int ms);
void readKeys();
uint8_t isKeyPressed(uint8_t k);
uint8_t wasKeyPressed(uint8_t k);
uint8_t justPressed(uint8_t k);
uint8_t justReleased(uint8_t k);
int8_t get_keypress();
void updateKeypad();
void initKeypad();

#endif
