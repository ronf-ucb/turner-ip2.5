#include "cmd.h"
#include "cmd_const.h"
#include "cmd-motor.h"
#include "cmd-aux.h"
#include "radio.h"
// #include "../MyConsts/radio_settings.h"
#include "settings.h"
#include "led.h"
#include "pid-ip2.5.h"
#include "version.h"
#include <stdio.h>
#include <string.h>
#include "mpu6000.h"
#include "utils.h"
#include <timer.h>

/*-----------------------------------------------------------------------------
 *          AUX functions
-----------------------------------------------------------------------------*/
void cmdEcho(unsigned char type, unsigned char status, unsigned char length, unsigned char *frame) 
{ // MacPacket packet; Payload pld;
	//Send confirmation packet
	radioConfirmationPacket(RADIO_DST_ADDR, CMD_ECHO, status, length, frame);
    return; //success     
}

void cmdNop(unsigned char type, unsigned char status, unsigned char length, unsigned char *frame) {
    Nop();
}


void cmdSoftwareReset(unsigned char type, unsigned char status, unsigned char length, unsigned char *frame)
{
	asm volatile("reset");
}

// send robot info when queried
void cmdWhoAmI(unsigned char type, unsigned char status, unsigned char length, unsigned char *frame) 
{   unsigned char i, string_length; unsigned char *version_string;
// maximum string length to avoid packet size limit
	version_string = (unsigned char *)versionGetString();
	i = 0;
	while((i < 127) && version_string[i] != '\0')
	{ i++;}
	string_length=i;     
	/* serialSendData(RADIO_DST_ADDR, status, CMD_WHO_AM_I,
            				string_length, version_string, 0); */
	radioConfirmationPacket(RADIO_DST_ADDR, CMD_WHO_AM_I,
					status, string_length, version_string);  
      return; //success
}

void cmdTestBoard(unsigned char type, unsigned char status, unsigned char length, unsigned char *frame)
{   char message[80]; // caution - do not over write end of string
int xldata[3];  // accelerometer data
    unsigned char string_length, reg, write_cmd;
// maximum string length to avoid packet size limit
    DisableIntT1; // turn off pid interrupts
     reg =mpuReadReg(MPU_REG_WHOAMI);              // Some sort of check here?
        sprintf(message,"Diagnostic:  mpu WHO_AM_I should be 0x68 = 0x%x\n", reg);

        string_length = strlen(message);
	radioConfirmationPacket(RADIO_DST_ADDR, CMD_WHO_AM_I,
					status, string_length, (unsigned char *) message);


    /////// Get XL data
        mpuBeginUpdate();  // DMA version
        mpuGetXl(xldata);
        sprintf(message,"Diagnostic: xldata[z] = 0x%x\n", xldata[2]); 
        string_length = strlen(message);
	radioConfirmationPacket(RADIO_DST_ADDR, CMD_WHO_AM_I,
					status, string_length, (unsigned char *) message);

        // turn on self-test for Z axis
        write_cmd = 0b111000000;  // ZA_TEST[4:2] = 0b111, ZG_TEST[4:0] = 0b00000
        mpuWriteReg(MPU_SELF_TEST_Z, write_cmd);
        write_cmd = 0b000000011;  // ZA_TEST[1:0] = 0b11,
        mpuWriteReg(MPU_SELF_TEST_A, write_cmd);

        mpuBeginUpdate();  // DMA version
        mpuGetXl(xldata);
        sprintf(message,"Diagnostic: selftest xldata[z] = 0x%x\n", xldata[2]);
        string_length = strlen(message);
	radioConfirmationPacket(RADIO_DST_ADDR, CMD_WHO_AM_I,
					status, string_length, (unsigned char *) message);

        // turn off self test
         write_cmd = 0b000000000;  // ZA_TEST[4:2] = 0b000, ZG_TEST[4:0] = 0b00000
        mpuWriteReg(MPU_SELF_TEST_Z, write_cmd);
        mpuWriteReg(MPU_SELF_TEST_A, write_cmd);
	EnableIntT1; // turn on pid interrupts
      return; //success
}
// handle bad command packets
// we might be in the middle of a dangerous maneuver- better to stop and signal we need resent command
// wait for command to be resent
void cmdError()
{ int i;
 	EmergencyStop();
	for(i= 0; i < 10; i++)
	 {	LED_1 ^= 1;
			delay_ms(200);
			LED_2 ^= 1;
			delay_ms(200);
			LED_3 ^= 1;
			delay_ms(200);
          }
}

