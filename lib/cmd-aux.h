
unsigned char cmdEcho(unsigned char type, unsigned char status, unsigned char length, unsigned char *frame);
unsigned char cmdNop(unsigned char type, unsigned char status, unsigned char length, unsigned char *frame);
unsigned char cmdSoftwareReset(unsigned char type, unsigned char status, unsigned char length, unsigned char *frame);
unsigned char cmdWhoAmI(unsigned char type, unsigned char status, unsigned char length, unsigned char *frame);
unsigned char cmdError(void);
