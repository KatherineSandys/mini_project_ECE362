#include "game.h"
#include "lcd.h"
#include <string.h>
#include "keypad.h"
#include "graphics.h"
#include "images/font_arcade.h"

node * head = NULL;
int max_time_ms = 4*1000;
int curr_counter = -1;
bool active = false;
int curr_width = 240;
float rate = 0;
int score = 0;
bool hard = false;

node * add_node() {
    node * n = malloc(sizeof(*n));
    n->id = random() % 15;
    n->next = NULL;
    return n;
}

void draw_rectangle_grid() {
    int square_side = 180 / 2;
    int inner = square_side / 2;
    LCD_DrawRectangle(320/2 - square_side, 240/2 - square_side, 320/2 + square_side, 240/2 + square_side, RED);
    for(int i = 0; i < 4; i++) {
        for(int j = 0; j < 4; j++) {
            LCD_DrawRectangle(320/2 - square_side + i * inner, 240/2 - square_side + j * inner, 320/2 - square_side + (i + 1) * inner, 240/2 - square_side + (j + 1) * inner, RED);
        }
    }
}

void light_grid_rectangle(int id) {
    int square_side = 180 / 2;
    int inner = square_side / 2;
    int x = id / 4;
    int y = id % 4;

    LCD_DrawFillRectangle(320/2 - square_side + x * inner, 240/2 - square_side + (3-y) * inner, 320/2 - square_side + (x + 1) * inner, 240/2 - square_side + (3 - y + 1) * inner, RED);
}

void clear_grid_rectangle(int id) {
    int square_side = 180 / 2;
    int inner = square_side / 2;
    int x = id / 4;
    int y = id % 4;

    LCD_DrawFillRectangle(320/2 - square_side + x * inner, 240/2 - square_side + (3-y) * inner, 320/2 - square_side + (x + 1) * inner, 240/2 - square_side + (3 - y + 1) * inner, WHITE);
    LCD_DrawRectangle(320/2 - square_side + x * inner, 240/2 - square_side + (3-y) * inner, 320/2 - square_side + (x + 1) * inner, 240/2 - square_side + (3 - y + 1) * inner, RED);

}

void display_id(int id) {
    int delay = hard ? 100 : 400;
    light_grid_rectangle(id);
    setLED(id);
    wait_ms(delay);
    clrLED(id);
    clear_grid_rectangle(id);
    wait_ms(delay);
}

void display_sequence() {
    draw_rectangle_grid();
    node * l = head;
    while(l->next != NULL) {
        display_id(l->id);
        l = l->next;
    }
    l->next = add_node();
    display_id(l->id);
    l = l->next;
    display_id(l->id);
    //empty buffer in case of accidental clicks during display
    while(get_keypress() != -1){
        wait_ms(15);
    }
}

void free_list() {
    while(head != NULL) {
        node * temp = head;
        head = head -> next;
        free(temp);
    }
}

bool read_sequence() {
    node * l = head;
    while (l != NULL && active) {
    	//time expired
    	if (curr_counter == max_time_ms) return false;

        for(int button = get_keypress(); button != -1; button = get_keypress()) {
            setLED(button);
            wait_ms(150);
            clrLED(button);
            if (button != l->id) {
                free_list();
                return false;
            }
            l = l->next;
        }

    }
    return active ? true : false;
}

void swap_mode() {
    setAllLEDs();
    wait_ms(500);
    clrAllLEDs();
}

void TIM3_IRQHandler() {
    TIM3->SR &= ~TIM_SR_UIF;

    if (curr_counter == max_time_ms) return;

    //if at a second boundary, draw the digits.
    if (curr_counter % 100 == 0)
    {
    	char time_remaining[5];
    	int diff = (max_time_ms-curr_counter) / 100;
    	itoa(diff, time_remaining+1, 10);
    	if (diff > 10) {
    	    time_remaining[0] = time_remaining[1];
            time_remaining[1] = '.';
    	}
    	else {
            time_remaining[0] = '.';
    	}

    	LCD_DrawFillRectangle(320/2-10, 240/2, 320/2 + 100, 180, WHITE);

    	LCD_DrawString(320/2 - 10, 240/2, BLACK, WHITE, time_remaining, 16, 0);

    }

    curr_counter += 1;

    //must go from 0 to 240 in max_time_ms cycles (this is a 1KHz timer)
    int pixel = (320 * curr_counter) / max_time_ms;

    LCD_DrawFillRectangle(pixel-1, 200+1, pixel, 240-1, RED);


}

