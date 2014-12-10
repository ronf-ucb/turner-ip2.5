#
# Generated Makefile - do not edit!
#
# Edit the Makefile in the project folder instead (../Makefile). Each target
# has a -pre and a -post target defined where you can add customized code.
#
# This makefile implements configuration specific macros and targets.


# Include project Makefile
ifeq "${IGNORE_LOCAL}" "TRUE"
# do not include local makefile. User is passing all local related variables already
else
include Makefile
# Include makefile containing local settings
ifeq "$(wildcard nbproject/Makefile-local-default.mk)" "nbproject/Makefile-local-default.mk"
include nbproject/Makefile-local-default.mk
endif
endif

# Environment
MKDIR=gnumkdir -p
RM=rm -f 
MV=mv 
CP=cp 

# Macros
CND_CONF=default
ifeq ($(TYPE_IMAGE), DEBUG_RUN)
IMAGE_TYPE=debug
OUTPUT_SUFFIX=elf
DEBUGGABLE_SUFFIX=elf
FINAL_IMAGE=dist/${CND_CONF}/${IMAGE_TYPE}/turner-ip25.X.${IMAGE_TYPE}.${OUTPUT_SUFFIX}
else
IMAGE_TYPE=production
OUTPUT_SUFFIX=hex
DEBUGGABLE_SUFFIX=elf
FINAL_IMAGE=dist/${CND_CONF}/${IMAGE_TYPE}/turner-ip25.X.${IMAGE_TYPE}.${OUTPUT_SUFFIX}
endif

# Object Directory
OBJECTDIR=build/${CND_CONF}/${IMAGE_TYPE}

# Distribution Directory
DISTDIR=dist/${CND_CONF}/${IMAGE_TYPE}

# Source Files Quoted if spaced
SOURCEFILES_QUOTED_IF_SPACED=../../imageproc-lib/delay.s ../../imageproc-lib/dfmem.c ../../imageproc-lib/i2c_driver.c ../../imageproc-lib/init_default.c ../../imageproc-lib/larray.c ../../imageproc-lib/mpu6000.c ../../imageproc-lib/packet_queue.c ../../imageproc-lib/payload.c ../../imageproc-lib/payload_queue.c ../../imageproc-lib/queue.c ../../imageproc-lib/radio.c ../../imageproc-lib/spi_controller.c ../../imageproc-lib/stopwatch.c ../../imageproc-lib/tih.c ../../imageproc-lib/version.c ../../imageproc-lib/adc_pid.c ../../imageproc-lib/ams-enc.c ../../imageproc-lib/battery.c ../../imageproc-lib/blink.c ../../imageproc-lib/carray.c ../../imageproc-lib/sclock.c ../../imageproc-lib/at86rf231_driver.c ../../imageproc-lib/mac_packet.c ../../imageproc-lib/ppool.c ../../imageproc-lib/uart_driver.c ../lib/init.c ../lib/interrupts.c ../lib/cmd.c ../lib/move_queue.c ../lib/steering.c ../lib/motor_ctrl.c ../lib/pid-ip2.5.c ../lib/telemetry.c ../lib/cmd-motor.c ../lib/uart_send.c ../lib/cmd-aux.c ../lib/tests.c ../main.c

# Object Files Quoted if spaced
OBJECTFILES_QUOTED_IF_SPACED=${OBJECTDIR}/_ext/1290873929/delay.o ${OBJECTDIR}/_ext/1290873929/dfmem.o ${OBJECTDIR}/_ext/1290873929/i2c_driver.o ${OBJECTDIR}/_ext/1290873929/init_default.o ${OBJECTDIR}/_ext/1290873929/larray.o ${OBJECTDIR}/_ext/1290873929/mpu6000.o ${OBJECTDIR}/_ext/1290873929/packet_queue.o ${OBJECTDIR}/_ext/1290873929/payload.o ${OBJECTDIR}/_ext/1290873929/payload_queue.o ${OBJECTDIR}/_ext/1290873929/queue.o ${OBJECTDIR}/_ext/1290873929/radio.o ${OBJECTDIR}/_ext/1290873929/spi_controller.o ${OBJECTDIR}/_ext/1290873929/stopwatch.o ${OBJECTDIR}/_ext/1290873929/tih.o ${OBJECTDIR}/_ext/1290873929/version.o ${OBJECTDIR}/_ext/1290873929/adc_pid.o ${OBJECTDIR}/_ext/1290873929/ams-enc.o ${OBJECTDIR}/_ext/1290873929/battery.o ${OBJECTDIR}/_ext/1290873929/blink.o ${OBJECTDIR}/_ext/1290873929/carray.o ${OBJECTDIR}/_ext/1290873929/sclock.o ${OBJECTDIR}/_ext/1290873929/at86rf231_driver.o ${OBJECTDIR}/_ext/1290873929/mac_packet.o ${OBJECTDIR}/_ext/1290873929/ppool.o ${OBJECTDIR}/_ext/1290873929/uart_driver.o ${OBJECTDIR}/_ext/1360930230/init.o ${OBJECTDIR}/_ext/1360930230/interrupts.o ${OBJECTDIR}/_ext/1360930230/cmd.o ${OBJECTDIR}/_ext/1360930230/move_queue.o ${OBJECTDIR}/_ext/1360930230/steering.o ${OBJECTDIR}/_ext/1360930230/motor_ctrl.o ${OBJECTDIR}/_ext/1360930230/pid-ip2.5.o ${OBJECTDIR}/_ext/1360930230/telemetry.o ${OBJECTDIR}/_ext/1360930230/cmd-motor.o ${OBJECTDIR}/_ext/1360930230/uart_send.o ${OBJECTDIR}/_ext/1360930230/cmd-aux.o ${OBJECTDIR}/_ext/1360930230/tests.o ${OBJECTDIR}/_ext/1472/main.o
POSSIBLE_DEPFILES=${OBJECTDIR}/_ext/1290873929/delay.o.d ${OBJECTDIR}/_ext/1290873929/dfmem.o.d ${OBJECTDIR}/_ext/1290873929/i2c_driver.o.d ${OBJECTDIR}/_ext/1290873929/init_default.o.d ${OBJECTDIR}/_ext/1290873929/larray.o.d ${OBJECTDIR}/_ext/1290873929/mpu6000.o.d ${OBJECTDIR}/_ext/1290873929/packet_queue.o.d ${OBJECTDIR}/_ext/1290873929/payload.o.d ${OBJECTDIR}/_ext/1290873929/payload_queue.o.d ${OBJECTDIR}/_ext/1290873929/queue.o.d ${OBJECTDIR}/_ext/1290873929/radio.o.d ${OBJECTDIR}/_ext/1290873929/spi_controller.o.d ${OBJECTDIR}/_ext/1290873929/stopwatch.o.d ${OBJECTDIR}/_ext/1290873929/tih.o.d ${OBJECTDIR}/_ext/1290873929/version.o.d ${OBJECTDIR}/_ext/1290873929/adc_pid.o.d ${OBJECTDIR}/_ext/1290873929/ams-enc.o.d ${OBJECTDIR}/_ext/1290873929/battery.o.d ${OBJECTDIR}/_ext/1290873929/blink.o.d ${OBJECTDIR}/_ext/1290873929/carray.o.d ${OBJECTDIR}/_ext/1290873929/sclock.o.d ${OBJECTDIR}/_ext/1290873929/at86rf231_driver.o.d ${OBJECTDIR}/_ext/1290873929/mac_packet.o.d ${OBJECTDIR}/_ext/1290873929/ppool.o.d ${OBJECTDIR}/_ext/1290873929/uart_driver.o.d ${OBJECTDIR}/_ext/1360930230/init.o.d ${OBJECTDIR}/_ext/1360930230/interrupts.o.d ${OBJECTDIR}/_ext/1360930230/cmd.o.d ${OBJECTDIR}/_ext/1360930230/move_queue.o.d ${OBJECTDIR}/_ext/1360930230/steering.o.d ${OBJECTDIR}/_ext/1360930230/motor_ctrl.o.d ${OBJECTDIR}/_ext/1360930230/pid-ip2.5.o.d ${OBJECTDIR}/_ext/1360930230/telemetry.o.d ${OBJECTDIR}/_ext/1360930230/cmd-motor.o.d ${OBJECTDIR}/_ext/1360930230/uart_send.o.d ${OBJECTDIR}/_ext/1360930230/cmd-aux.o.d ${OBJECTDIR}/_ext/1360930230/tests.o.d ${OBJECTDIR}/_ext/1472/main.o.d

# Object Files
OBJECTFILES=${OBJECTDIR}/_ext/1290873929/delay.o ${OBJECTDIR}/_ext/1290873929/dfmem.o ${OBJECTDIR}/_ext/1290873929/i2c_driver.o ${OBJECTDIR}/_ext/1290873929/init_default.o ${OBJECTDIR}/_ext/1290873929/larray.o ${OBJECTDIR}/_ext/1290873929/mpu6000.o ${OBJECTDIR}/_ext/1290873929/packet_queue.o ${OBJECTDIR}/_ext/1290873929/payload.o ${OBJECTDIR}/_ext/1290873929/payload_queue.o ${OBJECTDIR}/_ext/1290873929/queue.o ${OBJECTDIR}/_ext/1290873929/radio.o ${OBJECTDIR}/_ext/1290873929/spi_controller.o ${OBJECTDIR}/_ext/1290873929/stopwatch.o ${OBJECTDIR}/_ext/1290873929/tih.o ${OBJECTDIR}/_ext/1290873929/version.o ${OBJECTDIR}/_ext/1290873929/adc_pid.o ${OBJECTDIR}/_ext/1290873929/ams-enc.o ${OBJECTDIR}/_ext/1290873929/battery.o ${OBJECTDIR}/_ext/1290873929/blink.o ${OBJECTDIR}/_ext/1290873929/carray.o ${OBJECTDIR}/_ext/1290873929/sclock.o ${OBJECTDIR}/_ext/1290873929/at86rf231_driver.o ${OBJECTDIR}/_ext/1290873929/mac_packet.o ${OBJECTDIR}/_ext/1290873929/ppool.o ${OBJECTDIR}/_ext/1290873929/uart_driver.o ${OBJECTDIR}/_ext/1360930230/init.o ${OBJECTDIR}/_ext/1360930230/interrupts.o ${OBJECTDIR}/_ext/1360930230/cmd.o ${OBJECTDIR}/_ext/1360930230/move_queue.o ${OBJECTDIR}/_ext/1360930230/steering.o ${OBJECTDIR}/_ext/1360930230/motor_ctrl.o ${OBJECTDIR}/_ext/1360930230/pid-ip2.5.o ${OBJECTDIR}/_ext/1360930230/telemetry.o ${OBJECTDIR}/_ext/1360930230/cmd-motor.o ${OBJECTDIR}/_ext/1360930230/uart_send.o ${OBJECTDIR}/_ext/1360930230/cmd-aux.o ${OBJECTDIR}/_ext/1360930230/tests.o ${OBJECTDIR}/_ext/1472/main.o

# Source Files
SOURCEFILES=../../imageproc-lib/delay.s ../../imageproc-lib/dfmem.c ../../imageproc-lib/i2c_driver.c ../../imageproc-lib/init_default.c ../../imageproc-lib/larray.c ../../imageproc-lib/mpu6000.c ../../imageproc-lib/packet_queue.c ../../imageproc-lib/payload.c ../../imageproc-lib/payload_queue.c ../../imageproc-lib/queue.c ../../imageproc-lib/radio.c ../../imageproc-lib/spi_controller.c ../../imageproc-lib/stopwatch.c ../../imageproc-lib/tih.c ../../imageproc-lib/version.c ../../imageproc-lib/adc_pid.c ../../imageproc-lib/ams-enc.c ../../imageproc-lib/battery.c ../../imageproc-lib/blink.c ../../imageproc-lib/carray.c ../../imageproc-lib/sclock.c ../../imageproc-lib/at86rf231_driver.c ../../imageproc-lib/mac_packet.c ../../imageproc-lib/ppool.c ../../imageproc-lib/uart_driver.c ../lib/init.c ../lib/interrupts.c ../lib/cmd.c ../lib/move_queue.c ../lib/steering.c ../lib/motor_ctrl.c ../lib/pid-ip2.5.c ../lib/telemetry.c ../lib/cmd-motor.c ../lib/uart_send.c ../lib/cmd-aux.c ../lib/tests.c ../main.c


CFLAGS=
ASFLAGS=
LDLIBSOPTIONS=

############# Tool locations ##########################################
# If you copy a project from one host to another, the path where the  #
# compiler is installed may be different.                             #
# If you open this project with MPLAB X in the new host, this         #
# makefile will be regenerated and the paths will be corrected.       #
#######################################################################
# fixDeps replaces a bunch of sed/cat/printf statements that slow down the build
FIXDEPS=fixDeps

# The following macros may be used in the pre and post step lines
Device=dsPIC33FJ128MC706A
ProjectDir="C:\Users\ronf\Research\development\turner-ip2.5\turner-ip25.X"
ConfName=default
ImagePath="dist\default\${IMAGE_TYPE}\turner-ip25.X.${IMAGE_TYPE}.${OUTPUT_SUFFIX}"
ImageDir="dist\default\${IMAGE_TYPE}"
ImageName="turner-ip25.X.${IMAGE_TYPE}.${OUTPUT_SUFFIX}"
ifeq ($(TYPE_IMAGE), DEBUG_RUN)
IsDebug="true"
else
IsDebug="false"
endif

.build-conf:  .pre ${BUILD_SUBPROJECTS}
ifneq ($(INFORMATION_MESSAGE), )
	@echo $(INFORMATION_MESSAGE)
