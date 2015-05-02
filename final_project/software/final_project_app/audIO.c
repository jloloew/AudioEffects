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

/**
 * Checks if the read FIFO for the right channel has at least BUF_THRESHOLD data words
 * available. If it doesn't, then just returns 0. If it does, then data is read from
 * the FIFO up to a maximum of len words, and stored into buf.
 */
unsigned int audio_record_r(unsigned int *buf, int len)
{
	unsigned int data_words = audio_read_fifo_avail(AUDIO_RIGHT);
	if (data_words <= BUF_THRESHOLD)
		return 0;
	else
		return audio_read_fifo(buf, len, AUDIO_RIGHT);
}

/**
 * Checks if the read FIFO for the left channel has at least BUF_THRESHOLD data words
 * available. If it doesn't, then just returns 0. If it does, then data is read from
 * the FIFO up to a maximum of len words, and stored into buf.
 */
unsigned int audio_record_l(unsigned int *buf, int len)
{
	unsigned int data_words = audio_read_fifo_avail(AUDIO_LEFT);
	if (data_words <= BUF_THRESHOLD)
		return 0;
	else
		return audio_read_fifo(buf, len, AUDIO_LEFT);
}

/**
 * Checks if the write FIFO for the right channel has at least BUF_THRESHOLD space available.
 * If it doesn't, then just returns 0. If it does, then data from buf is written into the
 * FIFO, up to a maximum of len words.
 */
unsigned int audio_play_r(unsigned int *buf, int len)
{
	unsigned int space = audio_write_fifo_space(AUDIO_RIGHT);
		if (space <= BUF_THRESHOLD)
			return 0;
		else
			return audio_write_fifo(buf, len, AUDIO_RIGHT);
}

/**
 * Checks if the write FIFO for the left channel has at least BUF_THRESHOLD space available.
 * If it doesn't, then just returns 0. If it does, then data from buf is written into the
 * FIFO, up to a maximum of len words.
 */
unsigned int audio_play_l(unsigned int *buf, int len)
{
	unsigned int space = audio_write_fifo_space(AUDIO_LEFT);
	if (space <= BUF_THRESHOLD)
		return 0;
	else
		return audio_write_fifo(buf, len, AUDIO_LEFT);
}
