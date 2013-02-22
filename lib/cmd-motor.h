void cmdSetThrust(unsigned char type, unsigned char status, unsigned char length, unsigned char *frame);
void cmdZeroPos(unsigned char type, unsigned char status, unsigned char length, unsigned char *frame); 
void cmdEStop(unsigned char type, unsigned char status, unsigned char length, unsigned char *frame); 
void cmdEStopSend(void); 
void cmdSetThrustClosedLoop(unsigned char type, unsigned char status, unsigned char length, unsigned char *frame);
void cmdSetPIDGains(unsigned char type, unsigned char status, unsigned char length, unsigned char *frame);
void cmdSetVelProfile(unsigned char type, unsigned char status, unsigned char length, unsigned char *frame);
