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

int audio_read_fifo(unsigned int *buf, int len, int channel) {
	unsigned int fifospace;
	int count = 0;
	while (count < len) {
		// read the whole fifospcae register
		fifospace = IORD_AUDIO_FIFOSPACE();
		// extract the part for proper Channel Read Space
		fifospace = (channel == AUDIO_LEFT) ?
			(fifospace & AUDIO_FIFOSPACE_RALC_MASK) >> AUDIO_FIFOSPACE_RALC_OFFSET
			:
			(fifospace & AUDIO_FIFOSPACE_RARC_MASK) >> AUDIO_FIFOSPACE_RARC_OFFSET;
		if (fifospace > 0) {
			buf[count] = (channel == AUDIO_LEFT) ?
				IORD_AUDIO_LEFTDATA():
				IORD_AUDIO_RIGHTDATA();
			count ++;
		}
		else {
			//no more data to read
			break;
		}
	}
	return count;
}

int audio_write_fifo(unsigned int *buf, int len, int channel) {
	unsigned int fifospace;
	int count = 0;
	while (count < len) {
		//read the whole fifospace register
		fifospace = IORD_AUDIO_FIFOSPACE();
		//extract the part for left Channel Write Space
		fifospace = (channel == AUDIO_LEFT) ?
			(fifospace & AUDIO_FIFOSPACE_WSLC_MASK) >> AUDIO_FIFOSPACE_WSLC_OFFSET :
			(fifospace & AUDIO_FIFOSPACE_WSRC_MASK) >> AUDIO_FIFOSPACE_WSRC_OFFSET;
		if (fifospace > 0) {
			if (channel == AUDIO_LEFT)
				IOWR_AUDIO_LEFTDATA(buf[count++]);
			else 
				IOWR_AUDIO_RIGHTDATA(buf[count++]);
		}
		else {
			//no more space to write
			break;
		}
	}
	return count;
}

unsigned int audio_read_fifo_head(int channel) {
	return ( (channel == AUDIO_LEFT) ? IORD_AUDIO_LEFTDATA() :
					IORD_AUDIO_RIGHTDATA() );
}

void audio_write_fifo_head(unsigned int data, int channel) {
	if (channel == AUDIO_LEFT)
		IOWR_AUDIO_LEFTDATA(data);
	else
		IOWR_AUDIO_RIGHTDATA(data);
}
















	

// checks if the 
