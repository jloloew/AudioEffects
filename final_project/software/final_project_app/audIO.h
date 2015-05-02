/*
 * audIO.h
 *
 *  Created on: May 2, 2015
 *      Author: Justin
 */

#ifndef AUDIO_H_
#define AUDIO_H_

#include <io.h>

/********** FUNCTIONS **********/
// provides number of words of data available in the incoming FIFO: RALC or RARC
unsigned int audio_read_fifo_avail(int channel);
int audio_read_fifo(unsigned int *buf, int len, int channel);

int audio_write_fifo(unsigned int *buf, int len, int channel);

unsigned int audio_read_fifo_head(int channel);
void audio_write_fifo_head(unsigned int data, int channel);

unsigned int audio_record_r(unsigned int *buf, int len);
unsigned int audio_record_l(unsigned int *buf, int len);

unsigned int audio_play_r(unsigned int *buf, int len);
unsigned int audio_play_l(unsigned int *buf, int len);


/********** GENERAL DEFINES **********/

extern volatile unsigned int *const AUDIO_DEVICE;
extern volatile unsigned int *const AUDIO_CONFIG;

#define AUDIO_LEFT 					(2)
#define AUDIO_RIGHT					(3)

/********** FIFOSPACE **********/

#define AUDIO_FIFOSPACE_REG			(1)

#define AUDIO_FIFOSPACE_RARC_MASK	(0x000000FF)
#define AUDIO_FIFOSPACE_RARC_OFFSET	(0)
#define AUDIO_FIFOSPACE_RALC_MASK	(0x0000FF00)
#define AUDIO_FIFOSPACE_RALC_OFFSET	(8)

#define AUDIO_FIFOSPACE_WSRC_MASK	(0x00FF0000)
#define AUDIO_FIFOSPACE_WSRC_OFFSET	(16)
#define AUDIO_FIFOSPACE_WSLC_MASK	(0xFF000000)
#define AUDIO_FIFOSPACE_WSLC_OFFSET	(24)

#define IORD_AUDIO_FIFOSPACE()	\
	IORD(AUDIO_DEVICE, AUDIO_FIFOSPACE_REG)

#endif /* AUDIO_H_ */
