#include "game.h"


node * head = NULL;

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
        nano_wait(2000000000);
        clrLED(l->id);
        l = l->next;
    }
    l->next = add_node();
    setLED(l->id);
    nano_wait(2000000000);
    clrLED(l->id);
    l = l->next;
    setLED(l->id);
    nano_wait(2000000000);
    clrLED(l->id);}

void start_game() {
    if (!(RCC->APB1ENR & RCC_APB1ENR_TIM2EN)) {
            RCC->APB1ENR |= RCC_APB1ENR_TIM2EN;
            TIM2->PSC = 0;
            TIM2->ARR = 0xffffffff;
            TIM2->CR1 |= TIM_CR1_CEN;
    }
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

    srandom(TIM2->CNT);

    head = add_node();
    head->next = add_node();
    display_sequence();
}

bool read_sequence() {
    node * l = head;
    while (l != NULL) {
        while(!(EXTI->PR & EXTI_PR_PR0)) {
            asm volatile ("wfi");
        }
        //read button
        int button = 5;
        if (button != l->id) {
            return false;
        }
        l = l->next;
    }
    return true;
}
