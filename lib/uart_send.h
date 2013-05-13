/* sending command responses through UART data */

unsigned char radioConfirmationPacket1 (unsigned int dest_addr, unsigned char type,
                             unsigned char status, unsigned int datalen,
                             unsigned char* dataptr); 

unsigned char serialSendData (unsigned int dest_addr, unsigned char type,
                             unsigned char status, unsigned int datalen,
                             unsigned char* dataptr); // unsigned char fast_fail);

void test_serial(void);
