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
#include "audio.h"

int main(void)
{
    read_song();

    /*for(;;)
    {

    }*/
    wait_ms(1);
    initKeypad();

    wait_ms(1);
    initLCD();
    wait_ms(1);
    LCD_Clear(WHITE);

    init_touch();

    /*for (;;)
    {
    	struct point* p = get_touch();

    	LCD_DrawFillRectangle(p->x, p->y, p->x+5, p->y+5, BLACK);
    }*/

    for (;;)
    {
        game();
        game_over();
    }
}
