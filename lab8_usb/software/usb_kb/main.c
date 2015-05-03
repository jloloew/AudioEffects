/*---------------------------------------------------------------------------
  --      main.c                                                    	   --
  --      Christine Chen                                                   --
  --      Ref. DE2-115 Demonstrations by Terasic Technologies Inc.         --
  --      Fall 2014                                                        --
  --                                                                       --
  --      For use with ECE 298 Experiment 7                                --
  --      UIUC ECE Department                                              --
  ---------------------------------------------------------------------------*/

#include <stdio.h>
#include <string.h>
#include <stdlib.h>
#include <io.h>
#include <fcntl.h>

#include "system.h"
#include "alt_types.h"
#include <unistd.h>  // usleep 
#include "sys/alt_irq.h"

#include "cy7c67200.h"
#include "usb.h"
#include "lcp_cmd.h"
#include "lcp_data.h"


//----------------------------------------------------------------------------------------//
//
//                                Main function
//
//----------------------------------------------------------------------------------------//
int main(void)
{
	alt_u16 intStat;
	alt_u16 usb_ctl_val;
	static alt_u16 ctl_reg = 0;
	static alt_u16 no_device = 0;
	alt_u16 fs_device = 0;
	int keycode = 0;
	alt_u8 toggle = 0;
	alt_u8 data_size;

	alt_u16 code;
	int i,hot_plug_count;
	

	printf("USB keyboard setup...\n\n");

	//----------------------------------------SIE1 initial---------------------------------------------------//
	USB_HOT_PLUG:
	UsbSoftReset();

	// STEP 1a:
	UsbWrite (HPI_SIE1_MSG_ADR, 0);
	UsbWrite (HOST1_STAT_REG, 0xFFFF);

	/* Set HUSB_pEOT time */
	UsbWrite(HUSB_pEOT, 600); // adjust the according to your USB device speed

	usb_ctl_val = SOFEOP1_TO_CPU_EN | RESUME1_TO_HPI_EN;// | SOFEOP1_TO_HPI_EN;
	UsbWrite(HPI_IRQ_ROUTING_REG, usb_ctl_val);

	intStat = A_CHG_IRQ_EN | SOF_EOP_IRQ_EN ;
	UsbWrite(HOST1_IRQ_EN_REG, intStat);
	// STEP 1a end

	// STEP 1b begin
	UsbWrite(COMM_R0,0x0000);//reset time
	UsbWrite(COMM_R1,0x0000);  //port number
	UsbWrite(COMM_R2,0x0000);  //r1
	UsbWrite(COMM_R3,0x0000);  //r1
	UsbWrite(COMM_R4,0x0000);  //r1
	UsbWrite(COMM_R5,0x0000);  //r1
	UsbWrite(COMM_R6,0x0000);  //r1
	UsbWrite(COMM_R7,0x0000);  //r1
	UsbWrite(COMM_R8,0x0000);  //r1
	UsbWrite(COMM_R9,0x0000);  //r1
	UsbWrite(COMM_R10,0x0000);  //r1
	UsbWrite(COMM_R11,0x0000);  //r1
	UsbWrite(COMM_R12,0x0000);  //r1
	UsbWrite(COMM_R13,0x0000);  //r1
	UsbWrite(COMM_INT_NUM,HUSB_SIE1_INIT_INT); //HUSB_SIE1_INIT_INT
	IOWR(CY7C67200_BASE,HPI_MAILBOX,COMM_EXEC_INT);

	while (!(IORD(CY7C67200_BASE,HPI_STATUS) & 0xFFFF) )  //read sie1 msg register
	{
	}
	while (IORD(CY7C67200_BASE,HPI_MAILBOX) != COMM_ACK)
	{
		printf("[ERROR]:1:routine mailbox data is %x\n",IORD(CY7C67200_BASE,HPI_MAILBOX));
		goto USB_HOT_PLUG;
	}
	// STEP 1b end

	// STEP 2 begin
	UsbWrite(COMM_INT_NUM,HUSB_RESET_INT); //husb reset
	UsbWrite(COMM_R0,0x003c);//reset time
	UsbWrite(COMM_R1,0x0000);  //port number
	UsbWrite(COMM_R2,0x0000);  //r1
	UsbWrite(COMM_R3,0x0000);  //r1
	UsbWrite(COMM_R4,0x0000);  //r1
	UsbWrite(COMM_R5,0x0000);  //r1
	UsbWrite(COMM_R6,0x0000);  //r1
	UsbWrite(COMM_R7,0x0000);  //r1
	UsbWrite(COMM_R8,0x0000);  //r1
	UsbWrite(COMM_R9,0x0000);  //r1
	UsbWrite(COMM_R10,0x0000);  //r1
	UsbWrite(COMM_R11,0x0000);  //r1
	UsbWrite(COMM_R12,0x0000);  //r1
	UsbWrite(COMM_R13,0x0000);  //r1

	IOWR(CY7C67200_BASE,HPI_MAILBOX,COMM_EXEC_INT);

	while (IORD(CY7C67200_BASE,HPI_MAILBOX) != COMM_ACK)
	{
		printf("[ERROR]:2:routine mailbox data is %x\n",IORD(CY7C67200_BASE,HPI_MAILBOX));
		goto USB_HOT_PLUG;
	}
	// STEP 2 end

	ctl_reg = USB1_CTL_REG;
	no_device = (A_DP_STAT | A_DM_STAT);
	fs_device = A_DP_STAT;

	usb_ctl_val = UsbRead(ctl_reg);

	if (!(usb_ctl_val & no_device))
	{
		for(hot_plug_count = 0 ; hot_plug_count < 5 ; hot_plug_count++)
		{
			usleep(5*1000);
			usb_ctl_val = UsbRead(ctl_reg);
			if(usb_ctl_val & no_device) break;
		}
		if(!(usb_ctl_val & no_device))
		{
			printf("\n[INFO]: no device is present in SIE1!\n");
			printf("[INFO]: please insert a USB keyboard in SIE1!\n");
			while (!(usb_ctl_val & no_device))
			{
				usb_ctl_val = UsbRead(ctl_reg);
				if(usb_ctl_val & no_device)
					goto USB_HOT_PLUG;

				usleep(2000);
			}
		}
	}
	else
	{
		/* check for low speed or full speed by reading D+ and D- lines */
		if (usb_ctl_val & fs_device)
		{
			printf("[INFO]: full speed device\n");
		}
		else
		{
			printf("[INFO]: low speed device\n");
		}
	}

	// STEP 3 begin
	//------------------------------------------------------set address -----------------------------------------------------------------
	UsbSetAddress();

	while (!(IORD(CY7C67200_BASE,HPI_STATUS) & HPI_STATUS_SIE1msg_FLAG) )  //read sie1 msg register
	{
		UsbSetAddress();
		usleep(10*1000);
	}

	UsbWaitTDListDone();

	IOWR(CY7C67200_BASE,HPI_ADDR,0x0506); // i
	printf("[ENUM PROCESS]:step 3 TD Status Byte is %x\n",IORD(CY7C67200_BASE,HPI_DATA));

	IOWR(CY7C67200_BASE,HPI_ADDR,0x0508); // n
	usb_ctl_val = IORD(CY7C67200_BASE,HPI_DATA);
	printf("[ENUM PROCESS]:step 3 TD Control Byte is %x\n",usb_ctl_val);
	while (usb_ctl_val != 0x03) // retries occurred
	{
		usb_ctl_val = UsbGetRetryCnt();

		goto USB_HOT_PLUG;
	}

	printf("------------[ENUM PROCESS]:set address done!---------------\n");

	// STEP 4 begin
	//-------------------------------get device descriptor-1 -----------------------------------//
	// TASK: Call the appropriate function for this step.
	UsbGetDeviceDesc1();

	while (!(IORD(CY7C67200_BASE,HPI_STATUS) & HPI_STATUS_SIE1msg_FLAG) )  //read sie1 msg register
	{
		// TASK: Call the appropriate function again if it wasn't processed successfully.
		UsbGetDeviceDesc1();

		usleep(10*1000);
	}

	UsbPrintMem();

	UsbWaitTDListDone();

	IOWR(CY7C67200_BASE,HPI_ADDR,0x0506);
	printf("[ENUM PROCESS]:step 4 TD Status Byte is %x\n",IORD(CY7C67200_BASE,HPI_DATA));

	IOWR(CY7C67200_BASE,HPI_ADDR,0x0508);
	usb_ctl_val = IORD(CY7C67200_BASE,HPI_DATA);
	printf("[ENUM PROCESS]:step 4 TD Control Byte is %x\n",usb_ctl_val);
	while (usb_ctl_val != 0x03)
	{
		usb_ctl_val = UsbGetRetryCnt();
	}

	printf("---------------[ENUM PROCESS]:get device descriptor-1 done!-----------------\n");


	//--------------------------------get device descriptor-2---------------------------------------------//
	//get device descriptor
	// TASK: Call the appropriate function for this step.
	UsbGetDeviceDesc2();

	//if no message
	while (!(IORD(CY7C67200_BASE,HPI_STATUS) & HPI_STATUS_SIE1msg_FLAG) )  //read sie1 msg register
	{
		//resend the get device descriptor
		//get device descriptor
		// TASK: Call the appropriate function again if it wasn't processed successfully.
		UsbGetDeviceDesc2();

		usleep(10*1000);
	}

	UsbWaitTDListDone();

	IOWR(CY7C67200_BASE,HPI_ADDR,0x0506);
	printf("[ENUM PROCESS]:step 4 TD Status Byte is %x\n",IORD(CY7C67200_BASE,HPI_DATA));

	IOWR(CY7C67200_BASE,HPI_ADDR,0x0508);
	usb_ctl_val = IORD(CY7C67200_BASE,HPI_DATA);
	printf("[ENUM PROCESS]:step 4 TD Control Byte is %x\n",usb_ctl_val);
	while (usb_ctl_val != 0x03)
	{
		usb_ctl_val = UsbGetRetryCnt();
	}

	printf("------------[ENUM PROCESS]:get device descriptor-2 done!--------------\n");


	// STEP 5 begin
	//-----------------------------------get configuration descriptor -1 ----------------------------------//
	// TASK: Call the appropriate function for this step.
	UsbGetConfigDesc1();

	//if no message
	while (!(IORD(CY7C67200_BASE,HPI_STATUS) & HPI_STATUS_SIE1msg_FLAG) )  //read sie1 msg register
	{
		//resend the get device descriptor
		//get device descriptor

		// TASK: Call the appropriate function again if it wasn't processed successfully.
		UsbGetConfigDesc1();

		usleep(10*1000);
	}

	UsbWaitTDListDone();

	IOWR(CY7C67200_BASE,HPI_ADDR,0x0506);
	printf("[ENUM PROCESS]:step 5 TD Status Byte is %x\n",IORD(CY7C67200_BASE,HPI_DATA));

	IOWR(CY7C67200_BASE,HPI_ADDR,0x0508);
	usb_ctl_val = IORD(CY7C67200_BASE,HPI_DATA);
	printf("[ENUM PROCESS]:step 5 TD Control Byte is %x\n",usb_ctl_val);
	while (usb_ctl_val != 0x03)
	{
		usb_ctl_val = UsbGetRetryCnt();
	}
	printf("------------[ENUM PROCESS]:get configuration descriptor-1 pass------------\n");

	// STEP 6 begin
	//-----------------------------------get configuration descriptor-2------------------------------------//
	//get device descriptor
	// TASK: Call the appropriate function for this step.
	UsbGetConfigDesc2();

	usleep(100*1000);
	//if no message
	while (!(IORD(CY7C67200_BASE,HPI_STATUS) & HPI_STATUS_SIE1msg_FLAG) )  //read sie1 msg register
	{
		// TASK: Call the appropriate function again if it wasn't processed successfully.
		UsbGetConfigDesc2();

		usleep(10*1000);
	}

	UsbWaitTDListDone();

	IOWR(CY7C67200_BASE,HPI_ADDR,0x0506);
	printf("[ENUM PROCESS]:step 6 TD Status Byte is %x\n",IORD(CY7C67200_BASE,HPI_DATA));

	IOWR(CY7C67200_BASE,HPI_ADDR,0x0508);
	usb_ctl_val = IORD(CY7C67200_BASE,HPI_DATA);
	printf("[ENUM PROCESS]:step 6 TD Control Byte is %x\n",usb_ctl_val);
	while (usb_ctl_val != 0x03)
	{
		usb_ctl_val = UsbGetRetryCnt();
	}


	printf("-----------[ENUM PROCESS]:get configuration descriptor-2 done!------------\n");


	// ---------------------------------get device info---------------------------------------------//

	// TASK: Write the address to read from the memory for byte 7 of the interface descriptor to HPI_ADDR.
	IOWR(CY7C67200_BASE,HPI_ADDR,0x056c);

	code = IORD(CY7C67200_BASE,HPI_DATA);
	printf("\ncode = %x\n", code);
	code = (code & 0xff00);
	printf("\ncode = %x\n", code);
	if (code == 0x01)
	{
		printf("\n[INFO]:check TD rec data7 \n[INFO]:Keyboard Detected!!!\n\n");
	}
	else
	{
		//printf("\nvalue= %x\n", code);
		printf("\n[INFO]:Keyboard Not Detected!!! \n\n");
	}

	// TASK: Write the address to read from the memory for the endpoint descriptor to HPI_ADDR.
	IOWR(CY7C67200_BASE,HPI_ADDR,0x057c);

	data_size = (IORD(CY7C67200_BASE,HPI_DATA)>>8)&0x0ff;
	printf("[ENUM PROCESS]:data packet size is %d\n",data_size);

	// STEP 7 begin
	//------------------------------------set configuration -----------------------------------------//
	// TASK: Call the appropriate function for this step.
	UsbSetConfig();

	while (!(IORD(CY7C67200_BASE,HPI_STATUS) & HPI_STATUS_SIE1msg_FLAG) )  //read sie1 msg register
	{
		// TASK: Call the appropriate function again if it wasn't processed successfully.
		UsbSetConfig();

		usleep(10*1000);
	}

	UsbWaitTDListDone();

	IOWR(CY7C67200_BASE,HPI_ADDR,0x0506);
	printf("[ENUM PROCESS]:step 7 TD Status Byte is %x\n",IORD(CY7C67200_BASE,HPI_DATA));

	IOWR(CY7C67200_BASE,HPI_ADDR,0x0508);
	usb_ctl_val = IORD(CY7C67200_BASE,HPI_DATA);
	printf("[ENUM PROCESS]:step 7 TD Control Byte is %x\n",usb_ctl_val);
	while (usb_ctl_val != 0x03)
	{
		usb_ctl_val = UsbGetRetryCnt();
	}

	printf("------------[ENUM PROCESS]:set configuration done!-------------------\n");

	//----------------------------------------------class request out ------------------------------------------//
	// TASK: Call the appropriate function for this step.
	UsbClassRequest();

	while (!(IORD(CY7C67200_BASE,HPI_STATUS) & HPI_STATUS_SIE1msg_FLAG) )  //read sie1 msg register
	{
		// TASK: Call the appropriate function again if it wasn't processed successfully.
		UsbClassRequest();

		usleep(10*1000);
	}

	UsbWaitTDListDone();

	IOWR(CY7C67200_BASE,HPI_ADDR,0x0506);
	printf("[ENUM PROCESS]:step 8 TD Status Byte is %x\n",IORD(CY7C67200_BASE,HPI_DATA));

	IOWR(CY7C67200_BASE,HPI_ADDR,0x0508);
	usb_ctl_val = IORD(CY7C67200_BASE,HPI_DATA);
	printf("[ENUM PROCESS]:step 8 TD Control Byte is %x\n",usb_ctl_val);
	while (usb_ctl_val != 0x03)
	{
		usb_ctl_val = UsbGetRetryCnt();
	}


	printf("------------[ENUM PROCESS]:class request out done!-------------------\n");

	// STEP 8 begin
	//----------------------------------get descriptor(class 0x21 = HID) request out --------------------------------//
	// TASK: Call the appropriate function for this step.
	UsbGetHidDesc();

	while (!(IORD(CY7C67200_BASE,HPI_STATUS) & HPI_STATUS_SIE1msg_FLAG) )  //read sie1 msg register
	{
		// TASK: Call the appropriate function again if it wasn't processed successfully.
		UsbGetHidDesc();

		usleep(10*1000);
	}

	UsbWaitTDListDone();

	IOWR(CY7C67200_BASE,HPI_ADDR,0x0506);
	printf("[ENUM PROCESS]:step 8 TD Status Byte is %x\n",IORD(CY7C67200_BASE,HPI_DATA));

	IOWR(CY7C67200_BASE,HPI_ADDR,0x0508);
	usb_ctl_val = IORD(CY7C67200_BASE,HPI_DATA);
	printf("[ENUM PROCESS]:step 8 TD Control Byte is %x\n",usb_ctl_val);
	while (usb_ctl_val != 0x03)
	{
		usb_ctl_val = UsbGetRetryCnt();
	}

	printf("------------[ENUM PROCESS]:get descriptor (class 0x21) done!-------------------\n");

	// STEP 9 begin
	//-------------------------------get descriptor (class 0x22 = report)-------------------------------------------//
	// TASK: Call the appropriate function for this step.
	UsbGetReportDesc();

	//if no message
	while (!(IORD(CY7C67200_BASE,HPI_STATUS) & HPI_STATUS_SIE1msg_FLAG) )  //read sie1 msg register
	{
		// TASK: Call the appropriate function again if it wasn't processed successfully.
		UsbGetReportDesc();

		usleep(10*1000);
	}

	UsbWaitTDListDone();

	IOWR(CY7C67200_BASE,HPI_ADDR,0x0506);
	printf("[ENUM PROCESS]: step 9 TD Status Byte is %x\n",IORD(CY7C67200_BASE,HPI_DATA));

	IOWR(CY7C67200_BASE,HPI_ADDR,0x0508);
	usb_ctl_val = IORD(CY7C67200_BASE,HPI_DATA);
	printf("[ENUM PROCESS]: step 9 TD Control Byte is %x\n",usb_ctl_val);
	while (usb_ctl_val != 0x03)
	{
		usb_ctl_val = UsbGetRetryCnt();
	}

	printf("---------------[ENUM PROCESS]:get descriptor (class 0x22) done!----------------\n");



	//-----------------------------------get keycode value------------------------------------------------//
	usleep(10000);
	while(1)
	{
		toggle++;
		IOWR(CY7C67200_BASE,HPI_ADDR,0x0500); //the start address
		//data phase IN-1
		IOWR(CY7C67200_BASE,HPI_DATA,0x051c); //500

		IOWR(CY7C67200_BASE,HPI_DATA,0x000f & data_size);//2 data length

		IOWR(CY7C67200_BASE,HPI_DATA,0x0291);//4 //endpoint 1
		if(toggle%2)
		{
			IOWR(CY7C67200_BASE,HPI_DATA,0x0001);//6 //data 1
		}
		else
		{
			IOWR(CY7C67200_BASE,HPI_DATA,0x0041);//6 //data 1
		}
		IOWR(CY7C67200_BASE,HPI_DATA,0x0013);//8
		IOWR(CY7C67200_BASE,HPI_DATA,0x0000);//a
		UsbWrite(HUSB_SIE1_pCurrentTDPtr,0x0500); //HUSB_SIE1_pCurrentTDPtr
		while (!(IORD(CY7C67200_BASE,HPI_STATUS) & HPI_STATUS_SIE1msg_FLAG) )  //read sie1 msg register
		{
			IOWR(CY7C67200_BASE,HPI_ADDR,0x0500); //the start address
			//data phase IN-1
			IOWR(CY7C67200_BASE,HPI_DATA,0x051c); //500

			IOWR(CY7C67200_BASE,HPI_DATA,0x000f & data_size);//2 data length

			IOWR(CY7C67200_BASE,HPI_DATA,0x0291);//4 //endpoint 1
			if(toggle%2)
			{
				IOWR(CY7C67200_BASE,HPI_DATA,0x0001);//6 //data 1
			}
			else
			{
				IOWR(CY7C67200_BASE,HPI_DATA,0x0041);//6 //data 1
			}
			IOWR(CY7C67200_BASE,HPI_DATA,0x0013);//8
			IOWR(CY7C67200_BASE,HPI_DATA,0x0000);//
			UsbWrite(HUSB_SIE1_pCurrentTDPtr,0x0500); //HUSB_SIE1_pCurrentTDPtr
			usleep(10*1000);
		}//end while


		usb_ctl_val = UsbWaitTDListDone();

		// packet starts from 0x051c, reading third byte
		// TASK: Write the address to read from the memory for byte 3 of the report descriptor to HPI_ADDR.
		IOWR(CY7C67200_BASE,HPI_ADDR,0x051e);

		keycode = IORD(CY7C67200_BASE,HPI_DATA);
		printf("\nfirst two keycode values are %04x\n",keycode);
		IOWR(KEYCODE_BASE, 0, keycode & 0xff);

		
		usleep(200);//usleep(5000);
		usb_ctl_val = UsbRead(ctl_reg);

		if(!(usb_ctl_val & no_device))
		{
			//USB hot plug routine
			for(hot_plug_count = 0 ; hot_plug_count < 7 ; hot_plug_count++)
			{
				usleep(5*1000);
				usb_ctl_val = UsbRead(ctl_reg);
				if(usb_ctl_val & no_device) break;
			}
			if(!(usb_ctl_val & no_device))
			{
				printf("\n[INFO]: the keyboard has been removed!!! \n");
				printf("[INFO]: please insert again!!! \n");
			}
		}
		
		while (!(usb_ctl_val & no_device))
		{

			usb_ctl_val = UsbRead(ctl_reg);
			usleep(5*1000);
			usb_ctl_val = UsbRead(ctl_reg);
			usleep(5*1000);
			usb_ctl_val = UsbRead(ctl_reg);
			usleep(5*1000);

			if(usb_ctl_val & no_device)
				goto USB_HOT_PLUG;

			usleep(200);

		}

	}//end while

	return 0;
}

