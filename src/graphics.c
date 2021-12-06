#include "stm32f0xx.h"
#include <stdint.h>
#include "lcd.h"

void drawimg_2bit(const char* map)
{
	int i = 0;
	char r[4];
	char g[4];
	char b[4];
	int color[4];
	for (int c = 0; c < 4; c++)
	{
		r[c] = map[i++];
		g[c] = map[i++];
		b[c] = map[i++];
		color[c] = 0;
		color[c] |= ((int)b[c]&0xF8) << 8;
		color[c] |= ((int)g[c]&0xFC) << 3;
		color[c] |= ((int)r[c]&0xF8) >> 3;
		i++;
	}

	int px = 0;

	for (int y = 0; y < 240; y++)
	{
		for (int x = 0; x < 320; x++)
		{
			int c_index = (map[i] >> (3-px)*2) & 0x3;
			px++;
			if (px == 4)
			{
				i++;
				px = 0;
			}
			LCD_DrawPoint(x, y, color[c_index]);
		}
	}
}

void drawimg_4bit(const char* map)
{
	int i = 0;
	char r[16];
	char g[16];
	char b[16];
	int color[16];
	for (int c = 0; c < 16; c++)
	{
		r[c] = map[i++];
		g[c] = map[i++];
		b[c] = map[i++];
		color[c] = 0;
		color[c] |= ((int)b[c]&0xF8) << 8;
		color[c] |= ((int)g[c]&0xFC) << 3;
		color[c] |= ((int)r[c]&0xF8) >> 3;
		i++;
	}

	int px = 0;

	for (int y = 0; y < 240; y++)
	{
		for (int x = 0; x < 320; x++)
		{
			int c_index = (map[i] >> (1-px)*4) & 0xF;
			px++;
			if (px == 2)
			{
				i++;
				px = 0;
			}
			LCD_DrawPoint(x, y, color[c_index]);
		}
	}

}
