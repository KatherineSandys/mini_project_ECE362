#include "stm32f0xx.h"

void enable_sdcard() {
    GPIOB->BRR |= 0b100;
}

void disable_sdcard() {
    GPIOB->BSRR |= 0b100;
}