endif
	${MAKE}  -f nbproject/Makefile-default.mk dist/${CND_CONF}/${IMAGE_TYPE}/turner-ip25.X.${IMAGE_TYPE}.${OUTPUT_SUFFIX}

MP_PROCESSOR_OPTION=33FJ128MC706A
MP_LINKER_FILE_OPTION=,--script=p33FJ128MC706A.gld
# ------------------------------------------------------------------------------------
# Rules for buildStep: compile
ifeq ($(TYPE_IMAGE), DEBUG_RUN)
${OBJECTDIR}/_ext/1290873929/dfmem.o: ../../imageproc-lib/dfmem.c  nbproject/Makefile-${CND_CONF}.mk
	@${MKDIR} ${OBJECTDIR}/_ext/1290873929 
	@${RM} ${OBJECTDIR}/_ext/1290873929/dfmem.o.d 
	@${RM} ${OBJECTDIR}/_ext/1290873929/dfmem.o 
	${MP_CC} $(MP_EXTRA_CC_PRE)  ../../imageproc-lib/dfmem.c  -o ${OBJECTDIR}/_ext/1290873929/dfmem.o  -c -mcpu=$(MP_PROCESSOR_OPTION)  -MMD -MF "${OBJECTDIR}/_ext/1290873929/dfmem.o.d"      -g -D__DEBUG -D__MPLAB_DEBUGGER_ICD3=1    -omf=elf -O0 -I"../lib" -I"../MyConsts" -I"../../imageproc-lib" -I".." -I"." -D__IMAGEPROC25 -DPID_HARDWARE -msmart-io=1 -Wall -msfr-warn=off
	@${FIXDEPS} "${OBJECTDIR}/_ext/1290873929/dfmem.o.d" $(SILENT)  -rsi ${MP_CC_DIR}../ 
	
${OBJECTDIR}/_ext/1290873929/i2c_driver.o: ../../imageproc-lib/i2c_driver.c  nbproject/Makefile-${CND_CONF}.mk
	@${MKDIR} ${OBJECTDIR}/_ext/1290873929 
	@${RM} ${OBJECTDIR}/_ext/1290873929/i2c_driver.o.d 
	@${RM} ${OBJECTDIR}/_ext/1290873929/i2c_driver.o 
	${MP_CC} $(MP_EXTRA_CC_PRE)  ../../imageproc-lib/i2c_driver.c  -o ${OBJECTDIR}/_ext/1290873929/i2c_driver.o  -c -mcpu=$(MP_PROCESSOR_OPTION)  -MMD -MF "${OBJECTDIR}/_ext/1290873929/i2c_driver.o.d"      -g -D__DEBUG -D__MPLAB_DEBUGGER_ICD3=1    -omf=elf -O0 -I"../lib" -I"../MyConsts" -I"../../imageproc-lib" -I".." -I"." -D__IMAGEPROC25 -DPID_HARDWARE -msmart-io=1 -Wall -msfr-warn=off
	@${FIXDEPS} "${OBJECTDIR}/_ext/1290873929/i2c_driver.o.d" $(SILENT)  -rsi ${MP_CC_DIR}../ 
	
${OBJECTDIR}/_ext/1290873929/init_default.o: ../../imageproc-lib/init_default.c  nbproject/Makefile-${CND_CONF}.mk
	@${MKDIR} ${OBJECTDIR}/_ext/1290873929 
	@${RM} ${OBJECTDIR}/_ext/1290873929/init_default.o.d 
	@${RM} ${OBJECTDIR}/_ext/1290873929/init_default.o 
	${MP_CC} $(MP_EXTRA_CC_PRE)  ../../imageproc-lib/init_default.c  -o ${OBJECTDIR}/_ext/1290873929/init_default.o  -c -mcpu=$(MP_PROCESSOR_OPTION)  -MMD -MF "${OBJECTDIR}/_ext/1290873929/init_default.o.d"      -g -D__DEBUG -D__MPLAB_DEBUGGER_ICD3=1    -omf=elf -O0 -I"../lib" -I"../MyConsts" -I"../../imageproc-lib" -I".." -I"." -D__IMAGEPROC25 -DPID_HARDWARE -msmart-io=1 -Wall -msfr-warn=off
	@${FIXDEPS} "${OBJECTDIR}/_ext/1290873929/init_default.o.d" $(SILENT)  -rsi ${MP_CC_DIR}../ 
	
${OBJECTDIR}/_ext/1290873929/larray.o: ../../imageproc-lib/larray.c  nbproject/Makefile-${CND_CONF}.mk
	@${MKDIR} ${OBJECTDIR}/_ext/1290873929 
	@${RM} ${OBJECTDIR}/_ext/1290873929/larray.o.d 
	@${RM} ${OBJECTDIR}/_ext/1290873929/larray.o 
	${MP_CC} $(MP_EXTRA_CC_PRE)  ../../imageproc-lib/larray.c  -o ${OBJECTDIR}/_ext/1290873929/larray.o  -c -mcpu=$(MP_PROCESSOR_OPTION)  -MMD -MF "${OBJECTDIR}/_ext/1290873929/larray.o.d"      -g -D__DEBUG -D__MPLAB_DEBUGGER_ICD3=1    -omf=elf -O0 -I"../lib" -I"../MyConsts" -I"../../imageproc-lib" -I".." -I"." -D__IMAGEPROC25 -DPID_HARDWARE -msmart-io=1 -Wall -msfr-warn=off
	@${FIXDEPS} "${OBJECTDIR}/_ext/1290873929/larray.o.d" $(SILENT)  -rsi ${MP_CC_DIR}../ 
	
${OBJECTDIR}/_ext/1290873929/mpu6000.o: ../../imageproc-lib/mpu6000.c  nbproject/Makefile-${CND_CONF}.mk
	@${MKDIR} ${OBJECTDIR}/_ext/1290873929 
	@${RM} ${OBJECTDIR}/_ext/1290873929/mpu6000.o.d 
	@${RM} ${OBJECTDIR}/_ext/1290873929/mpu6000.o 
	${MP_CC} $(MP_EXTRA_CC_PRE)  ../../imageproc-lib/mpu6000.c  -o ${OBJECTDIR}/_ext/1290873929/mpu6000.o  -c -mcpu=$(MP_PROCESSOR_OPTION)  -MMD -MF "${OBJECTDIR}/_ext/1290873929/mpu6000.o.d"      -g -D__DEBUG -D__MPLAB_DEBUGGER_ICD3=1    -omf=elf -O0 -I"../lib" -I"../MyConsts" -I"../../imageproc-lib" -I".." -I"." -D__IMAGEPROC25 -DPID_HARDWARE -msmart-io=1 -Wall -msfr-warn=off
	@${FIXDEPS} "${OBJECTDIR}/_ext/1290873929/mpu6000.o.d" $(SILENT)  -rsi ${MP_CC_DIR}../ 
	
${OBJECTDIR}/_ext/1290873929/packet_queue.o: ../../imageproc-lib/packet_queue.c  nbproject/Makefile-${CND_CONF}.mk
	@${MKDIR} ${OBJECTDIR}/_ext/1290873929 
	@${RM} ${OBJECTDIR}/_ext/1290873929/packet_queue.o.d 
	@${RM} ${OBJECTDIR}/_ext/1290873929/packet_queue.o 
	${MP_CC} $(MP_EXTRA_CC_PRE)  ../../imageproc-lib/packet_queue.c  -o ${OBJECTDIR}/_ext/1290873929/packet_queue.o  -c -mcpu=$(MP_PROCESSOR_OPTION)  -MMD -MF "${OBJECTDIR}/_ext/1290873929/packet_queue.o.d"      -g -D__DEBUG -D__MPLAB_DEBUGGER_ICD3=1    -omf=elf -O0 -I"../lib" -I"../MyConsts" -I"../../imageproc-lib" -I".." -I"." -D__IMAGEPROC25 -DPID_HARDWARE -msmart-io=1 -Wall -msfr-warn=off
	@${FIXDEPS} "${OBJECTDIR}/_ext/1290873929/packet_queue.o.d" $(SILENT)  -rsi ${MP_CC_DIR}../ 
	
${OBJECTDIR}/_ext/1290873929/payload.o: ../../imageproc-lib/payload.c  nbproject/Makefile-${CND_CONF}.mk
	@${MKDIR} ${OBJECTDIR}/_ext/1290873929 
	@${RM} ${OBJECTDIR}/_ext/1290873929/payload.o.d 
	@${RM} ${OBJECTDIR}/_ext/1290873929/payload.o 
	${MP_CC} $(MP_EXTRA_CC_PRE)  ../../imageproc-lib/payload.c  -o ${OBJECTDIR}/_ext/1290873929/payload.o  -c -mcpu=$(MP_PROCESSOR_OPTION)  -MMD -MF "${OBJECTDIR}/_ext/1290873929/payload.o.d"      -g -D__DEBUG -D__MPLAB_DEBUGGER_ICD3=1    -omf=elf -O0 -I"../lib" -I"../MyConsts" -I"../../imageproc-lib" -I".." -I"." -D__IMAGEPROC25 -DPID_HARDWARE -msmart-io=1 -Wall -msfr-warn=off
	@${FIXDEPS} "${OBJECTDIR}/_ext/1290873929/payload.o.d" $(SILENT)  -rsi ${MP_CC_DIR}../ 
	
${OBJECTDIR}/_ext/1290873929/payload_queue.o: ../../imageproc-lib/payload_queue.c  nbproject/Makefile-${CND_CONF}.mk
	@${MKDIR} ${OBJECTDIR}/_ext/1290873929 
	@${RM} ${OBJECTDIR}/_ext/1290873929/payload_queue.o.d 
	@${RM} ${OBJECTDIR}/_ext/1290873929/payload_queue.o 
	${MP_CC} $(MP_EXTRA_CC_PRE)  ../../imageproc-lib/payload_queue.c  -o ${OBJECTDIR}/_ext/1290873929/payload_queue.o  -c -mcpu=$(MP_PROCESSOR_OPTION)  -MMD -MF "${OBJECTDIR}/_ext/1290873929/payload_queue.o.d"      -g -D__DEBUG -D__MPLAB_DEBUGGER_ICD3=1    -omf=elf -O0 -I"../lib" -I"../MyConsts" -I"../../imageproc-lib" -I".." -I"." -D__IMAGEPROC25 -DPID_HARDWARE -msmart-io=1 -Wall -msfr-warn=off
	@${FIXDEPS} "${OBJECTDIR}/_ext/1290873929/payload_queue.o.d" $(SILENT)  -rsi ${MP_CC_DIR}../ 
	
${OBJECTDIR}/_ext/1290873929/queue.o: ../../imageproc-lib/queue.c  nbproject/Makefile-${CND_CONF}.mk
	@${MKDIR} ${OBJECTDIR}/_ext/1290873929 
	@${RM} ${OBJECTDIR}/_ext/1290873929/queue.o.d 
	@${RM} ${OBJECTDIR}/_ext/1290873929/queue.o 
	${MP_CC} $(MP_EXTRA_CC_PRE)  ../../imageproc-lib/queue.c  -o ${OBJECTDIR}/_ext/1290873929/queue.o  -c -mcpu=$(MP_PROCESSOR_OPTION)  -MMD -MF "${OBJECTDIR}/_ext/1290873929/queue.o.d"      -g -D__DEBUG -D__MPLAB_DEBUGGER_ICD3=1    -omf=elf -O0 -I"../lib" -I"../MyConsts" -I"../../imageproc-lib" -I".." -I"." -D__IMAGEPROC25 -DPID_HARDWARE -msmart-io=1 -Wall -msfr-warn=off
	@${FIXDEPS} "${OBJECTDIR}/_ext/1290873929/queue.o.d" $(SILENT)  -rsi ${MP_CC_DIR}../ 
	
${OBJECTDIR}/_ext/1290873929/radio.o: ../../imageproc-lib/radio.c  nbproject/Makefile-${CND_CONF}.mk
	@${MKDIR} ${OBJECTDIR}/_ext/1290873929 
	@${RM} ${OBJECTDIR}/_ext/1290873929/radio.o.d 
	@${RM} ${OBJECTDIR}/_ext/1290873929/radio.o 
	${MP_CC} $(MP_EXTRA_CC_PRE)  ../../imageproc-lib/radio.c  -o ${OBJECTDIR}/_ext/1290873929/radio.o  -c -mcpu=$(MP_PROCESSOR_OPTION)  -MMD -MF "${OBJECTDIR}/_ext/1290873929/radio.o.d"      -g -D__DEBUG -D__MPLAB_DEBUGGER_ICD3=1    -omf=elf -O0 -I"../lib" -I"../MyConsts" -I"../../imageproc-lib" -I".." -I"." -D__IMAGEPROC25 -DPID_HARDWARE -msmart-io=1 -Wall -msfr-warn=off
	@${FIXDEPS} "${OBJECTDIR}/_ext/1290873929/radio.o.d" $(SILENT)  -rsi ${MP_CC_DIR}../ 
	
${OBJECTDIR}/_ext/1290873929/spi_controller.o: ../../imageproc-lib/spi_controller.c  nbproject/Makefile-${CND_CONF}.mk
	@${MKDIR} ${OBJECTDIR}/_ext/1290873929 
	@${RM} ${OBJECTDIR}/_ext/1290873929/spi_controller.o.d 
	@${RM} ${OBJECTDIR}/_ext/1290873929/spi_controller.o 
	${MP_CC} $(MP_EXTRA_CC_PRE)  ../../imageproc-lib/spi_controller.c  -o ${OBJECTDIR}/_ext/1290873929/spi_controller.o  -c -mcpu=$(MP_PROCESSOR_OPTION)  -MMD -MF "${OBJECTDIR}/_ext/1290873929/spi_controller.o.d"      -g -D__DEBUG -D__MPLAB_DEBUGGER_ICD3=1    -omf=elf -O0 -I"../lib" -I"../MyConsts" -I"../../imageproc-lib" -I".." -I"." -D__IMAGEPROC25 -DPID_HARDWARE -msmart-io=1 -Wall -msfr-warn=off
	@${FIXDEPS} "${OBJECTDIR}/_ext/1290873929/spi_controller.o.d" $(SILENT)  -rsi ${MP_CC_DIR}../ 
	
