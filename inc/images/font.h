#ifndef __FONT_H__
#define __FONT_H__

struct font_descriptor {
	int bitmap_index;
	int adv_w;
	int box_w;
	int box_h;
	int ofs_x;
	int ofs_y;
};

struct font {
	struct font_descriptor * character_desc_ptr;
	char * character_bitmap_ptr;
};

#endif
