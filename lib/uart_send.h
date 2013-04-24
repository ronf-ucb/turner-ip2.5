/* sending command responses through UART data */

unsigned char serialSendData (unsigned int dest_addr, unsigned char status,
                             unsigned char type, unsigned int datalen,
                             unsigned char* dataptr); // unsigned char fast_fail);
