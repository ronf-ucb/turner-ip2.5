/*********************************************************************************************************
* Name: main.c
* Desc: A test suite for the ImageProc 2.2 system. These tests should not be
* considered rigorous, exhaustive tests of the hardware, but rather
* "smoke tests" - ie. turn on the functionality and make sure the 
* hardware/software doesn't start "smoking."
*
* The architecture is based on a function pointer queue scheduling model. The
* meat of the testing logic resides in test.c. If the radio has received a 
* command packet during the previous timer interval for Timer2, the appropriate
* function pointer is added to a queue in the interrupt service routine for 
* Timer2 (interrupts.c). The main loop simply pops the function pointer off
* the top of the queue and executes it. 
*
* Date: 2011-04-13
* Author: AMH, Ryan Julian
*********************************************************************************************************/
#include "p33Fxxxx.h"
#include "init.h"
#include "init_default.h"
#include "timer.h"
#include "utils.h"
#include "bsp-ip25.h"
#include "queue.h"
#include "radio.h"
// #include "MyConsts/radio_settings.h"
#include "settings.h"  // user constants such as radio channels
#include "tests.h"
#include "dfmem.h"
#include "interrupts.h"
#include "sclock.h"
#include "ams-enc.h"
// #include "mpu6000-nodma.h"
#include "tih.h"
#include "blink.h"
#include <stdlib.h>
#include "cmd.h"
#include "pid-ip2.5.h"
// #include "steering.h"
#include "consts.h"
#include "adc_pid.h"
// #include "telemetry.h"
#include "telem.h"

Payload rx_payload;
MacPacket rx_packet;

volatile MacPacket uart_tx_packet;
volatile unsigned char uart_tx_flag;
volatile Queue fun_queue;


Test* test;

unsigned int error_code;
void setupImageProc25c(); // function prototype

int main() {

unsigned char payloadType;
unsigned char payloadStatus;
unsigned char payloadDataLength;
unsigned char* payloadData;

 /*    (*tf)(payGetType(rx_payload),   // old commands don't use packet type
                    payGetStatus(rx_payload),
			  payGetDataLength(rx_payload),
                    payGetData(rx_payload));
  * */

    fun_queue = queueInit(FUN_Q_LEN);
    test_function tf;
    error_code = ERR_NONE;

    setupImageProc25c();   // setup all needed functions

	blink_leds(4,500); // blink LEDs 4 times at half sec
    char j;
    for(j=0; j<3; j++){
        LED_2 = ON;
        delay_ms(250);
        LED_2 = OFF;
        delay_ms(250);
    }
    LED_2 = ON;

    EnableIntT2;
    while(1){
        while(!queueIsEmpty(fun_queue))
        {
            test = queuePop(fun_queue);
            rx_payload = macGetPayload(test->packet);
            payloadType = payGetType(rx_payload);
            payloadStatus = payGetStatus(rx_payload);
            payloadDataLength = payGetDataLength(rx_payload);
            payloadData = payGetData(rx_payload);

            tf = test->tf;
            (*tf)(payloadType, payloadStatus, payloadDataLength, payloadData);  // to make debugging commands easier

    /*        (*tf)(payGetType(rx_payload),   // old commands don't use packet type
                    payGetStatus(rx_payload), 
			  payGetDataLength(rx_payload), 
                    payGetData(rx_payload));
    */
            radioReturnPacket(test->packet);
            free(test);
        }
    }
    return 0;
}

//put all set up operations here
void setupImageProc25c()
{
     /* Initialization */
    SetupClock();
    SwitchClocks();
    SetupPorts();
    LED_3 = OFF; LED_2 = OFF; LED_1 = OFF; // all LEDs initially off step #0
    SetupInterrupts();
 //   SetupADC(); old A/D
    adcSetup();   // DMA A/D
//    SetupTimer1(); setup in pidSetup
    SetupTimer2();
       LED_3 = OFF; LED_2 = OFF; LED_1 = ON; // initialize step #1
    sclockSetup();
    mpuSetup();
          LED_3 = OFF; LED_2 = ON; LED_1 = OFF; // initialize step #2
    mpuRunCalib(100);  // get offset for gyro/ accelerometer
        LED_3 = OFF; LED_2 = ON; LED_1 = ON; // initialize step #3, mpu setup
     /*   if Hall not present will hang */
#if HALL_SENSOR == 1
    amsEncoderSetup();
#endif
     LED_3 = ON; LED_2 = OFF; LED_1 = OFF; // initialize step #4, Hall encoder
    dfmemSetup();
    LED_3 = ON; LED_2 = OFF; LED_1 = ON; // initialize step #5, FLASH
    telemSetup(); // added Dec. 9, 2014
    tiHSetup();   // set up H bridge drivers
	cmdSetup();  // setup command table
	pidSetup();  // setup PID control
    LED_3 = ON; LED_2 = ON; LED_1 = OFF; // initialize step #6, PWM
    // Radio setup
    blink_leds(4,200); // blink LEDs 4 times at half sec
    radioInit(RADIO_RXPQ_MAX_SIZE, RADIO_TXPQ_MAX_SIZE);
    radioSetChannel(RADIO_MY_CHAN);
    radioSetSrcAddr(RADIO_SRC_ADDR);
    radioSetSrcPanID(RADIO_PAN_ID);
    setupTimer6(RADIO_FCY); // Radio and buffer loop timer
/**** set up steering last - so dfmem can finish ****/
//	steeringSetup(); // steering and Timer5 Int
    LED_3 = ON; LED_2 = ON; LED_1 = ON; // initialize step #7, Radio
}