${OBJECTDIR}/_ext/1290873929/stopwatch.o: ../../imageproc-lib/stopwatch.c  nbproject/Makefile-${CND_CONF}.mk
	@${MKDIR} ${OBJECTDIR}/_ext/1290873929 
	@${RM} ${OBJECTDIR}/_ext/1290873929/stopwatch.o.d 
	@${RM} ${OBJECTDIR}/_ext/1290873929/stopwatch.o 
	${MP_CC} $(MP_EXTRA_CC_PRE)  ../../imageproc-lib/stopwatch.c  -o ${OBJECTDIR}/_ext/1290873929/stopwatch.o  -c -mcpu=$(MP_PROCESSOR_OPTION)  -MMD -MF "${OBJECTDIR}/_ext/1290873929/stopwatch.o.d"      -g -D__DEBUG -D__MPLAB_DEBUGGER_ICD3=1    -omf=elf -O0 -I"../lib" -I"../MyConsts" -I"../../imageproc-lib" -I".." -I"." -D__IMAGEPROC25 -DPID_HARDWARE -msmart-io=1 -Wall -msfr-warn=off
	@${FIXDEPS} "${OBJECTDIR}/_ext/1290873929/stopwatch.o.d" $(SILENT)  -rsi ${MP_CC_DIR}../ 
	
${OBJECTDIR}/_ext/1290873929/tih.o: ../../imageproc-lib/tih.c  nbproject/Makefile-${CND_CONF}.mk
	@${MKDIR} ${OBJECTDIR}/_ext/1290873929 
	@${RM} ${OBJECTDIR}/_ext/1290873929/tih.o.d 
	@${RM} ${OBJECTDIR}/_ext/1290873929/tih.o 
	${MP_CC} $(MP_EXTRA_CC_PRE)  ../../imageproc-lib/tih.c  -o ${OBJECTDIR}/_ext/1290873929/tih.o  -c -mcpu=$(MP_PROCESSOR_OPTION)  -MMD -MF "${OBJECTDIR}/_ext/1290873929/tih.o.d"      -g -D__DEBUG -D__MPLAB_DEBUGGER_ICD3=1    -omf=elf -O0 -I"../lib" -I"../MyConsts" -I"../../imageproc-lib" -I".." -I"." -D__IMAGEPROC25 -DPID_HARDWARE -msmart-io=1 -Wall -msfr-warn=off
	@${FIXDEPS} "${OBJECTDIR}/_ext/1290873929/tih.o.d" $(SILENT)  -rsi ${MP_CC_DIR}../ 
	
${OBJECTDIR}/_ext/1290873929/version.o: ../../imageproc-lib/version.c  nbproject/Makefile-${CND_CONF}.mk
	@${MKDIR} ${OBJECTDIR}/_ext/1290873929 
	@${RM} ${OBJECTDIR}/_ext/1290873929/version.o.d 
	@${RM} ${OBJECTDIR}/_ext/1290873929/version.o 
	${MP_CC} $(MP_EXTRA_CC_PRE)  ../../imageproc-lib/version.c  -o ${OBJECTDIR}/_ext/1290873929/version.o  -c -mcpu=$(MP_PROCESSOR_OPTION)  -MMD -MF "${OBJECTDIR}/_ext/1290873929/version.o.d"      -g -D__DEBUG -D__MPLAB_DEBUGGER_ICD3=1    -omf=elf -O0 -I"../lib" -I"../MyConsts" -I"../../imageproc-lib" -I".." -I"." -D__IMAGEPROC25 -DPID_HARDWARE -msmart-io=1 -Wall -msfr-warn=off
	@${FIXDEPS} "${OBJECTDIR}/_ext/1290873929/version.o.d" $(SILENT)  -rsi ${MP_CC_DIR}../ 
	
${OBJECTDIR}/_ext/1290873929/adc_pid.o: ../../imageproc-lib/adc_pid.c  nbproject/Makefile-${CND_CONF}.mk
	@${MKDIR} ${OBJECTDIR}/_ext/1290873929 
	@${RM} ${OBJECTDIR}/_ext/1290873929/adc_pid.o.d 
	@${RM} ${OBJECTDIR}/_ext/1290873929/adc_pid.o 
	${MP_CC} $(MP_EXTRA_CC_PRE)  ../../imageproc-lib/adc_pid.c  -o ${OBJECTDIR}/_ext/1290873929/adc_pid.o  -c -mcpu=$(MP_PROCESSOR_OPTION)  -MMD -MF "${OBJECTDIR}/_ext/1290873929/adc_pid.o.d"      -g -D__DEBUG -D__MPLAB_DEBUGGER_ICD3=1    -omf=elf -O0 -I"../lib" -I"../MyConsts" -I"../../imageproc-lib" -I".." -I"." -D__IMAGEPROC25 -DPID_HARDWARE -msmart-io=1 -Wall -msfr-warn=off
	@${FIXDEPS} "${OBJECTDIR}/_ext/1290873929/adc_pid.o.d" $(SILENT)  -rsi ${MP_CC_DIR}../ 
	
${OBJECTDIR}/_ext/1290873929/ams-enc.o: ../../imageproc-lib/ams-enc.c  nbproject/Makefile-${CND_CONF}.mk
	@${MKDIR} ${OBJECTDIR}/_ext/1290873929 
	@${RM} ${OBJECTDIR}/_ext/1290873929/ams-enc.o.d 
	@${RM} ${OBJECTDIR}/_ext/1290873929/ams-enc.o 
	${MP_CC} $(MP_EXTRA_CC_PRE)  ../../imageproc-lib/ams-enc.c  -o ${OBJECTDIR}/_ext/1290873929/ams-enc.o  -c -mcpu=$(MP_PROCESSOR_OPTION)  -MMD -MF "${OBJECTDIR}/_ext/1290873929/ams-enc.o.d"      -g -D__DEBUG -D__MPLAB_DEBUGGER_ICD3=1    -omf=elf -O0 -I"../lib" -I"../MyConsts" -I"../../imageproc-lib" -I".." -I"." -D__IMAGEPROC25 -DPID_HARDWARE -msmart-io=1 -Wall -msfr-warn=off
	@${FIXDEPS} "${OBJECTDIR}/_ext/1290873929/ams-enc.o.d" $(SILENT)  -rsi ${MP_CC_DIR}../ 
	
${OBJECTDIR}/_ext/1290873929/battery.o: ../../imageproc-lib/battery.c  nbproject/Makefile-${CND_CONF}.mk
	@${MKDIR} ${OBJECTDIR}/_ext/1290873929 
	@${RM} ${OBJECTDIR}/_ext/1290873929/battery.o.d 
	@${RM} ${OBJECTDIR}/_ext/1290873929/battery.o 
	${MP_CC} $(MP_EXTRA_CC_PRE)  ../../imageproc-lib/battery.c  -o ${OBJECTDIR}/_ext/1290873929/battery.o  -c -mcpu=$(MP_PROCESSOR_OPTION)  -MMD -MF "${OBJECTDIR}/_ext/1290873929/battery.o.d"      -g -D__DEBUG -D__MPLAB_DEBUGGER_ICD3=1    -omf=elf -O0 -I"../lib" -I"../MyConsts" -I"../../imageproc-lib" -I".." -I"." -D__IMAGEPROC25 -DPID_HARDWARE -msmart-io=1 -Wall -msfr-warn=off
	@${FIXDEPS} "${OBJECTDIR}/_ext/1290873929/battery.o.d" $(SILENT)  -rsi ${MP_CC_DIR}../ 
	
${OBJECTDIR}/_ext/1290873929/blink.o: ../../imageproc-lib/blink.c  nbproject/Makefile-${CND_CONF}.mk
	@${MKDIR} ${OBJECTDIR}/_ext/1290873929 
	@${RM} ${OBJECTDIR}/_ext/1290873929/blink.o.d 
	@${RM} ${OBJECTDIR}/_ext/1290873929/blink.o 
	${MP_CC} $(MP_EXTRA_CC_PRE)  ../../imageproc-lib/blink.c  -o ${OBJECTDIR}/_ext/1290873929/blink.o  -c -mcpu=$(MP_PROCESSOR_OPTION)  -MMD -MF "${OBJECTDIR}/_ext/1290873929/blink.o.d"      -g -D__DEBUG -D__MPLAB_DEBUGGER_ICD3=1    -omf=elf -O0 -I"../lib" -I"../MyConsts" -I"../../imageproc-lib" -I".." -I"." -D__IMAGEPROC25 -DPID_HARDWARE -msmart-io=1 -Wall -msfr-warn=off
	@${FIXDEPS} "${OBJECTDIR}/_ext/1290873929/blink.o.d" $(SILENT)  -rsi ${MP_CC_DIR}../ 
	
${OBJECTDIR}/_ext/1290873929/carray.o: ../../imageproc-lib/carray.c  nbproject/Makefile-${CND_CONF}.mk
	@${MKDIR} ${OBJECTDIR}/_ext/1290873929 
	@${RM} ${OBJECTDIR}/_ext/1290873929/carray.o.d 
	@${RM} ${OBJECTDIR}/_ext/1290873929/carray.o 
	${MP_CC} $(MP_EXTRA_CC_PRE)  ../../imageproc-lib/carray.c  -o ${OBJECTDIR}/_ext/1290873929/carray.o  -c -mcpu=$(MP_PROCESSOR_OPTION)  -MMD -MF "${OBJECTDIR}/_ext/1290873929/carray.o.d"      -g -D__DEBUG -D__MPLAB_DEBUGGER_ICD3=1    -omf=elf -O0 -I"../lib" -I"../MyConsts" -I"../../imageproc-lib" -I".." -I"." -D__IMAGEPROC25 -DPID_HARDWARE -msmart-io=1 -Wall -msfr-warn=off
	@${FIXDEPS} "${OBJECTDIR}/_ext/1290873929/carray.o.d" $(SILENT)  -rsi ${MP_CC_DIR}../ 
	
${OBJECTDIR}/_ext/1290873929/sclock.o: ../../imageproc-lib/sclock.c  nbproject/Makefile-${CND_CONF}.mk
	@${MKDIR} ${OBJECTDIR}/_ext/1290873929 
	@${RM} ${OBJECTDIR}/_ext/1290873929/sclock.o.d 
	@${RM} ${OBJECTDIR}/_ext/1290873929/sclock.o 
	${MP_CC} $(MP_EXTRA_CC_PRE)  ../../imageproc-lib/sclock.c  -o ${OBJECTDIR}/_ext/1290873929/sclock.o  -c -mcpu=$(MP_PROCESSOR_OPTION)  -MMD -MF "${OBJECTDIR}/_ext/1290873929/sclock.o.d"      -g -D__DEBUG -D__MPLAB_DEBUGGER_ICD3=1    -omf=elf -O0 -I"../lib" -I"../MyConsts" -I"../../imageproc-lib" -I".." -I"." -D__IMAGEPROC25 -DPID_HARDWARE -msmart-io=1 -Wall -msfr-warn=off
	@${FIXDEPS} "${OBJECTDIR}/_ext/1290873929/sclock.o.d" $(SILENT)  -rsi ${MP_CC_DIR}../ 
	
${OBJECTDIR}/_ext/1290873929/at86rf231_driver.o: ../../imageproc-lib/at86rf231_driver.c  nbproject/Makefile-${CND_CONF}.mk
	@${MKDIR} ${OBJECTDIR}/_ext/1290873929 
	@${RM} ${OBJECTDIR}/_ext/1290873929/at86rf231_driver.o.d 
	@${RM} ${OBJECTDIR}/_ext/1290873929/at86rf231_driver.o 
	${MP_CC} $(MP_EXTRA_CC_PRE)  ../../imageproc-lib/at86rf231_driver.c  -o ${OBJECTDIR}/_ext/1290873929/at86rf231_driver.o  -c -mcpu=$(MP_PROCESSOR_OPTION)  -MMD -MF "${OBJECTDIR}/_ext/1290873929/at86rf231_driver.o.d"      -g -D__DEBUG -D__MPLAB_DEBUGGER_ICD3=1    -omf=elf -O0 -I"../lib" -I"../MyConsts" -I"../../imageproc-lib" -I".." -I"." -D__IMAGEPROC25 -DPID_HARDWARE -msmart-io=1 -Wall -msfr-warn=off
	@${FIXDEPS} "${OBJECTDIR}/_ext/1290873929/at86rf231_driver.o.d" $(SILENT)  -rsi ${MP_CC_DIR}../ 
	
${OBJECTDIR}/_ext/1290873929/mac_packet.o: ../../imageproc-lib/mac_packet.c  nbproject/Makefile-${CND_CONF}.mk
	@${MKDIR} ${OBJECTDIR}/_ext/1290873929 
	@${RM} ${OBJECTDIR}/_ext/1290873929/mac_packet.o.d 
	@${RM} ${OBJECTDIR}/_ext/1290873929/mac_packet.o 
	${MP_CC} $(MP_EXTRA_CC_PRE)  ../../imageproc-lib/mac_packet.c  -o ${OBJECTDIR}/_ext/1290873929/mac_packet.o  -c -mcpu=$(MP_PROCESSOR_OPTION)  -MMD -MF "${OBJECTDIR}/_ext/1290873929/mac_packet.o.d"      -g -D__DEBUG -D__MPLAB_DEBUGGER_ICD3=1    -omf=elf -O0 -I"../lib" -I"../MyConsts" -I"../../imageproc-lib" -I".." -I"." -D__IMAGEPROC25 -DPID_HARDWARE -msmart-io=1 -Wall -msfr-warn=off
	@${FIXDEPS} "${OBJECTDIR}/_ext/1290873929/mac_packet.o.d" $(SILENT)  -rsi ${MP_CC_DIR}../ 
	
