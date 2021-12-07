
//============================================================================
// touch.c
//============================================================================

#include "stm32f0xx.h"
#include <stdint.h>
#include "touch.h"
#include "keypad.h"
#include <string.h> // for memset() declaration

#define X_PLUS 0
#define Y_PLUS 1
#define X_MINUS 2
#define Y_MINUS 3
//*
#define IN_EDGE 50.0f
#define CAL_BOX_WIDTH 10.0f
#define IN_DIST (IN_EDGE+CAL_BOX_WIDTH/2.0f)

#define IN_POINT_0_X (IN_DIST)
#define IN_POINT_0_Y (IN_DIST)
#define IN_POINT_1_X (320.0f-IN_DIST)
#define IN_POINT_1_Y (IN_DIST)
#define IN_POINT_2_X (IN_DIST)
#define IN_POINT_2_Y (240.0f-IN_DIST)
#define IN_POINT_3_X (320.0f-IN_DIST)
#define IN_POINT_3_Y (240.0f-IN_DIST)

#define CAL_POINT_0_X 92.0f
#define CAL_POINT_0_Y 575.0f
#define CAL_POINT_1_X 410.0f
#define CAL_POINT_1_Y 572.0f

#define CAL_POINT_2_X 131.0f
#define CAL_POINT_2_Y 377.0f
#define CAL_POINT_3_X 381.0f
#define CAL_POINT_3_Y 380.0f

//#define SLOPE_X_0 ((IN_POINT_1_X-IN_POINT_0_X)/(CAL_POINT_1_X-CAL_POINT_0_X) + 0.1)
#define SLOPE_X_1 ((IN_POINT_3_X-IN_POINT_2_X)/(CAL_POINT_3_X-CAL_POINT_2_X) + 0.1)
//#define SLOPE_Y_0 ((IN_POINT_2_Y-IN_POINT_0_Y)/(CAL_POINT_2_Y-CAL_POINT_0_Y) - 0.2)
#define SLOPE_Y_1 ((IN_POINT_3_Y-IN_POINT_1_Y)/(CAL_POINT_3_Y-CAL_POINT_1_Y) - 0.0)

//#define INTERCEPT_X_0 ((IN_POINT_0_X - CAL_POINT_0_X*SLOPE_X_0) + 0.0f)
#define INTERCEPT_X_1 ((IN_POINT_2_X - CAL_POINT_2_X*SLOPE_X_1) + 0.0f)

//#define INTERCEPT_Y_0 ((IN_POINT_0_Y - CAL_POINT_0_Y*SLOPE_Y_0) - 0.0f)
#define INTERCEPT_Y_1 ((IN_POINT_3_Y - CAL_POINT_3_Y*SLOPE_Y_1) + 113.0f)
/*/
/*
#define SLOPE_X_1 0.6
#define INTERCEPT_X_0 10.0
#define SLOPE_Y_0 0.6
#define INTERCEPT_Y_0 10.0*/
/*
#define SLOPE_X_1 1
#define INTERCEPT_X_0 0
#define SLOPE_Y_0 1
#define INTERCEPT_Y_0 0
*/
void set_to_output(uint8_t pin)
{
	GPIOA->MODER &= ~(0b11 << (pin * 2));
	GPIOA->MODER |=  (0b01 << (pin * 2));
}

void set_to_input(uint8_t pin)
{
	GPIOA->MODER &= ~(0b11 << (pin * 2));
}

void set_low(uint8_t pin)
{
	GPIOA->BSRR  |= 1 << (pin+16);
}

void set_high(uint8_t pin)
{
	GPIOA->BSRR  |= 1 << pin;
}

void set_to_analog(uint8_t pin)
{
	GPIOA->MODER |=  (0b11 << (pin * 2));
}

uint16_t get_analog(uint8_t pin)
{
	RCC->AHBENR |= RCC_AHBENR_GPIOAEN;
	set_to_analog(pin);

	ADC1->CHSELR |= 1 << pin;
	while(!(ADC1->ISR & ADC_ISR_ADRDY));
	ADC1->CR |= ADC_CR_ADSTART;
	while (!(ADC1->ISR & ADC_ISR_EOC));
	return ADC1->DR & 0xFFFF;
}

void init_touch()
{
	RCC->APB2ENR |= RCC_APB2ENR_ADCEN;
	RCC->CR2 |= RCC_CR2_HSI14ON;
	while(!(RCC->CR2  & RCC_CR2_HSI14RDY));
	ADC1->CR |= ADC_CR_ADEN;
	while(!(ADC1->ISR & ADC_ISR_ADRDY));
	ADC1->CFGR1 |= ADC_CFGR1_DISCEN;
}

struct point current_touch;
struct point last_touch;

Point* get_touch()
{
	last_touch = current_touch;

	set_to_output(X_PLUS);
	set_to_output(X_MINUS);
	set_high(X_PLUS);
	set_low(X_MINUS);

	set_to_input(Y_PLUS);
	set_to_input(Y_MINUS);
	wait_ms(1);
	uint16_t x = get_analog(Y_PLUS);

	set_to_output(Y_PLUS);
	set_to_output(Y_MINUS);
	set_high(Y_PLUS);
	set_low(Y_MINUS);

	set_to_input(X_PLUS);
	set_to_input(X_MINUS);
	wait_ms(1);
	uint16_t y = get_analog(X_PLUS);

	current_touch.x = ((x * (int)(320*SLOPE_X_1)) / ((2 << 10) -1) + (int)INTERCEPT_X_1);
	current_touch.y = (240+((y * (int)(240*SLOPE_Y_1)) / ((2 << 10) -1) + (int)INTERCEPT_Y_1));

	set_to_input(X_PLUS);
	set_to_input(X_MINUS);
	set_to_input(Y_PLUS);
	set_to_input(Y_MINUS);
	wait_ms(5);

	return &current_touch;
}
