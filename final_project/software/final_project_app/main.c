/*
 * main.c
 *
 *  Created on: May 1, 2015
 *      Author: Justin
 */

#include <stdio.h>
//#include "altera_up_avalon_audio.h"
//#include "altera_up_avalon_audio_regs.h"
//#include "priv/alt_file.h"
#include "audIO.h"


int main()
{
  int i;
  
  /*
  printf("control:\t0x%08x\n", control);
  printf("fifospace:\t0x%08x\n", fifospace);
  printf("leftdata:\t0x%08x\n", leftdata);
  printf("rightdata:\t0x%08x\n", rightdata);
  */
  
  /*
  printf("Testing alt_dev_list\n");
  i = 0;
  alt_dev *dev;
  alt_dev *next	= (alt_dev *)alt_dev_list.next;
  do {
	  dev = next;
	  next = (alt_dev *)dev->llist.next;
	  printf("%d:\tList name: %s\n", i++, dev->name);
  } while ((alt_llist *)next != &alt_dev_list);
  */
  
  // open the audio device
  /*
  alt_up_audio_dev *audio;
  audio = alt_up_audio_open_dev("/dev/null");
  if (audio == NULL) {
	  printf("Unable to open audio device.\n");
	  return 1;
  } else {
	  printf("Successfully opened audio device.\n");
  }
  */
  
  // Check how many data words the read FIFO for the right channel has.
  
  
  unsigned int buf[1000];
  printf("Reading buffer...");
  audio_record_r(buf, sizeof(buf));
//  alt_up_audio_record_r(audio, buf, sizeof(buf));
  printf(" Done.\n");
  
	  /*
	  int i;
	  
	  AUDIO[8] = 0x7FFFFFFF;
	  AUDIO[12] = 0x7FFFFFFF;
	  // set write enable bit
	  AUDIO[0] |= 0x00000020;
	  // unset write enable bit
	  AUDIO[0] &= ~0x00000020;
	  // delay
	  for (i = 0; i < 100; i++)
		  ;
	  AUDIO[8] = 0x80000000;
	  AUDIO[12] = 0x80000000;
	  // set write enable bit
	  AUDIO[0] |= 0x00000020;
	  // unset write enable bit
	  AUDIO[0] &= ~0x00000020;
	  // delay
	  for (i = 0; i < 100; i++)
		  ;
  }
  //*/
  return 0;
}
