/*
 * audIO.h
 *
 *  Created on: May 2, 2015
 *      Author: Justin
 */

#ifndef AUDIO_H_
#define AUDIO_H_

#include <io.h>

extern volatile unsigned int *const AUDIO_DEVICE;
extern volatile unsigned int *const AUDIO_CONFIG;


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



///////////////////////////////////////
/********** AUDIO REGISTERS **********/
///////////////////////////////////////


#define AUDIO_LEFT 					(0)
#define AUDIO_RIGHT					(1)

#define BUF_THRESHOLD				(96)	// 75% of the 128 word FIFOs in the audio core

#define IOWR_AUDIO_ADDR(base, addr, data)		\
	IOWR(base, addr, data)

/********** Control Register **********/
#define AUDIO_CONTROL_REG			0

#define IOADDR_AUDIO_CONTROL()		\
	__IO_CALC_ADDRESS_NATIVE(AUDIO_DEVICE, AUDIO_CONTROL_REG)
#define IORD_AUDIO_CONTROL()		\
	IORD(AUDIO_DEVICE, AUDIO_CONTROL_REG)
#define IOWR_AUDIO_CONTROL(data)	\
	IOWR(AUDIO_DEVICE, AUDIO_CONTROL_REG, data)

#define AUDIO_CONTROL_RE_MASK		(0x00000001)
#define AUDIO_CONTROL_RE_OFFSET		(0)
#define AUDIO_CONTROL_WE_MASK		(0x00000002)
#define AUDIO_CONTROL_WE_OFFSET		(1)
#define AUDIO_CONTROL_CR_MASK		(0x00000004)
#define AUDIO_CONTROL_CR_OFFSET		(2)
#define AUDIO_CONTROL_CW_MASK		(0x00000008)
#define AUDIO_CONTROL_CW_OFFSET		(3)
#define AUDIO_CONTROL_RI_MASK		(0x00000100)
#define AUDIO_CONTROL_RI_OFFSET		(8)
#define AUDIO_CONTROL_WI_MASK		(0x00000200)
#define AUDIO_CONTROL_WI_OFFSET		(9)

/********** Fifospace **********/

#define AUDIO_FIFOSPACE_REG			(1)

#define IOADDR_AUDIO_FIFOSPACE()	\
	__IO_CALC_ADDRESS_NATIVE(AUDIO_DEVICE, AUDIO_FIFOSPACE_REG)
#define IORD_AUDIO_FIFOSPACE()		\
	IORD(AUDIO_DEVICE, AUDIO_FIFOSPACE_REG)
// this register is read only

#define AUDIO_FIFOSPACE_RARC_MASK	(0x000000FF)
#define AUDIO_FIFOSPACE_RARC_OFFSET	(0)
#define AUDIO_FIFOSPACE_RALC_MASK	(0x0000FF00)
#define AUDIO_FIFOSPACE_RALC_OFFSET	(8)

#define AUDIO_FIFOSPACE_WSRC_MASK	(0x00FF0000)
#define AUDIO_FIFOSPACE_WSRC_OFFSET	(16)
#define AUDIO_FIFOSPACE_WSLC_MASK	(0xFF000000)
#define AUDIO_FIFOSPACE_WSLC_OFFSET	(24)


/********** Left data register **********/
#define AUDIO_LEFTDATA_REG			(2)

#define IOADDR_AUDIO_LEFTDATA()		\
	__IO_CALC_ADDRESS_NATIVE(AUDIO_DEVICE, AUDIO_LEFTDATA_REG)
#define IORD_AUDIO_LEFTDATA()		\
	IORD(AUDIO_DEVICE, AUDIO_LEFTDATA_REG)
#define IOWR_AUDIO_LEFTDATA(data)	\
	IOWR(AUDIO_DEVICE, AUDIO_LEFTDATA_REG, data)


/********** Right data register **********/
#define AUDIO_RIGHTDATA_REG			(3)

#define IOADDR_AUDIO_RIGHTDATA()	\
	__IO_CALC_ADDRESS_NATIVE(AUDIO_DEVICE, AUDIO_RIGHTDATA_REG)
#define IORD_AUDIO_RIGHTDATA()		\
	IORD(AUDIO_DEVICE, AUDIO_RIGHTDATA_REG)
#define IOWR_AUDIO_RIGHTDATA(data)	\
	IOWR(AUDIO_DEVICE, AUDIO_RIGHTDATA_REG, data)



#endif /* AUDIO_H_ */
