#include "stm32f0xx.h"
#include <string.h> // for memset() declaration
#include <math.h>   // for MA_PI
#include "keypad.h"

int main(void)
{
	initKeypad();

    for(;;)
    {
/*
		for (uint8_t i=0; i<6; i++) {
			//if (lastkeys[i] != keys[i]) {
			//if (keys[i] != 0)
			//{
				setLED(i);
			//}
			//else
			//{
			//	clrLED(i);
			//}
		}*/

    	readKeys();

    	for (int x = 0; x < 3; x++)
    	{
    		for (int y = 0; y < 3; y++)
    		{
    			if (isKeyPressed(x*3+y) != 0)
    				setLED_xy(x, y);
    		}
    	}

    	sendLEDs();

    	//send displaybuffer over
    	/*data[0] = 0x00;
		for (uint8_t i=0; i<8; i++) {
			data[i*2+1] = displaybuffer[i] & 0xFF;
			data[i*2+2] = displaybuffer[i] >> 8;
		}
		i2c_senddata(0x70, data, 17);*/
    }


    // 2.5 Expander setup
    //init_tim7();
}