${OBJECTDIR}/_ext/1290873929/ppool.o: ../../imageproc-lib/ppool.c  nbproject/Makefile-${CND_CONF}.mk
	@${MKDIR} ${OBJECTDIR}/_ext/1290873929 
	@${RM} ${OBJECTDIR}/_ext/1290873929/ppool.o.d 
	@${RM} ${OBJECTDIR}/_ext/1290873929/ppool.o 
	${MP_CC} $(MP_EXTRA_CC_PRE)  ../../imageproc-lib/ppool.c  -o ${OBJECTDIR}/_ext/1290873929/ppool.o  -c -mcpu=$(MP_PROCESSOR_OPTION)  -MMD -MF "${OBJECTDIR}/_ext/1290873929/ppool.o.d"      -g -D__DEBUG -D__MPLAB_DEBUGGER_ICD3=1    -omf=elf -O0 -I"../lib" -I"../MyConsts" -I"../../imageproc-lib" -I".." -I"." -D__IMAGEPROC25 -DPID_HARDWARE -msmart-io=1 -Wall -msfr-warn=off
	@${FIXDEPS} "${OBJECTDIR}/_ext/1290873929/ppool.o.d" $(SILENT)  -rsi ${MP_CC_DIR}../ 
	
${OBJECTDIR}/_ext/1290873929/uart_driver.o: ../../imageproc-lib/uart_driver.c  nbproject/Makefile-${CND_CONF}.mk
	@${MKDIR} ${OBJECTDIR}/_ext/1290873929 
	@${RM} ${OBJECTDIR}/_ext/1290873929/uart_driver.o.d 
	@${RM} ${OBJECTDIR}/_ext/1290873929/uart_driver.o 
	${MP_CC} $(MP_EXTRA_CC_PRE)  ../../imageproc-lib/uart_driver.c  -o ${OBJECTDIR}/_ext/1290873929/uart_driver.o  -c -mcpu=$(MP_PROCESSOR_OPTION)  -MMD -MF "${OBJECTDIR}/_ext/1290873929/uart_driver.o.d"      -g -D__DEBUG -D__MPLAB_DEBUGGER_ICD3=1    -omf=elf -O0 -I"../lib" -I"../MyConsts" -I"../../imageproc-lib" -I".." -I"." -D__IMAGEPROC25 -DPID_HARDWARE -msmart-io=1 -Wall -msfr-warn=off
	@${FIXDEPS} "${OBJECTDIR}/_ext/1290873929/uart_driver.o.d" $(SILENT)  -rsi ${MP_CC_DIR}../ 
	
${OBJECTDIR}/_ext/1360930230/init.o: ../lib/init.c  nbproject/Makefile-${CND_CONF}.mk
	@${MKDIR} ${OBJECTDIR}/_ext/1360930230 
	@${RM} ${OBJECTDIR}/_ext/1360930230/init.o.d 
	@${RM} ${OBJECTDIR}/_ext/1360930230/init.o 
	${MP_CC} $(MP_EXTRA_CC_PRE)  ../lib/init.c  -o ${OBJECTDIR}/_ext/1360930230/init.o  -c -mcpu=$(MP_PROCESSOR_OPTION)  -MMD -MF "${OBJECTDIR}/_ext/1360930230/init.o.d"      -g -D__DEBUG -D__MPLAB_DEBUGGER_ICD3=1    -omf=elf -O0 -I"../lib" -I"../MyConsts" -I"../../imageproc-lib" -I".." -I"." -D__IMAGEPROC25 -DPID_HARDWARE -msmart-io=1 -Wall -msfr-warn=off
	@${FIXDEPS} "${OBJECTDIR}/_ext/1360930230/init.o.d" $(SILENT)  -rsi ${MP_CC_DIR}../ 
	
${OBJECTDIR}/_ext/1360930230/interrupts.o: ../lib/interrupts.c  nbproject/Makefile-${CND_CONF}.mk
	@${MKDIR} ${OBJECTDIR}/_ext/1360930230 
	@${RM} ${OBJECTDIR}/_ext/1360930230/interrupts.o.d 
	@${RM} ${OBJECTDIR}/_ext/1360930230/interrupts.o 
	${MP_CC} $(MP_EXTRA_CC_PRE)  ../lib/interrupts.c  -o ${OBJECTDIR}/_ext/1360930230/interrupts.o  -c -mcpu=$(MP_PROCESSOR_OPTION)  -MMD -MF "${OBJECTDIR}/_ext/1360930230/interrupts.o.d"      -g -D__DEBUG -D__MPLAB_DEBUGGER_ICD3=1    -omf=elf -O0 -I"../lib" -I"../MyConsts" -I"../../imageproc-lib" -I".." -I"." -D__IMAGEPROC25 -DPID_HARDWARE -msmart-io=1 -Wall -msfr-warn=off
	@${FIXDEPS} "${OBJECTDIR}/_ext/1360930230/interrupts.o.d" $(SILENT)  -rsi ${MP_CC_DIR}../ 
	
${OBJECTDIR}/_ext/1360930230/cmd.o: ../lib/cmd.c  nbproject/Makefile-${CND_CONF}.mk
	@${MKDIR} ${OBJECTDIR}/_ext/1360930230 
	@${RM} ${OBJECTDIR}/_ext/1360930230/cmd.o.d 
	@${RM} ${OBJECTDIR}/_ext/1360930230/cmd.o 
	${MP_CC} $(MP_EXTRA_CC_PRE)  ../lib/cmd.c  -o ${OBJECTDIR}/_ext/1360930230/cmd.o  -c -mcpu=$(MP_PROCESSOR_OPTION)  -MMD -MF "${OBJECTDIR}/_ext/1360930230/cmd.o.d"      -g -D__DEBUG -D__MPLAB_DEBUGGER_ICD3=1    -omf=elf -O0 -I"../lib" -I"../MyConsts" -I"../../imageproc-lib" -I".." -I"." -D__IMAGEPROC25 -DPID_HARDWARE -msmart-io=1 -Wall -msfr-warn=off
	@${FIXDEPS} "${OBJECTDIR}/_ext/1360930230/cmd.o.d" $(SILENT)  -rsi ${MP_CC_DIR}../ 
	
${OBJECTDIR}/_ext/1360930230/move_queue.o: ../lib/move_queue.c  nbproject/Makefile-${CND_CONF}.mk
	@${MKDIR} ${OBJECTDIR}/_ext/1360930230 
	@${RM} ${OBJECTDIR}/_ext/1360930230/move_queue.o.d 
	@${RM} ${OBJECTDIR}/_ext/1360930230/move_queue.o 
	${MP_CC} $(MP_EXTRA_CC_PRE)  ../lib/move_queue.c  -o ${OBJECTDIR}/_ext/1360930230/move_queue.o  -c -mcpu=$(MP_PROCESSOR_OPTION)  -MMD -MF "${OBJECTDIR}/_ext/1360930230/move_queue.o.d"      -g -D__DEBUG -D__MPLAB_DEBUGGER_ICD3=1    -omf=elf -O0 -I"../lib" -I"../MyConsts" -I"../../imageproc-lib" -I".." -I"." -D__IMAGEPROC25 -DPID_HARDWARE -msmart-io=1 -Wall -msfr-warn=off
	@${FIXDEPS} "${OBJECTDIR}/_ext/1360930230/move_queue.o.d" $(SILENT)  -rsi ${MP_CC_DIR}../ 
	
${OBJECTDIR}/_ext/1360930230/steering.o: ../lib/steering.c  nbproject/Makefile-${CND_CONF}.mk
	@${MKDIR} ${OBJECTDIR}/_ext/1360930230 
	@${RM} ${OBJECTDIR}/_ext/1360930230/steering.o.d 
	@${RM} ${OBJECTDIR}/_ext/1360930230/steering.o 
	${MP_CC} $(MP_EXTRA_CC_PRE)  ../lib/steering.c  -o ${OBJECTDIR}/_ext/1360930230/steering.o  -c -mcpu=$(MP_PROCESSOR_OPTION)  -MMD -MF "${OBJECTDIR}/_ext/1360930230/steering.o.d"      -g -D__DEBUG -D__MPLAB_DEBUGGER_ICD3=1    -omf=elf -O0 -I"../lib" -I"../MyConsts" -I"../../imageproc-lib" -I".." -I"." -D__IMAGEPROC25 -DPID_HARDWARE -msmart-io=1 -Wall -msfr-warn=off
	@${FIXDEPS} "${OBJECTDIR}/_ext/1360930230/steering.o.d" $(SILENT)  -rsi ${MP_CC_DIR}../ 
	
${OBJECTDIR}/_ext/1360930230/motor_ctrl.o: ../lib/motor_ctrl.c  nbproject/Makefile-${CND_CONF}.mk
	@${MKDIR} ${OBJECTDIR}/_ext/1360930230 
	@${RM} ${OBJECTDIR}/_ext/1360930230/motor_ctrl.o.d 
	@${RM} ${OBJECTDIR}/_ext/1360930230/motor_ctrl.o 
	${MP_CC} $(MP_EXTRA_CC_PRE)  ../lib/motor_ctrl.c  -o ${OBJECTDIR}/_ext/1360930230/motor_ctrl.o  -c -mcpu=$(MP_PROCESSOR_OPTION)  -MMD -MF "${OBJECTDIR}/_ext/1360930230/motor_ctrl.o.d"      -g -D__DEBUG -D__MPLAB_DEBUGGER_ICD3=1    -omf=elf -O0 -I"../lib" -I"../MyConsts" -I"../../imageproc-lib" -I".." -I"." -D__IMAGEPROC25 -DPID_HARDWARE -msmart-io=1 -Wall -msfr-warn=off
	@${FIXDEPS} "${OBJECTDIR}/_ext/1360930230/motor_ctrl.o.d" $(SILENT)  -rsi ${MP_CC_DIR}../ 
	
${OBJECTDIR}/_ext/1360930230/pid-ip2.5.o: ../lib/pid-ip2.5.c  nbproject/Makefile-${CND_CONF}.mk
	@${MKDIR} ${OBJECTDIR}/_ext/1360930230 
	@${RM} ${OBJECTDIR}/_ext/1360930230/pid-ip2.5.o.d 
	@${RM} ${OBJECTDIR}/_ext/1360930230/pid-ip2.5.o 
	${MP_CC} $(MP_EXTRA_CC_PRE)  ../lib/pid-ip2.5.c  -o ${OBJECTDIR}/_ext/1360930230/pid-ip2.5.o  -c -mcpu=$(MP_PROCESSOR_OPTION)  -MMD -MF "${OBJECTDIR}/_ext/1360930230/pid-ip2.5.o.d"      -g -D__DEBUG -D__MPLAB_DEBUGGER_ICD3=1    -omf=elf -O0 -I"../lib" -I"../MyConsts" -I"../../imageproc-lib" -I".." -I"." -D__IMAGEPROC25 -DPID_HARDWARE -msmart-io=1 -Wall -msfr-warn=off
	@${FIXDEPS} "${OBJECTDIR}/_ext/1360930230/pid-ip2.5.o.d" $(SILENT)  -rsi ${MP_CC_DIR}../ 
	
${OBJECTDIR}/_ext/1360930230/telemetry.o: ../lib/telemetry.c  nbproject/Makefile-${CND_CONF}.mk
	@${MKDIR} ${OBJECTDIR}/_ext/1360930230 
	@${RM} ${OBJECTDIR}/_ext/1360930230/telemetry.o.d 
	@${RM} ${OBJECTDIR}/_ext/1360930230/telemetry.o 
	${MP_CC} $(MP_EXTRA_CC_PRE)  ../lib/telemetry.c  -o ${OBJECTDIR}/_ext/1360930230/telemetry.o  -c -mcpu=$(MP_PROCESSOR_OPTION)  -MMD -MF "${OBJECTDIR}/_ext/1360930230/telemetry.o.d"      -g -D__DEBUG -D__MPLAB_DEBUGGER_ICD3=1    -omf=elf -O0 -I"../lib" -I"../MyConsts" -I"../../imageproc-lib" -I".." -I"." -D__IMAGEPROC25 -DPID_HARDWARE -msmart-io=1 -Wall -msfr-warn=off
	@${FIXDEPS} "${OBJECTDIR}/_ext/1360930230/telemetry.o.d" $(SILENT)  -rsi ${MP_CC_DIR}../ 
	
${OBJECTDIR}/_ext/1360930230/cmd-motor.o: ../lib/cmd-motor.c  nbproject/Makefile-${CND_CONF}.mk
	@${MKDIR} ${OBJECTDIR}/_ext/1360930230 
	@${RM} ${OBJECTDIR}/_ext/1360930230/cmd-motor.o.d 
	@${RM} ${OBJECTDIR}/_ext/1360930230/cmd-motor.o 
	${MP_CC} $(MP_EXTRA_CC_PRE)  ../lib/cmd-motor.c  -o ${OBJECTDIR}/_ext/1360930230/cmd-motor.o  -c -mcpu=$(MP_PROCESSOR_OPTION)  -MMD -MF "${OBJECTDIR}/_ext/1360930230/cmd-motor.o.d"      -g -D__DEBUG -D__MPLAB_DEBUGGER_ICD3=1    -omf=elf -O0 -I"../lib" -I"../MyConsts" -I"../../imageproc-lib" -I".." -I"." -D__IMAGEPROC25 -DPID_HARDWARE -msmart-io=1 -Wall -msfr-warn=off
	@${FIXDEPS} "${OBJECTDIR}/_ext/1360930230/cmd-motor.o.d" $(SILENT)  -rsi ${MP_CC_DIR}../ 
	
