#include "cmd.h"
#include "cmd_const.h"
#include "cmd-motor.h"
#include "cmd-aux.h"
#include "radio.h"
#include "../MyConsts/radio_settings.h"
#include "led.h"
#include "pid-ip2.5.h"
#include "version.h"

/*-----------------------------------------------------------------------------
 *          AUX functions
-----------------------------------------------------------------------------*/
unsigned char cmdEcho(unsigned char type, unsigned char status, unsigned char length, unsigned char *frame) 
{ // MacPacket packet; Payload pld;
	//Send confirmation packet
	radioConfirmationPacket(RADIO_DEST_ADDR, CMD_ECHO, status, length, frame);  
    return 1; //success     
}

unsigned char cmdNop(unsigned char type, unsigned char status, unsigned char length, unsigned char *frame) {
    Nop();
	return 1;
}


unsigned char cmdSoftwareReset(unsigned char type, unsigned char status, unsigned char length, unsigned char *frame)
{
	asm volatile("reset");
	return 1;
}

// send robot info when queried
unsigned char cmdWhoAmI(unsigned char type, unsigned char status, unsigned char length, unsigned char *frame) 
{   unsigned char i, string_length; unsigned char *version_string;
// maximum string length to avoid packet size limit
	version_string = (unsigned char *)versionGetString();
	i = 0;
	while((i < 127) && version_string[i] != '\0')
	{ i++;}
	string_length=i;     
	/* serialSendData(RADIO_DEST_ADDR, status, CMD_WHO_AM_I,
            				string_length, version_string, 0); */
	radioConfirmationPacket(RADIO_DEST_ADDR, CMD_WHO_AM_I, 
					status, string_length, version_string);  
      return 1; //success
}

// handle bad command packets
// we might be in the middle of a dangerous maneuver- better to stop and signal we need resent command
// wait for command to be resent
unsigned char cmdError()
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
	return 1;
}

