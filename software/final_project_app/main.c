/*
 * main.c
 *
 *  Created on: Apr 23, 2015
 *      Author: Justin
 */

#include <stdio.h>


static volatile int *LEDG			= (int *)0x00000080; // 8 LEDs
static volatile int *LEDR			= (int *)0x00000070; // 18 LEDs
static volatile int *AUDIO			= (int *)0x00000040;
static volatile int *AUDIO_CONFIG	= (int *)0x00000050;

int main()
{
	printf("System started.\n");
	
	*LEDR = 0xAAAAA;
	*LEDG = 0x55;
	
	return 0;
}
