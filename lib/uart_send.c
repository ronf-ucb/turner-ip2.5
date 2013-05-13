/**
 * Copyright (c) 2011-2013, Regents of the University of California
 * All rights reserved.
 *
 * Redistribution and use in source and binary forms, with or without
 * modification, are permitted provided that the following conditions are met:
 *
 * - Redistributions of source code must retain the above copyright notice,
 *   this list of conditions and the following disclaimer.
 * - Redistributions in binary form must reproduce the above copyright notice,
 *   this list of conditions and the following disclaimer in the documentation
 *   and/or other materials provided with the distribution.
 * - Neither the name of the University of California, Berkeley nor the names
 *   of its contributors may be used to endorse or promote products derived
 *   from this software without specific prior written permission.
 *
 * THIS SOFTWARE IS PROVIDED BY THE COPYRIGHT HOLDERS AND CONTRIBUTORS "AS IS"
 * AND ANY EXPRESS OR IMPLIED WARRANTIES, INCLUDING, BUT NOT LIMITED TO, THE
 * IMPLIED WARRANTIES OF MERCHANTABILITY AND FITNESS FOR A PARTICULAR PURPOSE
 * ARE DISCLAIMED. IN NO EVENT SHALL THE COPYRIGHT HOLDER OR CONTRIBUTORS BE
 * LIABLE FOR ANY DIRECT, INDIRECT, INCIDENTAL, SPECIAL, EXEMPLARY, OR
 * CONSEQUENTIAL DAMAGES (INCLUDING, BUT NOT LIMITED TO, PROCUREMENT OF
 * SUBSTITUTE GOODS OR SERVICES; LOSS OF USE, DATA, OR PROFITS; OR BUSINESS
 * INTERRUPTION) HOWEVER CAUSED AND ON ANY THEORY OF LIABILITY, WHETHER IN
 * CONTRACT, STRICT LIABILITY, OR TORT (INCLUDING NEGLIGENCE OR OTHERWISE)
 * ARISING IN ANY WAY OUT OF THE USE OF THIS SOFTWARE, EVEN IF ADVISED OF THE
 * POSSIBILITY OF SUCH DAMAGE.
 *
 * quick and dirty serial send packet interface for ImageProc to send data
 * back to Python on host, e.g. Odroid linaro
 * Ron Fearing April 22, 2013
 */

#include "uart_send.h"
#include "mac_packet.h"
#include "ppool.h"
#include "radio.h"
#include "version.h"
#include "cmd.h"
#include "../MyConsts/radio_settings.h"

extern volatile unsigned char uart_tx_flag;
extern volatile MacPacket uart_tx_packet;
// redefine radio to be serial for testing purposes 
/* unsigned char radioConfirmationPacket1(unsigned int dest_addr,  unsigned char type, 
				unsigned char status, unsigned int datalen,
                             unsigned char* dataptr) 
*/


unsigned char radioConfirmationPacket1(unsigned int dest_addr,  unsigned char type, 
				unsigned char status, unsigned int datalen,
                             unsigned char* dataptr)
{ unsigned char sent;
	sent = serialSendData (dest_addr,  type, status, datalen, dataptr);

	return(sent);
}



unsigned char serialSendData (unsigned int dest_addr,  unsigned char type, 
				unsigned char status, unsigned int datalen,
                             unsigned char* dataptr) //, unsigned char fast_fail)
{
    MacPacket packet;
    Payload pld;

    packet = radioRequestPacket(datalen); // allocate memory for serial packet
    if ( packet == NULL ) return 0;  // Unable to allocate packet
    macSetDestAddr(packet, dest_addr);          // SRC and PAN already set

    pld = macGetPayload(packet);
 /* setup all packet data : */
    paySetData(pld, datalen, (unsigned char*) dataptr);
    paySetType(pld, type);
    paySetStatus(pld, status);

  // Enqueue the packet for broadcast
  // only 1, since no queue
    uart_tx_packet = packet;
    uart_tx_flag = 1;

    return 1;
}

// try out sending a message over serial
void test_serial()
{   unsigned char i, string_length; unsigned char *version_string;
// maximum string length to avoid packet size limit
	version_string = (unsigned char *)versionGetString();
	i = 0;
	while((i < 127) && version_string[i] != '\0')
	{ i++;}
	string_length=i;     
	serialSendData(RADIO_DEST_ADDR, 0, CMD_WHO_AM_I,
            				string_length, version_string);
      return; //success
}
