#include "stm32f0xx.h"
#include <string.h> // for memset() declaration
#include <math.h>   // for MA_PI
#include "keypad.h"

int main(void)
{
	nano_wait(1000000);

	initKeypad();

	nano_wait(1000000);

    for(;;)
    {
    	int8_t k = get_most_recent_keypress();
    	if (k != -1) setLED(k);
    }
}
