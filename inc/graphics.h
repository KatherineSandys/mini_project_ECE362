#ifndef __GRAPHICS_H__
#define __GRAPHICS_H__

#include "images/font.h"

void drawimg_2bit(int xi, int yi, const char* map);
void drawimg_4bit(int xi, int yi, const char* map);

void draw_graphic_string(int x, int y, char* str, struct font * f);
void draw_graphic_font(int x, int y, char c, struct font * f);

#endif