void game_over() {
    setAllLEDs();
    LCD_Clear(WHITE);
    LCD_DrawRectangle(50, 50, 320-50, 240-50, RED);
    //LCD_DrawString(120, 240/2 - 16, BLACK, WHITE, "Game Over", 16, 0);
    draw_graphic_string(320/2, 240/2, "Game\nOver", &font_arcade);
    char temp[5];
    char score_arr[15] = {'S', 'c', 'o', 'r', 'e', ':', ' '};
    itoa(score, temp, 10);
    strcat(score_arr, temp);
    LCD_DrawString(120, 150, BLACK, WHITE, score_arr, 16, 0);
}

void display_score_corner() {
    //display score
    char temp[5];
    char score_arr[15] = {'S', 'c', 'o', 'r', 'e', ':', ' '};
    itoa(score, temp, 10);
    strcat(score_arr, temp);
    LCD_DrawString(5, 5, BLACK, WHITE, score_arr, 16, 0);
}

void game() {
    //Timer enables
    if (!(RCC->APB1ENR & RCC_APB1ENR_TIM2EN)) {
            RCC->APB1ENR |= RCC_APB1ENR_TIM2EN;
            TIM2->PSC = 0;
            TIM2->ARR = 0xffffffff;
            TIM2->CR1 |= TIM_CR1_CEN;
    }
    if (!(RCC->APB1ENR & RCC_APB1ENR_TIM3EN)) {
           RCC->APB1ENR |= RCC_APB1ENR_TIM3EN;
           TIM3->PSC = 48-1;
           TIM3->ARR = 1000-1;
           TIM3->DIER |= TIM_DIER_UIE;
           rate = (48000000.0 / TIM3->PSC + 1) / (TIM3->ARR + 1);
   }

    NVIC_EnableIRQ(TIM3_IRQn); /* (1) */

    LCD_Clear(WHITE);
    LCD_DrawRectangle(10, 10, 320-10, 240-10, BLACK);
    //LCD_DrawString(60, 240/2, BLACK, WHITE, "Press any button to start", 16, 0);

    //LCD_DrawFillRectangle(40, 60, 320-40, 240-60, WHITE);
    draw_graphic_string(320/2, 240/2, "Press any\nbutton to\nstart", &font_arcade);

    max_time_ms = hard ? max_time_ms / 2 : max_time_ms;

    while(get_keypress() == -1){
        wait_ms(15);
    }
    swap_mode();

    srandom(TIM2->CNT);


    head = add_node();
    head->next = add_node();

    active = true;

    while(active) {
    	LCD_Clear(WHITE);
    	LCD_DrawString(100, 5, BLACK, WHITE, "....REMEMBER....", 16, 0);
    	//display score
    	display_score_corner();

        display_sequence();

        LCD_Clear(WHITE);
        LCD_DrawString(320/2 - 10, 240/2, BLACK, WHITE, "Go!", 16, 0);
        swap_mode();

        //reset timer
        curr_counter = 0;
        LCD_Clear(WHITE);
        LCD_DrawRectangle(0, 200, 320, 240, BLACK);
        //display score
        display_score_corner();

        TIM3->CR1 |= TIM_CR1_CEN;

        active = read_sequence();
        score += active ? 1 : 0;
        max_time_ms += hard ? 500 : 1000;

        //turn off timer
        TIM3->CR1 &= ~TIM_CR1_CEN;

        swap_mode();
    }

    game_over();
}
