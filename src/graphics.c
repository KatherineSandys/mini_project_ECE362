#include "stm32f0xx.h"
#include <stdint.h>
#include "lcd.h"
#include "graphics.h"

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

#define H_FONT_SPACING 2 //relative
#define V_FONT_SPACING 30 //total

int get_line_width(char* str, struct font* f)
{
	int w = 0;
	while ((*str != '\0') && (*str != '\n'))
	{
		w += f->character_desc_ptr[*str - '!' + 2].box_w + H_FONT_SPACING;
		str++;
	}
	return w;
}

int get_lines(char* str)
{
	int l = 1;
	while (*str != 0)
	{
		if (*str == '\n') l++;
		str++;
	}
	return l;
}

void draw_graphic_string(int x, int y, char* str, struct font * f)
{
	y -= V_FONT_SPACING * get_lines(str)/2;

	int need_line_width = 1;

	int x_initial = x;

	while (*str != '\0')
	{
		if (need_line_width)
		{
			x = x_initial - get_line_width(str, f)/2;
			need_line_width = 0;
		}

		if (*str == '\n')
		{
			y += V_FONT_SPACING;//f->character_desc_ptr[0].box_h;
			need_line_width = 1;
		}
		else if (*str == ' ')
		{
			x += 15;
		}
		else
		{
			draw_graphic_font(x, y, *str, f);
			x+= f->character_desc_ptr[*str - '!' + 2].box_w + H_FONT_SPACING;
		}
		str++;
	}
}

void draw_graphic_font(int x, int y, char c, struct font * f)
{
	struct font_descriptor c_desc = f->character_desc_ptr[c - '!' + 2];
	for (int xc = 0; xc < c_desc.box_w; xc++)
	{
		for (int yc = 0; yc < c_desc.box_h; yc++)
		{
			int offset =  (xc+yc*c_desc.box_w);
			char color = f->character_bitmap_ptr[c_desc.bitmap_index + offset/2];
			char color_masked = ((color >> (((offset % 2) == 0) * 4)) & 0xF);

			char c5 = ((2<<5)-1) - (color_masked*(2<<5))/(2<<4);
			char c6 = ((2<<6)-1) - (color_masked*(2<<6))/(2<<4);
			uint16_t fullcolor = ((uint16_t)c5 << 11) | ((uint16_t)c6 << 5) | ((uint16_t)c5 << 0);

			LCD_DrawPoint(x+xc, y+yc, fullcolor);
		}
	}
}