${OBJECTDIR}/_ext/1360930230/uart_send.o: ../lib/uart_send.c  nbproject/Makefile-${CND_CONF}.mk
	@${MKDIR} ${OBJECTDIR}/_ext/1360930230 
	@${RM} ${OBJECTDIR}/_ext/1360930230/uart_send.o.d 
	@${RM} ${OBJECTDIR}/_ext/1360930230/uart_send.o 
	${MP_CC} $(MP_EXTRA_CC_PRE)  ../lib/uart_send.c  -o ${OBJECTDIR}/_ext/1360930230/uart_send.o  -c -mcpu=$(MP_PROCESSOR_OPTION)  -MMD -MF "${OBJECTDIR}/_ext/1360930230/uart_send.o.d"      -g -D__DEBUG -D__MPLAB_DEBUGGER_ICD3=1    -omf=elf -O0 -I"../lib" -I"../MyConsts" -I"../../imageproc-lib" -I".." -I"." -D__IMAGEPROC25 -DPID_HARDWARE -msmart-io=1 -Wall -msfr-warn=off
	@${FIXDEPS} "${OBJECTDIR}/_ext/1360930230/uart_send.o.d" $(SILENT)  -rsi ${MP_CC_DIR}../ 
	
${OBJECTDIR}/_ext/1360930230/cmd-aux.o: ../lib/cmd-aux.c  nbproject/Makefile-${CND_CONF}.mk
	@${MKDIR} ${OBJECTDIR}/_ext/1360930230 
	@${RM} ${OBJECTDIR}/_ext/1360930230/cmd-aux.o.d 
	@${RM} ${OBJECTDIR}/_ext/1360930230/cmd-aux.o 
	${MP_CC} $(MP_EXTRA_CC_PRE)  ../lib/cmd-aux.c  -o ${OBJECTDIR}/_ext/1360930230/cmd-aux.o  -c -mcpu=$(MP_PROCESSOR_OPTION)  -MMD -MF "${OBJECTDIR}/_ext/1360930230/cmd-aux.o.d"      -g -D__DEBUG -D__MPLAB_DEBUGGER_ICD3=1    -omf=elf -O0 -I"../lib" -I"../MyConsts" -I"../../imageproc-lib" -I".." -I"." -D__IMAGEPROC25 -DPID_HARDWARE -msmart-io=1 -Wall -msfr-warn=off
	@${FIXDEPS} "${OBJECTDIR}/_ext/1360930230/cmd-aux.o.d" $(SILENT)  -rsi ${MP_CC_DIR}../ 
	
${OBJECTDIR}/_ext/1360930230/tests.o: ../lib/tests.c  nbproject/Makefile-${CND_CONF}.mk
	@${MKDIR} ${OBJECTDIR}/_ext/1360930230 
	@${RM} ${OBJECTDIR}/_ext/1360930230/tests.o.d 
	@${RM} ${OBJECTDIR}/_ext/1360930230/tests.o 
	${MP_CC} $(MP_EXTRA_CC_PRE)  ../lib/tests.c  -o ${OBJECTDIR}/_ext/1360930230/tests.o  -c -mcpu=$(MP_PROCESSOR_OPTION)  -MMD -MF "${OBJECTDIR}/_ext/1360930230/tests.o.d"      -g -D__DEBUG -D__MPLAB_DEBUGGER_ICD3=1    -omf=elf -O0 -I"../lib" -I"../MyConsts" -I"../../imageproc-lib" -I".." -I"." -D__IMAGEPROC25 -DPID_HARDWARE -msmart-io=1 -Wall -msfr-warn=off
	@${FIXDEPS} "${OBJECTDIR}/_ext/1360930230/tests.o.d" $(SILENT)  -rsi ${MP_CC_DIR}../ 
	
${OBJECTDIR}/_ext/1472/main.o: ../main.c  nbproject/Makefile-${CND_CONF}.mk
	@${MKDIR} ${OBJECTDIR}/_ext/1472 
	@${RM} ${OBJECTDIR}/_ext/1472/main.o.d 
	@${RM} ${OBJECTDIR}/_ext/1472/main.o 
	${MP_CC} $(MP_EXTRA_CC_PRE)  ../main.c  -o ${OBJECTDIR}/_ext/1472/main.o  -c -mcpu=$(MP_PROCESSOR_OPTION)  -MMD -MF "${OBJECTDIR}/_ext/1472/main.o.d"      -g -D__DEBUG -D__MPLAB_DEBUGGER_ICD3=1    -omf=elf -O0 -I"./lib" -I"../lib" -I"../MyConsts" -I"../../imageproc-lib" -I".." -I"." -D__IMAGEPROC2 -DPID_HARDWARE -msmart-io=1 -Wall -msfr-warn=off
	@${FIXDEPS} "${OBJECTDIR}/_ext/1472/main.o.d" $(SILENT)  -rsi ${MP_CC_DIR}../ 
	
else
${OBJECTDIR}/_ext/1290873929/dfmem.o: ../../imageproc-lib/dfmem.c  nbproject/Makefile-${CND_CONF}.mk
	@${MKDIR} ${OBJECTDIR}/_ext/1290873929 
	@${RM} ${OBJECTDIR}/_ext/1290873929/dfmem.o.d 
	@${RM} ${OBJECTDIR}/_ext/1290873929/dfmem.o 
	${MP_CC} $(MP_EXTRA_CC_PRE)  ../../imageproc-lib/dfmem.c  -o ${OBJECTDIR}/_ext/1290873929/dfmem.o  -c -mcpu=$(MP_PROCESSOR_OPTION)  -MMD -MF "${OBJECTDIR}/_ext/1290873929/dfmem.o.d"        -g -omf=elf -O0 -I"../lib" -I"../MyConsts" -I"../../imageproc-lib" -I".." -I"." -D__IMAGEPROC25 -DPID_HARDWARE -msmart-io=1 -Wall -msfr-warn=off
	@${FIXDEPS} "${OBJECTDIR}/_ext/1290873929/dfmem.o.d" $(SILENT)  -rsi ${MP_CC_DIR}../ 
	
${OBJECTDIR}/_ext/1290873929/i2c_driver.o: ../../imageproc-lib/i2c_driver.c  nbproject/Makefile-${CND_CONF}.mk
	@${MKDIR} ${OBJECTDIR}/_ext/1290873929 
	@${RM} ${OBJECTDIR}/_ext/1290873929/i2c_driver.o.d 
	@${RM} ${OBJECTDIR}/_ext/1290873929/i2c_driver.o 
	${MP_CC} $(MP_EXTRA_CC_PRE)  ../../imageproc-lib/i2c_driver.c  -o ${OBJECTDIR}/_ext/1290873929/i2c_driver.o  -c -mcpu=$(MP_PROCESSOR_OPTION)  -MMD -MF "${OBJECTDIR}/_ext/1290873929/i2c_driver.o.d"        -g -omf=elf -O0 -I"../lib" -I"../MyConsts" -I"../../imageproc-lib" -I".." -I"." -D__IMAGEPROC25 -DPID_HARDWARE -msmart-io=1 -Wall -msfr-warn=off
	@${FIXDEPS} "${OBJECTDIR}/_ext/1290873929/i2c_driver.o.d" $(SILENT)  -rsi ${MP_CC_DIR}../ 
	
${OBJECTDIR}/_ext/1290873929/init_default.o: ../../imageproc-lib/init_default.c  nbproject/Makefile-${CND_CONF}.mk
	@${MKDIR} ${OBJECTDIR}/_ext/1290873929 
	@${RM} ${OBJECTDIR}/_ext/1290873929/init_default.o.d 
	@${RM} ${OBJECTDIR}/_ext/1290873929/init_default.o 
	${MP_CC} $(MP_EXTRA_CC_PRE)  ../../imageproc-lib/init_default.c  -o ${OBJECTDIR}/_ext/1290873929/init_default.o  -c -mcpu=$(MP_PROCESSOR_OPTION)  -MMD -MF "${OBJECTDIR}/_ext/1290873929/init_default.o.d"        -g -omf=elf -O0 -I"../lib" -I"../MyConsts" -I"../../imageproc-lib" -I".." -I"." -D__IMAGEPROC25 -DPID_HARDWARE -msmart-io=1 -Wall -msfr-warn=off
	@${FIXDEPS} "${OBJECTDIR}/_ext/1290873929/init_default.o.d" $(SILENT)  -rsi ${MP_CC_DIR}../ 
	
${OBJECTDIR}/_ext/1290873929/larray.o: ../../imageproc-lib/larray.c  nbproject/Makefile-${CND_CONF}.mk
	@${MKDIR} ${OBJECTDIR}/_ext/1290873929 
	@${RM} ${OBJECTDIR}/_ext/1290873929/larray.o.d 
	@${RM} ${OBJECTDIR}/_ext/1290873929/larray.o 
	${MP_CC} $(MP_EXTRA_CC_PRE)  ../../imageproc-lib/larray.c  -o ${OBJECTDIR}/_ext/1290873929/larray.o  -c -mcpu=$(MP_PROCESSOR_OPTION)  -MMD -MF "${OBJECTDIR}/_ext/1290873929/larray.o.d"        -g -omf=elf -O0 -I"../lib" -I"../MyConsts" -I"../../imageproc-lib" -I".." -I"." -D__IMAGEPROC25 -DPID_HARDWARE -msmart-io=1 -Wall -msfr-warn=off
	@${FIXDEPS} "${OBJECTDIR}/_ext/1290873929/larray.o.d" $(SILENT)  -rsi ${MP_CC_DIR}../ 
	
${OBJECTDIR}/_ext/1290873929/mpu6000.o: ../../imageproc-lib/mpu6000.c  nbproject/Makefile-${CND_CONF}.mk
	@${MKDIR} ${OBJECTDIR}/_ext/1290873929 
	@${RM} ${OBJECTDIR}/_ext/1290873929/mpu6000.o.d 
	@${RM} ${OBJECTDIR}/_ext/1290873929/mpu6000.o 
	${MP_CC} $(MP_EXTRA_CC_PRE)  ../../imageproc-lib/mpu6000.c  -o ${OBJECTDIR}/_ext/1290873929/mpu6000.o  -c -mcpu=$(MP_PROCESSOR_OPTION)  -MMD -MF "${OBJECTDIR}/_ext/1290873929/mpu6000.o.d"        -g -omf=elf -O0 -I"../lib" -I"../MyConsts" -I"../../imageproc-lib" -I".." -I"." -D__IMAGEPROC25 -DPID_HARDWARE -msmart-io=1 -Wall -msfr-warn=off
	@${FIXDEPS} "${OBJECTDIR}/_ext/1290873929/mpu6000.o.d" $(SILENT)  -rsi ${MP_CC_DIR}../ 
	
${OBJECTDIR}/_ext/1290873929/packet_queue.o: ../../imageproc-lib/packet_queue.c  nbproject/Makefile-${CND_CONF}.mk
	@${MKDIR} ${OBJECTDIR}/_ext/1290873929 
	@${RM} ${OBJECTDIR}/_ext/1290873929/packet_queue.o.d 
	@${RM} ${OBJECTDIR}/_ext/1290873929/packet_queue.o 
	${MP_CC} $(MP_EXTRA_CC_PRE)  ../../imageproc-lib/packet_queue.c  -o ${OBJECTDIR}/_ext/1290873929/packet_queue.o  -c -mcpu=$(MP_PROCESSOR_OPTION)  -MMD -MF "${OBJECTDIR}/_ext/1290873929/packet_queue.o.d"        -g -omf=elf -O0 -I"../lib" -I"../MyConsts" -I"../../imageproc-lib" -I".." -I"." -D__IMAGEPROC25 -DPID_HARDWARE -msmart-io=1 -Wall -msfr-warn=off
	@${FIXDEPS} "${OBJECTDIR}/_ext/1290873929/packet_queue.o.d" $(SILENT)  -rsi ${MP_CC_DIR}../ 
	
${OBJECTDIR}/_ext/1290873929/payload.o: ../../imageproc-lib/payload.c  nbproject/Makefile-${CND_CONF}.mk
	@${MKDIR} ${OBJECTDIR}/_ext/1290873929 
	@${RM} ${OBJECTDIR}/_ext/1290873929/payload.o.d 
	@${RM} ${OBJECTDIR}/_ext/1290873929/payload.o 
	${MP_CC} $(MP_EXTRA_CC_PRE)  ../../imageproc-lib/payload.c  -o ${OBJECTDIR}/_ext/1290873929/payload.o  -c -mcpu=$(MP_PROCESSOR_OPTION)  -MMD -MF "${OBJECTDIR}/_ext/1290873929/payload.o.d"        -g -omf=elf -O0 -I"../lib" -I"../MyConsts" -I"../../imageproc-lib" -I".." -I"." -D__IMAGEPROC25 -DPID_HARDWARE -msmart-io=1 -Wall -msfr-warn=off
	@${FIXDEPS} "${OBJECTDIR}/_ext/1290873929/payload.o.d" $(SILENT)  -rsi ${MP_CC_DIR}../ 
	
