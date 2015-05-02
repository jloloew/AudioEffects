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


void audio_enable_read_interrupt()
{
	unsigned int ctrl_reg = IORD_AUDIO_CONTROL();
	// set RE to 1 while maintaining the other bits
	ctrl_reg |= AUDIO_CONTROL_RE_MASK;
	IOWR_AUDIO_CONTROL(ctrl_reg);
}

void audio_disable_read_interrupt()
{
	unsigned int ctrl_reg = IORD_AUDIO_CONTROL();
	// set RE to 0 while maintaining the other bits
	ctrl_reg &= ~AUDIO_CONTROL_RE_MASK;
	IOWR_AUDIO_CONTROL(ctrl_reg);
}

void audio_enable_write_interrupt() {
	unsigned int ctrl_reg;
	ctrl_reg = IORD_AUDIO_CONTROL(); 
	// set WE to 1 while maintaining other bits the same
	ctrl_reg |= AUDIO_CONTROL_WE_MASK;
	IOWR_AUDIO_CONTROL(ctrl_reg);
}

void audio_disable_write_interrupt() {
	unsigned int ctrl_reg;
	ctrl_reg = IORD_AUDIO_CONTROL(); 
	// set WE to 0 while maintaining other bits the same
	ctrl_reg &= ~AUDIO_CONTROL_WE_MASK;
	IOWR_AUDIO_CONTROL(ctrl_reg);
}

int audio_read_interrupt_pending()
{
	unsigned int ctrl_reg = IORD_AUDIO_CONTROL();
	// return RI
	return (ctrl_reg & AUDIO_CONTROL_RI_MASK) ? 1 : 0;
}

int audio_write_interrupt_pending()
{
	unsigned int ctrl_reg = IORD_AUDIO_CONTROL();
	// return WI
	return (ctrl_reg & AUDIO_CONTROL_WI_MASK) ? 1 : 0;
}

void audio_reset_audio_core()
{
	unsigned int ctrl_reg = IORD_AUDIO_CONTROL();
	// set CR and CW to 1 while maintaining the other bits
	ctrl_reg |= AUDIO_CONTROL_CR_MASK;
	ctrl_reg |= AUDIO_CONTROL_CW_MASK;
	IOWR_AUDIO_CONTROL(ctrl_reg);
	// set CR and CW to 0 while maintaining the other bits
	ctrl_reg &= ~AUDIO_CONTROL_CR_MASK;
	ctrl_reg &= ~AUDIO_CONTROL_CW_MASK;
	IOWR_AUDIO_CONTROL(ctrl_reg);
}

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
 * Provides the amount of empty space available in the outgoing FIFO: WSLC or WSRC
 */
unsigned int audio_write_fifo_space(int channel)
{
	unsigned int fifospace;
	// read the whole fifospace register
	fifospace = IORD_AUDIO_FIFOSPACE();
	// extract the part for proper Channel Read Space
	fifospace = (channel == AUDIO_LEFT) ?
			(fifospace & AUDIO_FIFOSPACE_WSLC_MASK) >> AUDIO_FIFOSPACE_WSLC_OFFSET
			:
			(fifospace & AUDIO_FIFOSPACE_WSRC_MASK) >> AUDIO_FIFOSPACE_WSRC_OFFSET;
	return fifospace;
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

void audio_enable_write_interrupt() {
	unsigned int ctrl_reg;
	ctrl_reg = IORD_AUDIO_CONTROL(); 
	// set WE to 1 while maintaining other bits the same
	ctrl_reg |= AUDIO_CONTROL_WE_MSK;
	IOWR_AUDIO_CONTROL(ctrl_reg);
}

void audio_disable_write_interrupt() {
	unsigned int ctrl_reg;
	ctrl_reg = IORD_AUDIO_CONTROL(); 
	// set WE to 0 while maintaining other bits the same
	ctrl_reg &= ~AUDIO_CONTROL_WE_MSK;
	IOWR_AUDIO_CONTROL(ctrl_reg);
}
























