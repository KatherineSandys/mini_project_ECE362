#ifndef __TOUCH_H
#define __TOUCH_H
#include "stdlib.h"

struct point {
	uint16_t x;
	uint16_t y;
};

void init_touch();
struct point* get_touch();

#endif
