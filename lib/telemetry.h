/* Telemetry related functions */
/* since telemetry is called in steering.c */

// Flash bug? make sure not multiple of 0x420 to avoid overwrite of address 0 with 0x00
// 44, 48, 66, 88, 96, 132 are factors of 1056

typedef struct {
		unsigned long sampleIndex;
	       unsigned long timeStamp; 
		long posL;  	// Hall angle position
		long posR;
		long refL;		// reference position
		long refR;
		int dcL;		// PWM duty cycle
		int dcR;
		int gyroX;
		int gyroY;
		int gyroZ;
//		int gyroAvg;    // not used in Duncan telem, and not a state variable
		int accelX;
		int accelY;
		int accelZ;
		int bemfL;
		int bemfR;
		int Vbatt; // battery voltage
//		int sOut;  // not used in Duncan telem, and not a state variable
//		int temp[1]; // pad length of packet stored in Flash to avoid exact 0x420 page size bug	
	} telemStruct_t;

typedef union packedTelemUnion {
	telemStruct_t telemStruct;
	unsigned char dataArray[sizeof(telemStruct_t)];
} telemU;


// telemetry control structure 
typedef struct
{	char onoff;				// telemetry recording enabled 
	unsigned long start;	// recording start time   
	int count;				// count of samples to record
	int skip;				// samples to skip
} TelemConStruct;


void telemGetPID(unsigned long sampIdx);
void telemSaveSample(unsigned long sampIdx);
void telemFlashSample(telemU* data);
void setSampleSaveCount(int count);
void telemFlashReadback(unsigned int count);
