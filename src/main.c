#include "stm32f0xx.h"
#include <string.h> // for memset() declaration
#include <math.h>   // for MA_PI
#include "keypad.h"
#include "lcd.h"
#include "graphics.h"
#include "images/pj.h"
#include "images/colorpallete.h"

int main(void)
{
	nano_wait(1000000);
	initKeypad();
	nano_wait(1000000);
	initLCD();
	nano_wait(1000000);

	drawimg_4bit(pj_map);

	int x, y;
	x = 0;
	y = 0;

    for(;;)
    {
    	int8_t k = get_keypress();
    	if (k != -1) setLED(k);

    	LCD_DrawPoint(x, y, ((2<<16) - 1)*(x*y)/(320*240));
    	x = x + 1;
    	if (x > 240)
    	{
    		y = y + 1;
    		x = 0;
    		if (y == 320)
    			y = 0;
    	}

		//nano_wait(1000000);

    }
}
