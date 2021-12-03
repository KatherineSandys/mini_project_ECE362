#include "game.h"


node * head = NULL;
int max_time = 1;
float curr_counter = 0;
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
        nano_wait(1500000000);
        clrLED(l->id);
        l = l->next;
    }
    l->next = add_node();
    setLED(l->id);
    nano_wait(1500000000);
    clrLED(l->id);
    l = l->next;
    setLED(l->id);
    nano_wait(1500000000);
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
        while(!(EXTI->PR & EXTI_PR_PR0) && active) {
            asm volatile ("wfi");
        }
        EXTI->PR |= EXTI_PR_PR0;

        for(int button = get_keypress(); button != -1; button = get_keypress()) {
            setLED(button);
            nano_wait(1000000000);
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
    nano_wait(1000000000);
    clrAllLEDs();
}

void TIM3_IRQHandler() {
    TIM3->SR &= ~TIM_SR_UIF;
    float time_ratio = 1 - (curr_counter / (max_time * rate));
    int width = 240 * time_ratio;
    if(curr_counter == 0) {
        LCD_DrawFillRectangle(0, 0, 240, 20, 0xFF);
    }
    curr_counter += 1;
    if (width != curr_width) {
        //LCD_DrawFillRectangle(0x0, 0 + 20 * (240 - width), width, 10 + 20 * (240 - width), 0xFF);
        LCD_DrawFillRectangle(0, 0, 240-curr_width, 20, curr_width*50);
        curr_width = width;
    }
//    if curr_counter = (max_time * TIM3->ARR)
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
           TIM3->PSC = 0;
           TIM3->ARR = 10-1;
           TIM3->DIER |= TIM_DIER_UIE;
           TIM3->CR1 |= TIM_CR1_CEN;
           rate = 48000000.0 / (TIM3->ARR + 1);
           int r = rate;
           printf("h");
   }
    NVIC_EnableIRQ(TIM3_IRQn); /* (1) */

    // Configure the corresponding mask bit (EXTI_IMR, EXTI_EMR)
    // Set the required bit of the software interrupt register (EXTI_SWIER)
    /* Configure NVIC for External Interrupt */
    /* (1) Enable Interrupt on EXTI0_1 */
    /* (2) Set priority for EXTI0_1 */
    NVIC_EnableIRQ(EXTI0_1_IRQn); /* (1) */
    // NVIC_SetPriority(EXTI0_1_IRQn,0); /* (2) */
    EXTI->IMR |= EXTI_IMR_MR0;
    //TRIGGER INTERRUPT \/\/\/\/
        //EXTI->SWIER |= EXTI_SWIER_SWIER0;

    //wait for start
//    while(!(EXTI->PR & EXTI_PR_PR0)) {
//        asm volatile ("wfi");
//    }
//    EXTI->PR |= EXTI_PR_PR0;
    while(get_keypress() == -1){
        nano_wait(15000000);
    }
    swap_mode();

    srandom(TIM2->CNT);


    head = add_node();
    head->next = add_node();
    active = true;
    while(active) {
        display_sequence();
        swap_mode();
        curr_counter = 0;
        active = read_sequence();
        swap_mode();
    }
    setAllLEDs();
}
