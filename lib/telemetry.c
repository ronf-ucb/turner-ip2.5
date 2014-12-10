/* Telemetry related functions */
/* since telemetry is called in steering.c */
#include "pid-ip2.5.h"
#include "utils.h"
#include "telemetry.h"
#include "stopwatch.h"
#include "dfmem.h"
#include "radio.h"
#include "../MyConsts/radio_settings.h"
#include "timer.h"
#include "cmd.h"
#include "adc_pid.h"
#include "spi_controller.h"
#include "blink.h"

int samplesToSave;
extern int gdata[3];
extern int gyroAvg;
extern int xldata[3];  // accelerometer data 
extern int offsx, offsy, offsz;
// extern SpicStatus port_status[SPIC_NUM_PORTS];

// structure to keep track of telemetry recording
TelemConStruct TelemControl;  // structure for telemetry control
extern pidT steeringPID;
extern pidPos pidObjs[NUM_PIDS];
extern pidVelLUT pidVel[NUM_PIDS];
extern int bemf[NUM_PIDS];

/* static struct piddata {
    int output[NUM_PIDS];
    unsigned int measurements[NUM_PIDS];
	long p[2],i[2],d[2];
} PIDTelemData;
*/

/* data structure for telemetry */
telemU telemPIDdata;

unsigned int telemPacketSize;
static DfmemGeometryStruct mem_geo;
void telemSetup() {
dfmemGetGeometryParams(&mem_geo); // Read memory chip sizing
//Telemetry packet size is set at startupt time.
telemPacketSize = sizeof (telemStruct_t);
}

// 7 Oct 2014 - added reference position
// Duncan's telemetry uses this format: 
// time | Right Leg Pos | Left Leg Pos | Commanded Right Leg Pos | Commanded Left Leg Pos | DCR | DCL | GyroX | GryoY | GryoZ | AX | AY | AZ | RBEMF | LBEMF | VBatt
// store current PID info into structure. Used by telemSaveSample and CmdGetPIDTelemetry
void telemGetPID(unsigned long sampIdx)
{
	telemPIDdata.telemStruct.sampleIndex = sampIdx;
//Stopwatch was already started in the cmdSpecialTelemetry function
	telemPIDdata.telemStruct.timeStamp = (long)swatchTic(); 

// since T1 has higher priority, these state readings might get interrupted 
	CRITICAL_SECTION_START  // need coherent sample without T1 int updates
//  save Hall encoder position instead of commanded thrust
		telemPIDdata.telemStruct.posL = pidObjs[0].p_state;
		telemPIDdata.telemStruct.posR = pidObjs[1].p_state;
// save commanded reference
		telemPIDdata.telemStruct.refL = pidObjs[0].p_input + pidVel[0].interpolate; // interpolated ref position
		telemPIDdata.telemStruct.refR = pidObjs[1].p_input + pidVel[1].interpolate;
	// save output instead of reading PWM (sync issue?)
		telemPIDdata.telemStruct.dcL = pidObjs[0].output;	// left
		telemPIDdata.telemStruct.dcR = pidObjs[1].output;	// right
		telemPIDdata.telemStruct.bemfL = bemf[0];
		telemPIDdata.telemStruct.bemfR = bemf[1];
	CRITICAL_SECTION_END

   		telemPIDdata.telemStruct.gyroX = gdata[0] - offsx;
		telemPIDdata.telemStruct.gyroY = gdata[1] - offsy;
		telemPIDdata.telemStruct.gyroZ = gdata[2] - offsz; 
//		telemPIDdata.telemStruct.gyroAvg = gyroAvg; // not used in Duncan code
		telemPIDdata.telemStruct.accelX = xldata[0];
		telemPIDdata.telemStruct.accelY = xldata[1];
		telemPIDdata.telemStruct.accelZ = xldata[2];
		telemPIDdata.telemStruct.Vbatt = (int) adcGetVbatt();
//		telemPIDdata.telemStruct.sOut = steeringPID.output;  // not used in Duncan telem
		return;
}



