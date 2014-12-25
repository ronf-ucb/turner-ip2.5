/* 
 * File:   settings.h
 * Author: ronf
 *
 * Created on December 24, 2014, 3:39 PM
 */

#ifndef SETTINGS_H
#define	SETTINGS_H


#ifdef	__cplusplus
extern "C" {
#endif

#define RONF
// ronf robot radio addresses
#ifdef RONF
#define RADIO_MY_CHAN 0x13
#define RADIO_PAN_ID 0x2060
//Hard code in destination address (basestation) for now, update to be dynamic later
#define RADIO_DST_ADDR 0x2011
#define RADIO_SRC_ADDR 0x2052
#endif


//Telemetry type setup
#define TELEM_TYPE vrTelemStruct_t
#define TELEM_INCLUDE "vr_telem.h"
#define TELEMPACKFUNC(x) vrTelemGetData(x)



#ifdef	__cplusplus
}
#endif


#endif	/* SETTINGS_H */
