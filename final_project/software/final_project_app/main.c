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
  
  audio_reset_audio_core();
  
  // Check how many data words the read FIFO for the right channel has.
  for (i = 0; i < 5; i++) {
	  printf("Left available: %u\n", audio_read_fifo_avail(AUDIO_LEFT));
	  printf("Right available: %u\n", audio_read_fifo_avail(AUDIO_RIGHT));
  }
  return 0;
  
  unsigned int buf[1000];
  printf("Reading buffer...");
  audio_record_r(buf, sizeof(buf));
  printf(" Done.\n");
  
  return 0;
}
