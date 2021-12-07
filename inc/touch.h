#ifndef __TOUCH_H
#define __TOUCH_H
#include "stdlib.h"

typedef struct point {
	uint16_t x;
	uint16_t y;
}Point;

void init_touch();
Point* get_touch();

#endif
