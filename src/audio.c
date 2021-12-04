#include "stm32f0xx.h"

void enable_sdcard() {
    GPIOB->BRR |= 0b1 << 12;
}

void disable_sdcard() {
    GPIOC->BSRR |= 0b1 << 12;
}

