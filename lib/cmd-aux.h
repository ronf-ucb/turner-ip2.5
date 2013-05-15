
void cmdEcho(unsigned char type, unsigned char status, unsigned char length, unsigned char *frame);
void cmdNop(unsigned char type, unsigned char status, unsigned char length, unsigned char *frame);
void cmdSoftwareReset(unsigned char type, unsigned char status, unsigned char length, unsigned char *frame);
void cmdWhoAmI(unsigned char type, unsigned char status, unsigned char length, unsigned char *frame);
void cmdError(void);
