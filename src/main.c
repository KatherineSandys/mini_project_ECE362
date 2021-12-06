#include "stm32f0xx.h"
#include <string.h> // for memset() declaration
#include <math.h>   // for MA_PI
#include "keypad.h"
#include "lcd.h"
#include "graphics.h"
#include "images/pj.h"
#include "images/colorpallete.h"
#include "game.h"
#include "keypad.h"
#include "touch.h"

int main(void)
{
    wait_ms(1);
    initKeypad();
    wait_ms(1);
    initLCD();
    wait_ms(1);
    LCD_Clear(WHITE);

    //drawimg_4bit(0, 0, pj_map);

    game();

    for (;;)
    {

    }
}
