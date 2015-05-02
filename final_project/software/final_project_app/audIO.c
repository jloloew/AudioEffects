/*
 * audIO.c
 *
 *  Created on: May 2, 2015
 *      Author: Justin
 */

#include "audIO.h"

volatile unsigned int *const AUDIO_DEVICE	= (unsigned int *)0x00000040;
volatile unsigned int *const AUDIO_CONFIG	= (unsigned int *)0x00000050;

#define CONTROL		((volatile unsigned int *const)AUDIO_DEVICE);
#define FIFOSPACE	((volatile unsigned int *const)(AUDIO_DEVICE + 1));
#define LEFT_DATA	((volatile unsigned int *const)(AUDIO_DEVICE + 2));
#define RIGHT_DATA	((volatile unsigned int *const)(AUDIO_DEVICE + 3));

// provides number of words of data available in the incoming FIFO: RALC or RARC
unsigned int audio_read_fifo_avail(int channel)
{
	// read the whole fifospace register
	unsigned int fifospace = IORD_AUDIO_FIFOSPACE();
	// extract the part for proper channel read space
	fifospace = (channel == AUDIO_LEFT) ?
			(fifospace & AUDIO_FIFOSPACE_RALC_MASK) >> AUDIO_FIFOSPACE_RALC_OFFSET
			:
			(fifospace & AUDIO_FIFOSPACE_RARC_MASK) >> AUDIO_FIFOSPACE_RARC_OFFSET;
	return fifospace;
}

// checks if the 