// record current state to telemU structure
void telemSaveSample(unsigned long sampIdx)
{	
			telemGetPID(sampIdx);
// inside T5 interrupt, so don't need to DisableIntT5
			telemFlashSample(&telemPIDdata); 
}

/// write telemetry sample to Flash memory
void telemFlashSample(telemU* data)
{  dfmemSave((unsigned char *)data, sizeof(telemStruct_t));
	if(samplesToSave == 0) //Done sampling, commit last buffer
	{ dfmemSync(); }
			
}

void setSampleSaveCount(int count){
	samplesToSave = count;
}


//read telemetry from Flash Memory and send radio packets back
void telemFlashReadback(unsigned int count)
{  unsigned char status = 0;
	unsigned int sampLen = sizeof(telemStruct_t);
	unsigned long sampNum = 0;
	telemU data;
	DisableIntT5;		// prevent MPU access to SPI2
	for(sampNum = 0; sampNum < count; sampNum++)
//	{ dfmemReadSample(sampNum, sampLen, (unsigned char *) &data);
        { telemGetSample(sampNum, sampLen, (unsigned char *) &data); // updated Dec. 9, 2014
	   if ((sampNum+1) != data.telemStruct.sampleIndex)
		while(1) // hang here if bad read  *** MOD to Get second packet ***
		{ blink_leds(1,200); }
	   radioConfirmationPacket(RADIO_DEST_ADDR,
						     CMD_SPECIAL_TELEMETRY, 
						     status, sampLen, (unsigned char *) &data);  
	// delay_ms(25);	// slow down for XBee 57.6 K
	blink_leds(1,20); // wait 40 ms to give plenty of time to send packets
	}
	// wait for DMA to finish and release SPI2
/* not sure if this is needed to avoid hanging when using newer SPI control */
//        while(port_status[1] == STAT_SPI_BUSY)
//	{ blink_leds(1,300);   // waste some time
//	}
	EnableIntT5;
}

void telemGetSample(unsigned long sampNum, unsigned int sampLen, unsigned char *data)
{
unsigned int samplesPerPage = mem_geo.bytes_per_page / sampLen; //round DOWN int division
unsigned int pagenum = sampNum / samplesPerPage;
unsigned int byteOffset = (sampNum - pagenum*samplesPerPage)*sampLen;
dfmemRead(pagenum, byteOffset, sampLen, data);
}

void telemErase(unsigned long numSamples) {
//dfmemEraseSectorsForSamples(numSamples, sizeof (telemU));
// TODO (apullin) : Add an explicit check to see if the number of saved
// samples will fit into memory!
LED_2 = 1;
unsigned int firstPageOfSector, i;
//avoid trivial case
if (numSamples == 0) {
return;
}
//Saves to dfmem will NOT overlap page boundaries, so we need to do this level by level:
unsigned int samplesPerPage = mem_geo.bytes_per_page / telemPacketSize; //round DOWN int division
unsigned int numPages = (numSamples + samplesPerPage - 1) / samplesPerPage; //round UP int division
unsigned int numSectors = (numPages + mem_geo.pages_per_sector - 1) / mem_geo.pages_per_sector;
//At this point, it is impossible for numSectors == 0
//Sector 0a and 0b will be erased together always, for simplicity
//Note that numSectors will be the actual number of sectors to erase,
// even though the sectors themselves are numbered starting at '0'
DisableIntT1;
dfmemEraseSector(0); //Erase Sector 0a
dfmemEraseSector(8); //Erase Sector 0b
//Start erasing the rest from Sector 1:
for (i = 1; i <= numSectors; i++) {
firstPageOfSector = mem_geo.pages_per_sector * i;
//hold off until dfmem is ready for secort erase command
//while (!dfmemIsReady());
//LED should blink indicating progress
LED_2 = ~LED_2;
//Send actual erase command
dfmemEraseSector(firstPageOfSector);
}
EnableIntT1;
//Leadout flash, should blink faster than above, indicating the last sector
//while (!dfmemIsReady()) {
// LED_2 = ~LED_2;
// delay_ms(75);
//}
LED_2 = 0; //Green LED off
//Since we've erased, reset our place keeper vars
dfmemZeroIndex();
}

