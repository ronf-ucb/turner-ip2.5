unsigned char cmdSetThrust(unsigned char type, unsigned char status, unsigned char length, unsigned char *frame);
unsigned char cmdZeroPos(unsigned char type, unsigned char status, unsigned char length, unsigned char *frame); 
// unsigned char cmdEStop1(unsigned char type, unsigned char status, unsigned char length, unsigned char *frame); 
unsigned char cmdSetThrustClosedLoop(unsigned char type, unsigned char status, unsigned char length, unsigned char *frame);
unsigned char cmdEStop(unsigned char type, unsigned char status, unsigned char length, unsigned char *frame);
unsigned char cmdSetPIDGains(unsigned char type, unsigned char status, unsigned char length, unsigned char *frame);
unsigned char cmdSetVelProfile(unsigned char type, unsigned char status, unsigned char length, unsigned char *frame);

// not part of regular commands - called by interrupt
void cmdEStopSend(void); 