${OBJECTDIR}/_ext/1290873929/payload_queue.o: ../../imageproc-lib/payload_queue.c  nbproject/Makefile-${CND_CONF}.mk
	@${MKDIR} ${OBJECTDIR}/_ext/1290873929 
	@${RM} ${OBJECTDIR}/_ext/1290873929/payload_queue.o.d 
	@${RM} ${OBJECTDIR}/_ext/1290873929/payload_queue.o 
	${MP_CC} $(MP_EXTRA_CC_PRE)  ../../imageproc-lib/payload_queue.c  -o ${OBJECTDIR}/_ext/1290873929/payload_queue.o  -c -mcpu=$(MP_PROCESSOR_OPTION)  -MMD -MF "${OBJECTDIR}/_ext/1290873929/payload_queue.o.d"        -g -omf=elf -O0 -I"../lib" -I"../MyConsts" -I"../../imageproc-lib" -I".." -I"." -D__IMAGEPROC25 -DPID_HARDWARE -msmart-io=1 -Wall -msfr-warn=off
	@${FIXDEPS} "${OBJECTDIR}/_ext/1290873929/payload_queue.o.d" $(SILENT)  -rsi ${MP_CC_DIR}../ 
	
${OBJECTDIR}/_ext/1290873929/queue.o: ../../imageproc-lib/queue.c  nbproject/Makefile-${CND_CONF}.mk
	@${MKDIR} ${OBJECTDIR}/_ext/1290873929 
	@${RM} ${OBJECTDIR}/_ext/1290873929/queue.o.d 
	@${RM} ${OBJECTDIR}/_ext/1290873929/queue.o 
	${MP_CC} $(MP_EXTRA_CC_PRE)  ../../imageproc-lib/queue.c  -o ${OBJECTDIR}/_ext/1290873929/queue.o  -c -mcpu=$(MP_PROCESSOR_OPTION)  -MMD -MF "${OBJECTDIR}/_ext/1290873929/queue.o.d"        -g -omf=elf -O0 -I"../lib" -I"../MyConsts" -I"../../imageproc-lib" -I".." -I"." -D__IMAGEPROC25 -DPID_HARDWARE -msmart-io=1 -Wall -msfr-warn=off
	@${FIXDEPS} "${OBJECTDIR}/_ext/1290873929/queue.o.d" $(SILENT)  -rsi ${MP_CC_DIR}../ 
	
${OBJECTDIR}/_ext/1290873929/radio.o: ../../imageproc-lib/radio.c  nbproject/Makefile-${CND_CONF}.mk
	@${MKDIR} ${OBJECTDIR}/_ext/1290873929 
	@${RM} ${OBJECTDIR}/_ext/1290873929/radio.o.d 
	@${RM} ${OBJECTDIR}/_ext/1290873929/radio.o 
	${MP_CC} $(MP_EXTRA_CC_PRE)  ../../imageproc-lib/radio.c  -o ${OBJECTDIR}/_ext/1290873929/radio.o  -c -mcpu=$(MP_PROCESSOR_OPTION)  -MMD -MF "${OBJECTDIR}/_ext/1290873929/radio.o.d"        -g -omf=elf -O0 -I"../lib" -I"../MyConsts" -I"../../imageproc-lib" -I".." -I"." -D__IMAGEPROC25 -DPID_HARDWARE -msmart-io=1 -Wall -msfr-warn=off
	@${FIXDEPS} "${OBJECTDIR}/_ext/1290873929/radio.o.d" $(SILENT)  -rsi ${MP_CC_DIR}../ 
	
${OBJECTDIR}/_ext/1290873929/spi_controller.o: ../../imageproc-lib/spi_controller.c  nbproject/Makefile-${CND_CONF}.mk
	@${MKDIR} ${OBJECTDIR}/_ext/1290873929 
	@${RM} ${OBJECTDIR}/_ext/1290873929/spi_controller.o.d 
	@${RM} ${OBJECTDIR}/_ext/1290873929/spi_controller.o 
	${MP_CC} $(MP_EXTRA_CC_PRE)  ../../imageproc-lib/spi_controller.c  -o ${OBJECTDIR}/_ext/1290873929/spi_controller.o  -c -mcpu=$(MP_PROCESSOR_OPTION)  -MMD -MF "${OBJECTDIR}/_ext/1290873929/spi_controller.o.d"        -g -omf=elf -O0 -I"../lib" -I"../MyConsts" -I"../../imageproc-lib" -I".." -I"." -D__IMAGEPROC25 -DPID_HARDWARE -msmart-io=1 -Wall -msfr-warn=off
	@${FIXDEPS} "${OBJECTDIR}/_ext/1290873929/spi_controller.o.d" $(SILENT)  -rsi ${MP_CC_DIR}../ 
	
${OBJECTDIR}/_ext/1290873929/stopwatch.o: ../../imageproc-lib/stopwatch.c  nbproject/Makefile-${CND_CONF}.mk
	@${MKDIR} ${OBJECTDIR}/_ext/1290873929 
	@${RM} ${OBJECTDIR}/_ext/1290873929/stopwatch.o.d 
	@${RM} ${OBJECTDIR}/_ext/1290873929/stopwatch.o 
	${MP_CC} $(MP_EXTRA_CC_PRE)  ../../imageproc-lib/stopwatch.c  -o ${OBJECTDIR}/_ext/1290873929/stopwatch.o  -c -mcpu=$(MP_PROCESSOR_OPTION)  -MMD -MF "${OBJECTDIR}/_ext/1290873929/stopwatch.o.d"        -g -omf=elf -O0 -I"../lib" -I"../MyConsts" -I"../../imageproc-lib" -I".." -I"." -D__IMAGEPROC25 -DPID_HARDWARE -msmart-io=1 -Wall -msfr-warn=off
	@${FIXDEPS} "${OBJECTDIR}/_ext/1290873929/stopwatch.o.d" $(SILENT)  -rsi ${MP_CC_DIR}../ 
	
${OBJECTDIR}/_ext/1290873929/tih.o: ../../imageproc-lib/tih.c  nbproject/Makefile-${CND_CONF}.mk
	@${MKDIR} ${OBJECTDIR}/_ext/1290873929 
	@${RM} ${OBJECTDIR}/_ext/1290873929/tih.o.d 
	@${RM} ${OBJECTDIR}/_ext/1290873929/tih.o 
	${MP_CC} $(MP_EXTRA_CC_PRE)  ../../imageproc-lib/tih.c  -o ${OBJECTDIR}/_ext/1290873929/tih.o  -c -mcpu=$(MP_PROCESSOR_OPTION)  -MMD -MF "${OBJECTDIR}/_ext/1290873929/tih.o.d"        -g -omf=elf -O0 -I"../lib" -I"../MyConsts" -I"../../imageproc-lib" -I".." -I"." -D__IMAGEPROC25 -DPID_HARDWARE -msmart-io=1 -Wall -msfr-warn=off
	@${FIXDEPS} "${OBJECTDIR}/_ext/1290873929/tih.o.d" $(SILENT)  -rsi ${MP_CC_DIR}../ 
	
${OBJECTDIR}/_ext/1290873929/version.o: ../../imageproc-lib/version.c  nbproject/Makefile-${CND_CONF}.mk
	@${MKDIR} ${OBJECTDIR}/_ext/1290873929 
	@${RM} ${OBJECTDIR}/_ext/1290873929/version.o.d 
	@${RM} ${OBJECTDIR}/_ext/1290873929/version.o 
	${MP_CC} $(MP_EXTRA_CC_PRE)  ../../imageproc-lib/version.c  -o ${OBJECTDIR}/_ext/1290873929/version.o  -c -mcpu=$(MP_PROCESSOR_OPTION)  -MMD -MF "${OBJECTDIR}/_ext/1290873929/version.o.d"        -g -omf=elf -O0 -I"../lib" -I"../MyConsts" -I"../../imageproc-lib" -I".." -I"." -D__IMAGEPROC25 -DPID_HARDWARE -msmart-io=1 -Wall -msfr-warn=off
	@${FIXDEPS} "${OBJECTDIR}/_ext/1290873929/version.o.d" $(SILENT)  -rsi ${MP_CC_DIR}../ 
	
${OBJECTDIR}/_ext/1290873929/adc_pid.o: ../../imageproc-lib/adc_pid.c  nbproject/Makefile-${CND_CONF}.mk
	@${MKDIR} ${OBJECTDIR}/_ext/1290873929 
	@${RM} ${OBJECTDIR}/_ext/1290873929/adc_pid.o.d 
	@${RM} ${OBJECTDIR}/_ext/1290873929/adc_pid.o 
	${MP_CC} $(MP_EXTRA_CC_PRE)  ../../imageproc-lib/adc_pid.c  -o ${OBJECTDIR}/_ext/1290873929/adc_pid.o  -c -mcpu=$(MP_PROCESSOR_OPTION)  -MMD -MF "${OBJECTDIR}/_ext/1290873929/adc_pid.o.d"        -g -omf=elf -O0 -I"../lib" -I"../MyConsts" -I"../../imageproc-lib" -I".." -I"." -D__IMAGEPROC25 -DPID_HARDWARE -msmart-io=1 -Wall -msfr-warn=off
	@${FIXDEPS} "${OBJECTDIR}/_ext/1290873929/adc_pid.o.d" $(SILENT)  -rsi ${MP_CC_DIR}../ 
	
${OBJECTDIR}/_ext/1290873929/ams-enc.o: ../../imageproc-lib/ams-enc.c  nbproject/Makefile-${CND_CONF}.mk
	@${MKDIR} ${OBJECTDIR}/_ext/1290873929 
	@${RM} ${OBJECTDIR}/_ext/1290873929/ams-enc.o.d 
	@${RM} ${OBJECTDIR}/_ext/1290873929/ams-enc.o 
	${MP_CC} $(MP_EXTRA_CC_PRE)  ../../imageproc-lib/ams-enc.c  -o ${OBJECTDIR}/_ext/1290873929/ams-enc.o  -c -mcpu=$(MP_PROCESSOR_OPTION)  -MMD -MF "${OBJECTDIR}/_ext/1290873929/ams-enc.o.d"        -g -omf=elf -O0 -I"../lib" -I"../MyConsts" -I"../../imageproc-lib" -I".." -I"." -D__IMAGEPROC25 -DPID_HARDWARE -msmart-io=1 -Wall -msfr-warn=off
	@${FIXDEPS} "${OBJECTDIR}/_ext/1290873929/ams-enc.o.d" $(SILENT)  -rsi ${MP_CC_DIR}../ 
	
${OBJECTDIR}/_ext/1290873929/battery.o: ../../imageproc-lib/battery.c  nbproject/Makefile-${CND_CONF}.mk
	@${MKDIR} ${OBJECTDIR}/_ext/1290873929 
	@${RM} ${OBJECTDIR}/_ext/1290873929/battery.o.d 
	@${RM} ${OBJECTDIR}/_ext/1290873929/battery.o 
	${MP_CC} $(MP_EXTRA_CC_PRE)  ../../imageproc-lib/battery.c  -o ${OBJECTDIR}/_ext/1290873929/battery.o  -c -mcpu=$(MP_PROCESSOR_OPTION)  -MMD -MF "${OBJECTDIR}/_ext/1290873929/battery.o.d"        -g -omf=elf -O0 -I"../lib" -I"../MyConsts" -I"../../imageproc-lib" -I".." -I"." -D__IMAGEPROC25 -DPID_HARDWARE -msmart-io=1 -Wall -msfr-warn=off
	@${FIXDEPS} "${OBJECTDIR}/_ext/1290873929/battery.o.d" $(SILENT)  -rsi ${MP_CC_DIR}../ 
	
${OBJECTDIR}/_ext/1290873929/blink.o: ../../imageproc-lib/blink.c  nbproject/Makefile-${CND_CONF}.mk
	@${MKDIR} ${OBJECTDIR}/_ext/1290873929 
	@${RM} ${OBJECTDIR}/_ext/1290873929/blink.o.d 
	@${RM} ${OBJECTDIR}/_ext/1290873929/blink.o 
	${MP_CC} $(MP_EXTRA_CC_PRE)  ../../imageproc-lib/blink.c  -o ${OBJECTDIR}/_ext/1290873929/blink.o  -c -mcpu=$(MP_PROCESSOR_OPTION)  -MMD -MF "${OBJECTDIR}/_ext/1290873929/blink.o.d"        -g -omf=elf -O0 -I"../lib" -I"../MyConsts" -I"../../imageproc-lib" -I".." -I"." -D__IMAGEPROC25 -DPID_HARDWARE -msmart-io=1 -Wall -msfr-warn=off
	@${FIXDEPS} "${OBJECTDIR}/_ext/1290873929/blink.o.d" $(SILENT)  -rsi ${MP_CC_DIR}../ 
	
${OBJECTDIR}/_ext/1290873929/carray.o: ../../imageproc-lib/carray.c  nbproject/Makefile-${CND_CONF}.mk
	@${MKDIR} ${OBJECTDIR}/_ext/1290873929 
	@${RM} ${OBJECTDIR}/_ext/1290873929/carray.o.d 
	@${RM} ${OBJECTDIR}/_ext/1290873929/carray.o 
	${MP_CC} $(MP_EXTRA_CC_PRE)  ../../imageproc-lib/carray.c  -o ${OBJECTDIR}/_ext/1290873929/carray.o  -c -mcpu=$(MP_PROCESSOR_OPTION)  -MMD -MF "${OBJECTDIR}/_ext/1290873929/carray.o.d"        -g -omf=elf -O0 -I"../lib" -I"../MyConsts" -I"../../imageproc-lib" -I".." -I"." -D__IMAGEPROC25 -DPID_HARDWARE -msmart-io=1 -Wall -msfr-warn=off
	@${FIXDEPS} "${OBJECTDIR}/_ext/1290873929/carray.o.d" $(SILENT)  -rsi ${MP_CC_DIR}../ 
	
