#include "game.h"
#include "lcd.h"
#include <string.h>
#include "keypad.h"

node * head = NULL;
int max_time_ms = 4*1000;
int curr_counter = -1;
bool active = false;
int curr_width = 240;
float rate = 0;

node * add_node() {
    node * n = malloc(sizeof(*n));
    n->id = random() % 15;
    n->next = NULL;
    return n;
}

void display_sequence() {
    node * l = head;
    while(l->next != NULL) {
        setLED(l->id);
        wait_ms(500);
        clrLED(l->id);
        l = l->next;
    }
    l->next = add_node();
    setLED(l->id);
    wait_ms(500);
    clrLED(l->id);
    l = l->next;
    setLED(l->id);
    wait_ms(500);
    clrLED(l->id);}

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
        /*while(!(EXTI->PR & EXTI_PR_PR0) && active) {
            asm volatile ("wfi");
        }
        EXTI->PR |= EXTI_PR_PR0;*/

    	//time expired
    	if (curr_counter == max_time_ms) return false;

        for(int button = get_keypress(); button != -1; button = get_keypress()) {
            setLED(button);
            nano_wait(150000000);
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

    	itoa((max_time_ms-curr_counter)/100, time_remaining+1, 10);
    	time_remaining[0] = time_remaining[1];
    	time_remaining[1] = '.';

    	LCD_DrawFillRectangle(320/2-10, 240/2, 320/2 + 100, 180, WHITE);

    	LCD_DrawString(320/2 - 10, 240/2, BLACK, WHITE, time_remaining, 16, 0);

    }

    curr_counter += 1;

    //must go from 0 to 240 in max_time_ms cycles (this is a 1KHz timer)
    int pixel = (320 * curr_counter) / max_time_ms;

    LCD_DrawFillRectangle(pixel-1, 200+1, pixel, 240-1, RED);


}

void game() {
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
           int r = rate;
           printf("h");
   }
    NVIC_EnableIRQ(TIM3_IRQn); /* (1) */

    // Configure the corresponding mask bit (EXTI_IMR, EXTI_EMR)
    // Set the required bit of the software interrupt register (EXTI_SWIER)
    /* Configure NVIC for External Interrupt */
    /* (1) Enable Interrupt on EXTI0_1 */
    /* (2) Set priority for EXTI0_1 */
    //NVIC_EnableIRQ(EXTI0_1_IRQn); /* (1) */
    // NVIC_SetPriority(EXTI0_1_IRQn,0); /* (2) */
    //EXTI->IMR |= EXTI_IMR_MR0;
    //TRIGGER INTERRUPT \/\/\/\/
        //EXTI->SWIER |= EXTI_SWIER_SWIER0;

    //wait for start
//    while(!(EXTI->PR & EXTI_PR_PR0)) {
//        asm volatile ("wfi");
//    }
//    EXTI->PR |= EXTI_PR_PR0;

    LCD_Clear(WHITE);
    LCD_DrawRectangle(10, 10, 320-10, 240-10, BLACK);
    LCD_DrawString(60, 240/2, BLACK, WHITE, "Press any button to start", 16, 0);

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
    	LCD_DrawRectangle(50, 50, 320-50, 240-50, RED);
    	LCD_DrawString(120, 240/2, BLACK, WHITE, "....REMEMBER....", 16, 0);
        display_sequence();
        swap_mode();

        //reset timer
        curr_counter = 0;
        max_time_ms = 4*1000;
        LCD_Clear(WHITE);
        LCD_DrawRectangle(0, 200, 320, 240, BLACK);
        TIM3->CR1 |= TIM_CR1_CEN;

        active = read_sequence();

        //turn off timer
        TIM3->CR1 &= ~TIM_CR1_CEN;

        swap_mode();
    }

    setAllLEDs();
}