${OBJECTDIR}/_ext/1290873929/sclock.o: ../../imageproc-lib/sclock.c  nbproject/Makefile-${CND_CONF}.mk
	@${MKDIR} ${OBJECTDIR}/_ext/1290873929 
	@${RM} ${OBJECTDIR}/_ext/1290873929/sclock.o.d 
	@${RM} ${OBJECTDIR}/_ext/1290873929/sclock.o 
	${MP_CC} $(MP_EXTRA_CC_PRE)  ../../imageproc-lib/sclock.c  -o ${OBJECTDIR}/_ext/1290873929/sclock.o  -c -mcpu=$(MP_PROCESSOR_OPTION)  -MMD -MF "${OBJECTDIR}/_ext/1290873929/sclock.o.d"        -g -omf=elf -O0 -I"../lib" -I"../MyConsts" -I"../../imageproc-lib" -I".." -I"." -D__IMAGEPROC25 -DPID_HARDWARE -msmart-io=1 -Wall -msfr-warn=off
	@${FIXDEPS} "${OBJECTDIR}/_ext/1290873929/sclock.o.d" $(SILENT)  -rsi ${MP_CC_DIR}../ 
	
${OBJECTDIR}/_ext/1290873929/at86rf231_driver.o: ../../imageproc-lib/at86rf231_driver.c  nbproject/Makefile-${CND_CONF}.mk
	@${MKDIR} ${OBJECTDIR}/_ext/1290873929 
	@${RM} ${OBJECTDIR}/_ext/1290873929/at86rf231_driver.o.d 
	@${RM} ${OBJECTDIR}/_ext/1290873929/at86rf231_driver.o 
	${MP_CC} $(MP_EXTRA_CC_PRE)  ../../imageproc-lib/at86rf231_driver.c  -o ${OBJECTDIR}/_ext/1290873929/at86rf231_driver.o  -c -mcpu=$(MP_PROCESSOR_OPTION)  -MMD -MF "${OBJECTDIR}/_ext/1290873929/at86rf231_driver.o.d"        -g -omf=elf -O0 -I"../lib" -I"../MyConsts" -I"../../imageproc-lib" -I".." -I"." -D__IMAGEPROC25 -DPID_HARDWARE -msmart-io=1 -Wall -msfr-warn=off
	@${FIXDEPS} "${OBJECTDIR}/_ext/1290873929/at86rf231_driver.o.d" $(SILENT)  -rsi ${MP_CC_DIR}../ 
	
${OBJECTDIR}/_ext/1290873929/mac_packet.o: ../../imageproc-lib/mac_packet.c  nbproject/Makefile-${CND_CONF}.mk
	@${MKDIR} ${OBJECTDIR}/_ext/1290873929 
	@${RM} ${OBJECTDIR}/_ext/1290873929/mac_packet.o.d 
	@${RM} ${OBJECTDIR}/_ext/1290873929/mac_packet.o 
	${MP_CC} $(MP_EXTRA_CC_PRE)  ../../imageproc-lib/mac_packet.c  -o ${OBJECTDIR}/_ext/1290873929/mac_packet.o  -c -mcpu=$(MP_PROCESSOR_OPTION)  -MMD -MF "${OBJECTDIR}/_ext/1290873929/mac_packet.o.d"        -g -omf=elf -O0 -I"../lib" -I"../MyConsts" -I"../../imageproc-lib" -I".." -I"." -D__IMAGEPROC25 -DPID_HARDWARE -msmart-io=1 -Wall -msfr-warn=off
	@${FIXDEPS} "${OBJECTDIR}/_ext/1290873929/mac_packet.o.d" $(SILENT)  -rsi ${MP_CC_DIR}../ 
	
${OBJECTDIR}/_ext/1290873929/ppool.o: ../../imageproc-lib/ppool.c  nbproject/Makefile-${CND_CONF}.mk
	@${MKDIR} ${OBJECTDIR}/_ext/1290873929 
	@${RM} ${OBJECTDIR}/_ext/1290873929/ppool.o.d 
	@${RM} ${OBJECTDIR}/_ext/1290873929/ppool.o 
	${MP_CC} $(MP_EXTRA_CC_PRE)  ../../imageproc-lib/ppool.c  -o ${OBJECTDIR}/_ext/1290873929/ppool.o  -c -mcpu=$(MP_PROCESSOR_OPTION)  -MMD -MF "${OBJECTDIR}/_ext/1290873929/ppool.o.d"        -g -omf=elf -O0 -I"../lib" -I"../MyConsts" -I"../../imageproc-lib" -I".." -I"." -D__IMAGEPROC25 -DPID_HARDWARE -msmart-io=1 -Wall -msfr-warn=off
	@${FIXDEPS} "${OBJECTDIR}/_ext/1290873929/ppool.o.d" $(SILENT)  -rsi ${MP_CC_DIR}../ 
	
${OBJECTDIR}/_ext/1290873929/uart_driver.o: ../../imageproc-lib/uart_driver.c  nbproject/Makefile-${CND_CONF}.mk
	@${MKDIR} ${OBJECTDIR}/_ext/1290873929 
	@${RM} ${OBJECTDIR}/_ext/1290873929/uart_driver.o.d 
	@${RM} ${OBJECTDIR}/_ext/1290873929/uart_driver.o 
	${MP_CC} $(MP_EXTRA_CC_PRE)  ../../imageproc-lib/uart_driver.c  -o ${OBJECTDIR}/_ext/1290873929/uart_driver.o  -c -mcpu=$(MP_PROCESSOR_OPTION)  -MMD -MF "${OBJECTDIR}/_ext/1290873929/uart_driver.o.d"        -g -omf=elf -O0 -I"../lib" -I"../MyConsts" -I"../../imageproc-lib" -I".." -I"." -D__IMAGEPROC25 -DPID_HARDWARE -msmart-io=1 -Wall -msfr-warn=off
	@${FIXDEPS} "${OBJECTDIR}/_ext/1290873929/uart_driver.o.d" $(SILENT)  -rsi ${MP_CC_DIR}../ 
	
${OBJECTDIR}/_ext/1360930230/init.o: ../lib/init.c  nbproject/Makefile-${CND_CONF}.mk
	@${MKDIR} ${OBJECTDIR}/_ext/1360930230 
	@${RM} ${OBJECTDIR}/_ext/1360930230/init.o.d 
	@${RM} ${OBJECTDIR}/_ext/1360930230/init.o 
	${MP_CC} $(MP_EXTRA_CC_PRE)  ../lib/init.c  -o ${OBJECTDIR}/_ext/1360930230/init.o  -c -mcpu=$(MP_PROCESSOR_OPTION)  -MMD -MF "${OBJECTDIR}/_ext/1360930230/init.o.d"        -g -omf=elf -O0 -I"../lib" -I"../MyConsts" -I"../../imageproc-lib" -I".." -I"." -D__IMAGEPROC25 -DPID_HARDWARE -msmart-io=1 -Wall -msfr-warn=off
	@${FIXDEPS} "${OBJECTDIR}/_ext/1360930230/init.o.d" $(SILENT)  -rsi ${MP_CC_DIR}../ 
	
${OBJECTDIR}/_ext/1360930230/interrupts.o: ../lib/interrupts.c  nbproject/Makefile-${CND_CONF}.mk
	@${MKDIR} ${OBJECTDIR}/_ext/1360930230 
	@${RM} ${OBJECTDIR}/_ext/1360930230/interrupts.o.d 
	@${RM} ${OBJECTDIR}/_ext/1360930230/interrupts.o 
	${MP_CC} $(MP_EXTRA_CC_PRE)  ../lib/interrupts.c  -o ${OBJECTDIR}/_ext/1360930230/interrupts.o  -c -mcpu=$(MP_PROCESSOR_OPTION)  -MMD -MF "${OBJECTDIR}/_ext/1360930230/interrupts.o.d"        -g -omf=elf -O0 -I"../lib" -I"../MyConsts" -I"../../imageproc-lib" -I".." -I"." -D__IMAGEPROC25 -DPID_HARDWARE -msmart-io=1 -Wall -msfr-warn=off
	@${FIXDEPS} "${OBJECTDIR}/_ext/1360930230/interrupts.o.d" $(SILENT)  -rsi ${MP_CC_DIR}../ 
	
${OBJECTDIR}/_ext/1360930230/cmd.o: ../lib/cmd.c  nbproject/Makefile-${CND_CONF}.mk
	@${MKDIR} ${OBJECTDIR}/_ext/1360930230 
	@${RM} ${OBJECTDIR}/_ext/1360930230/cmd.o.d 
	@${RM} ${OBJECTDIR}/_ext/1360930230/cmd.o 
	${MP_CC} $(MP_EXTRA_CC_PRE)  ../lib/cmd.c  -o ${OBJECTDIR}/_ext/1360930230/cmd.o  -c -mcpu=$(MP_PROCESSOR_OPTION)  -MMD -MF "${OBJECTDIR}/_ext/1360930230/cmd.o.d"        -g -omf=elf -O0 -I"../lib" -I"../MyConsts" -I"../../imageproc-lib" -I".." -I"." -D__IMAGEPROC25 -DPID_HARDWARE -msmart-io=1 -Wall -msfr-warn=off
	@${FIXDEPS} "${OBJECTDIR}/_ext/1360930230/cmd.o.d" $(SILENT)  -rsi ${MP_CC_DIR}../ 
	
${OBJECTDIR}/_ext/1360930230/move_queue.o: ../lib/move_queue.c  nbproject/Makefile-${CND_CONF}.mk
	@${MKDIR} ${OBJECTDIR}/_ext/1360930230 
	@${RM} ${OBJECTDIR}/_ext/1360930230/move_queue.o.d 
	@${RM} ${OBJECTDIR}/_ext/1360930230/move_queue.o 
	${MP_CC} $(MP_EXTRA_CC_PRE)  ../lib/move_queue.c  -o ${OBJECTDIR}/_ext/1360930230/move_queue.o  -c -mcpu=$(MP_PROCESSOR_OPTION)  -MMD -MF "${OBJECTDIR}/_ext/1360930230/move_queue.o.d"        -g -omf=elf -O0 -I"../lib" -I"../MyConsts" -I"../../imageproc-lib" -I".." -I"." -D__IMAGEPROC25 -DPID_HARDWARE -msmart-io=1 -Wall -msfr-warn=off
	@${FIXDEPS} "${OBJECTDIR}/_ext/1360930230/move_queue.o.d" $(SILENT)  -rsi ${MP_CC_DIR}../ 
	
${OBJECTDIR}/_ext/1360930230/steering.o: ../lib/steering.c  nbproject/Makefile-${CND_CONF}.mk
	@${MKDIR} ${OBJECTDIR}/_ext/1360930230 
	@${RM} ${OBJECTDIR}/_ext/1360930230/steering.o.d 
	@${RM} ${OBJECTDIR}/_ext/1360930230/steering.o 
	${MP_CC} $(MP_EXTRA_CC_PRE)  ../lib/steering.c  -o ${OBJECTDIR}/_ext/1360930230/steering.o  -c -mcpu=$(MP_PROCESSOR_OPTION)  -MMD -MF "${OBJECTDIR}/_ext/1360930230/steering.o.d"        -g -omf=elf -O0 -I"../lib" -I"../MyConsts" -I"../../imageproc-lib" -I".." -I"." -D__IMAGEPROC25 -DPID_HARDWARE -msmart-io=1 -Wall -msfr-warn=off
	@${FIXDEPS} "${OBJECTDIR}/_ext/1360930230/steering.o.d" $(SILENT)  -rsi ${MP_CC_DIR}../ 
	
${OBJECTDIR}/_ext/1360930230/motor_ctrl.o: ../lib/motor_ctrl.c  nbproject/Makefile-${CND_CONF}.mk
	@${MKDIR} ${OBJECTDIR}/_ext/1360930230 
	@${RM} ${OBJECTDIR}/_ext/1360930230/motor_ctrl.o.d 
	@${RM} ${OBJECTDIR}/_ext/1360930230/motor_ctrl.o 
	${MP_CC} $(MP_EXTRA_CC_PRE)  ../lib/motor_ctrl.c  -o ${OBJECTDIR}/_ext/1360930230/motor_ctrl.o  -c -mcpu=$(MP_PROCESSOR_OPTION)  -MMD -MF "${OBJECTDIR}/_ext/1360930230/motor_ctrl.o.d"        -g -omf=elf -O0 -I"../lib" -I"../MyConsts" -I"../../imageproc-lib" -I".." -I"." -D__IMAGEPROC25 -DPID_HARDWARE -msmart-io=1 -Wall -msfr-warn=off
	@${FIXDEPS} "${OBJECTDIR}/_ext/1360930230/motor_ctrl.o.d" $(SILENT)  -rsi ${MP_CC_DIR}../ 
	
${OBJECTDIR}/_ext/1360930230/pid-ip2.5.o: ../lib/pid-ip2.5.c  nbproject/Makefile-${CND_CONF}.mk
	@${MKDIR} ${OBJECTDIR}/_ext/1360930230 
	@${RM} ${OBJECTDIR}/_ext/1360930230/pid-ip2.5.o.d 
	@${RM} ${OBJECTDIR}/_ext/1360930230/pid-ip2.5.o 
	${MP_CC} $(MP_EXTRA_CC_PRE)  ../lib/pid-ip2.5.c  -o ${OBJECTDIR}/_ext/1360930230/pid-ip2.5.o  -c -mcpu=$(MP_PROCESSOR_OPTION)  -MMD -MF "${OBJECTDIR}/_ext/1360930230/pid-ip2.5.o.d"        -g -omf=elf -O0 -I"../lib" -I"../MyConsts" -I"../../imageproc-lib" -I".." -I"." -D__IMAGEPROC25 -DPID_HARDWARE -msmart-io=1 -Wall -msfr-warn=off
	@${FIXDEPS} "${OBJECTDIR}/_ext/1360930230/pid-ip2.5.o.d" $(SILENT)  -rsi ${MP_CC_DIR}../ 
	
${OBJECTDIR}/_ext/1360930230/telemetry.o: ../lib/telemetry.c  nbproject/Makefile-${CND_CONF}.mk
	@${MKDIR} ${OBJECTDIR}/_ext/1360930230 
	@${RM} ${OBJECTDIR}/_ext/1360930230/telemetry.o.d 
	@${RM} ${OBJECTDIR}/_ext/1360930230/telemetry.o 
	${MP_CC} $(MP_EXTRA_CC_PRE)  ../lib/telemetry.c  -o ${OBJECTDIR}/_ext/1360930230/telemetry.o  -c -mcpu=$(MP_PROCESSOR_OPTION)  -MMD -MF "${OBJECTDIR}/_ext/1360930230/telemetry.o.d"        -g -omf=elf -O0 -I"../lib" -I"../MyConsts" -I"../../imageproc-lib" -I".." -I"." -D__IMAGEPROC25 -DPID_HARDWARE -msmart-io=1 -Wall -msfr-warn=off
	@${FIXDEPS} "${OBJECTDIR}/_ext/1360930230/telemetry.o.d" $(SILENT)  -rsi ${MP_CC_DIR}../ 
	
${OBJECTDIR}/_ext/1360930230/cmd-motor.o: ../lib/cmd-motor.c  nbproject/Makefile-${CND_CONF}.mk
	@${MKDIR} ${OBJECTDIR}/_ext/1360930230 
	@${RM} ${OBJECTDIR}/_ext/1360930230/cmd-motor.o.d 
	@${RM} ${OBJECTDIR}/_ext/1360930230/cmd-motor.o 
	${MP_CC} $(MP_EXTRA_CC_PRE)  ../lib/cmd-motor.c  -o ${OBJECTDIR}/_ext/1360930230/cmd-motor.o  -c -mcpu=$(MP_PROCESSOR_OPTION)  -MMD -MF "${OBJECTDIR}/_ext/1360930230/cmd-motor.o.d"        -g -omf=elf -O0 -I"../lib" -I"../MyConsts" -I"../../imageproc-lib" -I".." -I"." -D__IMAGEPROC25 -DPID_HARDWARE -msmart-io=1 -Wall -msfr-warn=off
	@${FIXDEPS} "${OBJECTDIR}/_ext/1360930230/cmd-motor.o.d" $(SILENT)  -rsi ${MP_CC_DIR}../ 
	
${OBJECTDIR}/_ext/1360930230/uart_send.o: ../lib/uart_send.c  nbproject/Makefile-${CND_CONF}.mk
	@${MKDIR} ${OBJECTDIR}/_ext/1360930230 
	@${RM} ${OBJECTDIR}/_ext/1360930230/uart_send.o.d 
	@${RM} ${OBJECTDIR}/_ext/1360930230/uart_send.o 
	${MP_CC} $(MP_EXTRA_CC_PRE)  ../lib/uart_send.c  -o ${OBJECTDIR}/_ext/1360930230/uart_send.o  -c -mcpu=$(MP_PROCESSOR_OPTION)  -MMD -MF "${OBJECTDIR}/_ext/1360930230/uart_send.o.d"        -g -omf=elf -O0 -I"../lib" -I"../MyConsts" -I"../../imageproc-lib" -I".." -I"." -D__IMAGEPROC25 -DPID_HARDWARE -msmart-io=1 -Wall -msfr-warn=off
	@${FIXDEPS} "${OBJECTDIR}/_ext/1360930230/uart_send.o.d" $(SILENT)  -rsi ${MP_CC_DIR}../ 
	
${OBJECTDIR}/_ext/1360930230/cmd-aux.o: ../lib/cmd-aux.c  nbproject/Makefile-${CND_CONF}.mk
	@${MKDIR} ${OBJECTDIR}/_ext/1360930230 
	@${RM} ${OBJECTDIR}/_ext/1360930230/cmd-aux.o.d 
	@${RM} ${OBJECTDIR}/_ext/1360930230/cmd-aux.o 
	${MP_CC} $(MP_EXTRA_CC_PRE)  ../lib/cmd-aux.c  -o ${OBJECTDIR}/_ext/1360930230/cmd-aux.o  -c -mcpu=$(MP_PROCESSOR_OPTION)  -MMD -MF "${OBJECTDIR}/_ext/1360930230/cmd-aux.o.d"        -g -omf=elf -O0 -I"../lib" -I"../MyConsts" -I"../../imageproc-lib" -I".." -I"." -D__IMAGEPROC25 -DPID_HARDWARE -msmart-io=1 -Wall -msfr-warn=off
	@${FIXDEPS} "${OBJECTDIR}/_ext/1360930230/cmd-aux.o.d" $(SILENT)  -rsi ${MP_CC_DIR}../ 
	
${OBJECTDIR}/_ext/1360930230/tests.o: ../lib/tests.c  nbproject/Makefile-${CND_CONF}.mk
	@${MKDIR} ${OBJECTDIR}/_ext/1360930230 
	@${RM} ${OBJECTDIR}/_ext/1360930230/tests.o.d 
	@${RM} ${OBJECTDIR}/_ext/1360930230/tests.o 
	${MP_CC} $(MP_EXTRA_CC_PRE)  ../lib/tests.c  -o ${OBJECTDIR}/_ext/1360930230/tests.o  -c -mcpu=$(MP_PROCESSOR_OPTION)  -MMD -MF "${OBJECTDIR}/_ext/1360930230/tests.o.d"        -g -omf=elf -O0 -I"../lib" -I"../MyConsts" -I"../../imageproc-lib" -I".." -I"." -D__IMAGEPROC25 -DPID_HARDWARE -msmart-io=1 -Wall -msfr-warn=off
	@${FIXDEPS} "${OBJECTDIR}/_ext/1360930230/tests.o.d" $(SILENT)  -rsi ${MP_CC_DIR}../ 
	
${OBJECTDIR}/_ext/1472/main.o: ../main.c  nbproject/Makefile-${CND_CONF}.mk
	@${MKDIR} ${OBJECTDIR}/_ext/1472 
	@${RM} ${OBJECTDIR}/_ext/1472/main.o.d 
	@${RM} ${OBJECTDIR}/_ext/1472/main.o 
	${MP_CC} $(MP_EXTRA_CC_PRE)  ../main.c  -o ${OBJECTDIR}/_ext/1472/main.o  -c -mcpu=$(MP_PROCESSOR_OPTION)  -MMD -MF "${OBJECTDIR}/_ext/1472/main.o.d"        -g -omf=elf -O0 -I"./lib" -I"../lib" -I"../MyConsts" -I"../../imageproc-lib" -I".." -I"." -D__IMAGEPROC2 -DPID_HARDWARE -msmart-io=1 -Wall -msfr-warn=off
	@${FIXDEPS} "${OBJECTDIR}/_ext/1472/main.o.d" $(SILENT)  -rsi ${MP_CC_DIR}../ 
	
endif

# ------------------------------------------------------------------------------------
# Rules for buildStep: assemble
ifeq ($(TYPE_IMAGE), DEBUG_RUN)
${OBJECTDIR}/_ext/1290873929/delay.o: ../../imageproc-lib/delay.s  nbproject/Makefile-${CND_CONF}.mk
	@${MKDIR} ${OBJECTDIR}/_ext/1290873929 
	@${RM} ${OBJECTDIR}/_ext/1290873929/delay.o.d 
	@${RM} ${OBJECTDIR}/_ext/1290873929/delay.o 
	${MP_CC} $(MP_EXTRA_AS_PRE)  ../../imageproc-lib/delay.s  -o ${OBJECTDIR}/_ext/1290873929/delay.o  -c -mcpu=$(MP_PROCESSOR_OPTION)  -D__DEBUG -D__MPLAB_DEBUGGER_ICD3=1  -omf=elf -I".." -I"." -Wa,-MD,"${OBJECTDIR}/_ext/1290873929/delay.o.d",--defsym=__MPLAB_BUILD=1,--defsym=__ICD2RAM=1,--defsym=__MPLAB_DEBUG=1,--defsym=__DEBUG=1,--defsym=__MPLAB_DEBUGGER_ICD3=1,-g,--no-relax,-g$(MP_EXTRA_AS_POST)
	@${FIXDEPS} "${OBJECTDIR}/_ext/1290873929/delay.o.d"  $(SILENT)  -rsi ${MP_CC_DIR}../  
	
else
${OBJECTDIR}/_ext/1290873929/delay.o: ../../imageproc-lib/delay.s  nbproject/Makefile-${CND_CONF}.mk
	@${MKDIR} ${OBJECTDIR}/_ext/1290873929 
	@${RM} ${OBJECTDIR}/_ext/1290873929/delay.o.d 
	@${RM} ${OBJECTDIR}/_ext/1290873929/delay.o 
	${MP_CC} $(MP_EXTRA_AS_PRE)  ../../imageproc-lib/delay.s  -o ${OBJECTDIR}/_ext/1290873929/delay.o  -c -mcpu=$(MP_PROCESSOR_OPTION)  -omf=elf -I".." -I"." -Wa,-MD,"${OBJECTDIR}/_ext/1290873929/delay.o.d",--defsym=__MPLAB_BUILD=1,-g,--no-relax,-g$(MP_EXTRA_AS_POST)
	@${FIXDEPS} "${OBJECTDIR}/_ext/1290873929/delay.o.d"  $(SILENT)  -rsi ${MP_CC_DIR}../  
	
endif

# ------------------------------------------------------------------------------------
# Rules for buildStep: assemblePreproc
ifeq ($(TYPE_IMAGE), DEBUG_RUN)
else
endif

# ------------------------------------------------------------------------------------
# Rules for buildStep: link
ifeq ($(TYPE_IMAGE), DEBUG_RUN)
dist/${CND_CONF}/${IMAGE_TYPE}/turner-ip25.X.${IMAGE_TYPE}.${OUTPUT_SUFFIX}: ${OBJECTFILES}  nbproject/Makefile-${CND_CONF}.mk    
	@${MKDIR} dist/${CND_CONF}/${IMAGE_TYPE} 
	${MP_CC} $(MP_EXTRA_LD_PRE)  -o dist/${CND_CONF}/${IMAGE_TYPE}/turner-ip25.X.${IMAGE_TYPE}.${OUTPUT_SUFFIX}  ${OBJECTFILES_QUOTED_IF_SPACED}      -mcpu=$(MP_PROCESSOR_OPTION)        -D__DEBUG -D__MPLAB_DEBUGGER_ICD3=1  -omf=elf  -mreserve=data@0x800:0x81F -mreserve=data@0x820:0x821 -mreserve=data@0x822:0x823 -mreserve=data@0x824:0x825 -mreserve=data@0x826:0x84F   -Wl,,--defsym=__MPLAB_BUILD=1,--defsym=__MPLAB_DEBUG=1,--defsym=__DEBUG=1,--defsym=__MPLAB_DEBUGGER_ICD3=1,$(MP_LINKER_FILE_OPTION),--heap=4096,--stack=256,--check-sections,--data-init,--pack-data,--handles,--isr,--no-gc-sections,--fill-upper=0,--stackguard=16,--library-path="..",--library-path=".",--no-force-link,--smart-io,-Map="${DISTDIR}/turner-ip25.X.${IMAGE_TYPE}.map",--report-mem,-ldsp-coff$(MP_EXTRA_LD_POST) 
	
else
dist/${CND_CONF}/${IMAGE_TYPE}/turner-ip25.X.${IMAGE_TYPE}.${OUTPUT_SUFFIX}: ${OBJECTFILES}  nbproject/Makefile-${CND_CONF}.mk   
	@${MKDIR} dist/${CND_CONF}/${IMAGE_TYPE} 
	${MP_CC} $(MP_EXTRA_LD_PRE)  -o dist/${CND_CONF}/${IMAGE_TYPE}/turner-ip25.X.${IMAGE_TYPE}.${DEBUGGABLE_SUFFIX}  ${OBJECTFILES_QUOTED_IF_SPACED}      -mcpu=$(MP_PROCESSOR_OPTION)        -omf=elf -Wl,,--defsym=__MPLAB_BUILD=1,$(MP_LINKER_FILE_OPTION),--heap=4096,--stack=256,--check-sections,--data-init,--pack-data,--handles,--isr,--no-gc-sections,--fill-upper=0,--stackguard=16,--library-path="..",--library-path=".",--no-force-link,--smart-io,-Map="${DISTDIR}/turner-ip25.X.${IMAGE_TYPE}.map",--report-mem,-ldsp-coff$(MP_EXTRA_LD_POST) 
	${MP_CC_DIR}\\xc16-bin2hex dist/${CND_CONF}/${IMAGE_TYPE}/turner-ip25.X.${IMAGE_TYPE}.${DEBUGGABLE_SUFFIX} -a  -omf=elf  
	
endif

.pre:
	@echo "--------------------------------------"
	@echo "User defined pre-build step: [python ..\..\imageproc-lib\version.py Turner-IP2.5;TI-Hbridge;Hall Effect]"
	@python ..\..\imageproc-lib\version.py Turner-IP2.5;TI-Hbridge;Hall Effect
	@echo "--------------------------------------"

# Subprojects
.build-subprojects:


# Subprojects
.clean-subprojects:

# Clean Targets
.clean-conf: ${CLEAN_SUBPROJECTS}
	${RM} -r build/default
	${RM} -r dist/default

# Enable dependency checking
.dep.inc: .depcheck-impl

DEPFILES=$(shell mplabwildcard ${POSSIBLE_DEPFILES})
ifneq (${DEPFILES},)
include ${DEPFILES}
endif
