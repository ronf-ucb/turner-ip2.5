# Keyboard control with hall effect sensing and telemetry
# updated for IP2.5 and AMS Hall angle sensor Jan. 2013
# treat encoder angle as 16 bits 0 ... 2pi (really 14 bits)
import msvcrt, sys
import numpy as np
from lib import command
from struct import *
import time
from xbee import XBee
import serial
from callbackFunc import xbee_received
import shared

DEST_ADDR = '\x20\x52'
imudata_file_name = 'imudata.txt'
telemetry = False
numSamples = 3000 # 1 kHz sampling in pid loop = 3 sec
imudata = [ [] ] * (numSamples+1)
gainsNotSet = True;
delay = 0.025

###### Operation Flags ####
RESET_ROBOT = False
##########################


# [Kp Ki Kd Kanti-wind ff]
# now uses back emf velocity as d term
# [left gains motor 0, right gains motor 1]
#motorgains = [400,0,400,0,0, 400,0,400,0,0]
# ok motor gains for high speed: motorgains = [1000,0,300,0,100, 1000,0,300,0,100]
motorgains = [2000,1000,150,0,200, 2000,1000,150,0,200]  # slow speed position tracking
throttle = [0,0]
duration = [512,512]  # length of run
cycle = 1000 # ms for a leg cycle
# velocity profile
# [time intervals for setpoints]
# [position increments at set points]
# [velocity increments]   
delta = [0x4000,0x4000,0x4000,0x4000]  # adds up to 65536 (2 pi)
intervals = [cycle/4, cycle/4, cycle/4, cycle/4]  # total cycle ms
# = delta/interval
velL = [0x4000 / intervals[0], 0x4000 / intervals[1], 0x4000/ intervals[2], 0x4000/intervals[3]]
velR = [0x4000 / intervals[0], 0x4000 / intervals[1], 0x4000/ intervals[2], 0x4000/intervals[3]]
# left side is opposite sign
#    temp0 = intervals + map(invert,delta) + map(invert,vel) # invert 0
leftVelData = [intervals,delta,velL]
rightVelData = [intervals,delta,velR]


ser = serial.Serial(shared.BS_COMPORT, shared.BS_BAUDRATE,timeout=3, rtscts=0)
xb = XBee(ser, callback = xbee_received)

def xb_send(status, type, data):
    payload = chr(status) + chr(type) + ''.join(data)
    xb.tx(dest_addr = DEST_ADDR, data = payload)

def resetRobot():
    xb_send(0, command.SOFTWARE_RESET, pack('h',0))

def runDiagnostic():
    print 'running robot diagnostic'
    xb_send(0, command.TEST_BOARD, "Robot Echo")   

def setThrust():
    global duration, delay, throttle
    time = max(duration) # just pick mx of 2 motor run times for now
    thrust = [throttle[0], throttle[1], time]
    print 'thrust', thrust
    xb_send(0, command.SET_THRUST, pack('3h',*thrust))
    print "cmdSetThrust " + str(thrust)

def menu():
    print "-------------------------------------"
    print "d: run Diagnostic test| g: right motor Gains  | l: Left motor gains"
    print "a: access PIDdata     | f: flash readback     | l: left motor gains"
    print "e: radio echo test    | g: right motor gains | h: Help menu"
    print "m: toggle memory mode | n: get robot Name    | p: Proceed"
    print "q: quit               | r: reset robot       | s: set throttle"
    print "t: time of move length| v: set velocity profile"
    print "x: PWM test thrust    | z: zero motor counts"
 
    
####################################
# set up velocity increments and setpoints for left and right sides

def queryVelProfile():    
    global leftVelData, rightVelData
    print "velocity profile l: left side/r: right side/d: duplicate \n    >", 
    keypress = msvcrt.getch()
    intervals, delta, vel = getVelProfile()
##    print 'getVelProfile. delta', delta,'intervals', intervals,'vel', vel
##    print 'after getVelProfile'
##    print "leftVelData =", leftVelData
##    print "rightVelData =", rightVelData
##    leftVelData = [intervals,delta,velL]
    if keypress == 'l':
        leftVelData = [intervals, delta, vel]  
        setVelProfile(leftVelData, rightVelData)
    elif keypress == 'r':
        rightVelData = [intervals, delta, vel]
        setVelProfile(leftVelData, rightVelData)      
    elif keypress == 'd':
        leftVelData = [intervals, delta, vel]  
        rightVelData = [intervals, delta, vel]
        setVelProfile(leftVelData, rightVelData)
    else:
         print "** unknown option** \n"
            

#get velocity profile
# velocity should be in Hall Diff per ms clock tick
# 
def getVelProfile():
    global cycle
    vel = [0,0,0,0] # local variables
    delta = [0,0,0,0]
    intervals =[0,0,0,0]
    sum = 0
    print 'set points in degrees e.g. 60,90,180,360:',
    x = raw_input()
    if len(x):
        temp = map(int,x.split(','))
        delta[0] = (temp[0]*65536)/360
        sum = delta[0]
        for i in range(1,3):
            delta[i] = ((temp[i]-temp[i-1])*65536)/360
            sum = sum + delta[i]
        delta[3]=65536-sum
    else:
        print 'not enough delta values'
    print 'current cycle (ms)',cycle,' new value:',
    cycle = int(raw_input())
    print 'enter % time of each segment <csv>',
    x = raw_input()
    if len(x):
        intervals = map(int,x.split(','))
        sum = 0
        for i in range(0,4):
            intervals[i] = cycle*intervals[i]/100  # interval in ms
            sum = sum + intervals[i]
            vel[i] = (delta[i])/intervals[i]
        #adjust to total duration for rounding
        intervals[3] = intervals[3] + cycle - sum
    else:
        print 'not enough values'
    print 'intervals (ms)',intervals
    return intervals, delta, vel
 
        
def invert(x):
    return (-x)

#set velocity profile
# invert profile for motor 0 for VelociRoACH kinematics
# format [ [delta], [intervals], [vel]
def setVelProfile(leftVelData,rightVelData):
    global intervals, vel
#    print "leftVelData =", leftVelData
    print "Sending velocity profile"
    print "intervals (ms)",leftVelData[0], rightVelData[0]
    print "set points [encoder values]", leftVelData[1], rightVelData[1]
    print "velocities (delta per ms)", leftVelData[2], rightVelData[2]
#    temp0 = intervals + map(invert,delta) + map(invert,vel) # invert 0
#    temp1 = intervals+delta+vel
#    temp = temp0 + temp1  # -left = right
# left opposite sign from right
    temp = leftVelData[0] + map(invert,leftVelData[1]) + map(invert,leftVelData[2]) # invert side 0
    temp = temp + rightVelData[0] + rightVelData[1] + rightVelData[2]
    print "velocity string", temp
    xb_send(0, command.SET_VEL_PROFILE, pack('24h',*temp))
    time.sleep(1)
   
##########################################    


# set robot control gains
def setGain():
    count = 0
    while not(shared.motor_gains_set):
        print "Setting motor gains. Packet:",count
        count = count + 1
        xb_send(0, command.SET_PID_GAINS, pack('10h',*motorgains))
        time.sleep(2)
  #      print "keybd for next try"
   #     x = raw_input()
        if count > 10:
            print "count exceeded. Exit."
            print "Halting xb"
            xb.halt()
            print "Closing serial"
            ser.close()
            print "Exiting..."
            sys.exit(0)

# allow user to set robot gain parameters
def getGain(lr):
    print 'Lmotor gains [Kp Ki Kd Kanti-wind ff]=', motorgains[0:5]
    print 'Rmotor gains [Kp Ki Kd Kanti-wind ff]=', motorgains[5:11]  
    x = None
    while not x:
        try:
            print 'Enter ',lr,'motor gains ,<csv> [Kp, Ki, Kd, Kanti-wind, ff]',
            x = raw_input()
        except ValueError:
            print 'Invalid Number'
    if len(x):
        motor = map(int,x.split(','))
        if len(motor) == 5:
            print lr,'motor gains', motor
# enable sensing gains again
            shared.motor_gains_set = False
            if lr == 'L':
                motorgains[0:5] = motor
           #     motorgains[5:11] = motor
            else:
                motorgains[5:11] = motor
        else:
            print 'not enough gain values'

        
# execute move command
# duration modified to allow running legs for differennt number of cycles
def proceed():
    global duration, numSamples, delay, throttle
    thrust = [throttle[0], duration[0], throttle[1], duration[1], 0]
    if telemetry:
        xb_send(0, command.ERASE_SECTORS, pack('h',numSamples))
        print "started erase, 5 second dwell"
        time.sleep(5)
        start = 0   # two byte start time to record
        skip = 0    # store every other sample if = 1
        temp=[numSamples,start,skip]
        print 'numSamples,start,skip =',temp,'\n'
        raw_input("Press any key to send StartTelem and Set_Thrust ...")
        xb_send(0, command.START_TELEM, pack('3h',*temp))
        time.sleep(0.1) # small gap to handle packet before starting motors
    print "thrust =" + str(thrust)
    # raw_input("Press any key to send  Set_Thrust ...")
    xb_send(0, command.SET_THRUST_CLOSED_LOOP, pack('5h',*thrust))
    print "Throttle = ",throttle,"duration =", duration
    time.sleep(0.1)
    if telemetry:
        flashReadback()

def flashReadback():
    global numsamples, dataFileName
    raw_input("Press any key to start readback ...")
    print "started readback of %d packets" %numSamples
   # shared.imudata = []  # reset imudata structure
    shared.imudata = [ [] ] * (numSamples+1)  # reset imudata structure
    shared.pkts = 0  # reset packet count???
    xb_send(0, command.FLASH_READBACK, pack('=h',numSamples))
    time.sleep(delay*numSamples + 5)
    print '\n after sleep, got shared.pkts =', shared.pkts
    while shared.pkts < numSamples:
        print "\n Retry after 10 seconds. Got only %d packets" %shared.pkts
        time.sleep(10)
     #   shared.imudata = [] # don't reinitialize already has some data
        shared.pkts = 0
        xb_send(0, command.FLASH_READBACK, pack('=h',numSamples))
        time.sleep(delay*numSamples + 7)
        if shared.pkts > numSamples:
            print "too many packets"
            break
        if shared.pkts < numSamples:
            print "\n too few packets",str(shared.pkts)
            break
    print "readback done with shared.pkts=", shared.pkts
# While waiting, write parameters to start of file
    writeFileHeader(dataFileName)     
    fileout = open(dataFileName, 'a')
 #   np.savetxt(fileout , np.array(shared.imudata), '%d', delimiter = ',')
# hack to prune off sequence number
    temp_array = np.array([e for e in shared.imudata if len(e)])
    temp_array1 = temp_array[0:,1:] # strip off sequence number
#    print 'temp sequence numbers', temp_array1[0:5]
# Duncan telem: don't need sequence number
    np.savetxt(fileout , temp_array1, '%d', delimiter = ',')
#    np.savetxt(fileout , np.array([e for e in shared.imudata if len(e)]), '%d', delimiter = ',')
    # Write non-empty lists in imudata to file
    fileout.close()
    print "data saved to ",dataFileName

# get one packet of PID data from robot
def getPIDdata():
    count = 0
    # shared.imudata = []  # reset imudata structure
    shared.imudata = [ [] ] * (numSamples+1)  # reset imudata structure
    shared.pkts = 0   # reset packet count
    dummy_data = [0,0] # index, time
    dummy_data = dummy_data + [0,0,0,0,0,0] # mpos, ref position, PMC duty cycle
    dummy_data = dummy_data + [0,0,0,0,0,0] # gyro + accelerometer
    dummy_data = dummy_data+ [0,0,0,0] # back EMF and VBatt and sOut
    # data format '=LLll'+13*'h'
    # data format Duncan '=LLLLll'+13*'h' 
 #   shared.imudata = [] #reset stored data
    shared.imudata[0]= dummy_data # use dummy data
    xb_send(0, command.GET_PID_TELEMETRY, pack('h',0))
    time.sleep(0.2)
    while shared.pkts == 0:
        print "\n Retry after 1 seconds. Got only %d packets" %shared.pkts
        time.sleep(1)
        count = count + 1
        if count > 5:
            print 'no return packet' # use dummy data
            break   
    data = shared.imudata[0]  # convert string list to numbers
#   temp_array = np.array([e for e in shared.imudata if len(e)])
#   import pdb; pdb.set_trace()
#    print 'packet=', data
    print 'index =', data[0]
    print 'time = ', data[1]
    print 'mpos=', data[2:4]
    print 'ref=', data[4:6]
    print 'pwm=',data[6:8]
    print 'gyro=',data[8:11], 'acc=', data[11:14]
    print 'emf=', data[14:16], 'Vbatt=',data[16]


        
def writeFileHeader(dataFileName):
    fileout = open(dataFileName,'w')
    #write out parameters in format which can be imported to Excel
    today = time.localtime()
    date = str(today.tm_year)+'/'+str(today.tm_mon)+'/'+str(today.tm_mday)+'  '
    date = date + str(today.tm_hour) +':' + str(today.tm_min)+':'+str(today.tm_sec)
    fileout.write('"Data file recorded ' + date + '"\n')
    if 1:   # duncan version
        fileout.write('"% Right Stride Frequency         = 0"\n')
        fileout.write('"% Left Stride Frequency         = 0"\n')
        fileout.write('"% Phase (Fractional)        = 0"\n')
    fileout.write('"%  keyboard_telem with hall effect "\n')
    fileout.write('"%  motorgains    = ' + repr(motorgains) + '"\n')
    if 0: # Ron version
        fileout.write('"%  delta         = ' +repr(delta) + '"\n')
        fileout.write('"%  intervals     = ' +repr(intervals) + '"\n')
    fileout.write('"% Columns: "\n')
    # order for wiring on RF Turner
  #  fileout.write('"% seq | time | LPos | RPos | LPWM | RPWM | GyroX | GryoY | GryoZ | GryoZAvg | AX | AY | AZ | LEMF | REMF | BAT | Steer"\n')
    #telem format for Duncan, note no sequence number
    fileout.write('"% time | LPos | RPos | LRef | RRef | dcL | dcR | GyX | GyY | GyZ | AX | AY | AZ | LEMF | REMF | BAT "\n')
  #  fileout.write('time, Rlegs, Llegs, DCL, DCR, GyroX, GryoY, GryoZ, GryoZAvg, AX, AY, AX, LBEMF, RBEMF, SteerOut\n')
    fileout.close()
    
def main():
    print 'keyboard_telem for IP2.5c Jan. 2015\n'
    global throttle, duration, telemetry, dataFileName
    dataFileName = 'Data/imudata.txt'
    count = 0       # keep track of packet tries
    print "using robot address", hex(256* ord(DEST_ADDR[0])+ ord(DEST_ADDR[1]))
    if RESET_ROBOT:
        print "Resetting robot..."
        resetRobot()
        time.sleep(1)  

    if ser.isOpen():
        print "Serial open. Using port",shared.BS_COMPORT
  
   
    xb_send(0, command.WHO_AM_I, "Robot Echo")
    time.sleep(0.5)
    setGain()
    time.sleep(0.5)  # wait for whoami before sending next command
    setVelProfile(leftVelData, rightVelData)
    throttle = [0,0]
    tinc = 25
    time.sleep(1)  # wait for other commands to get queued and processes
    #getPIDdata()    # one read for debugging
    # time in milliseconds
   # duration = 42*16-1  # 21.3 gear ratio, 2 counts/motor rev
   # duration = 5*100 -1  # integer multiple of time steps

    #blank out any keypresses leading in...
    while msvcrt.kbhit():
        ch = msvcrt.getch()
    menu()
    while True:
        print '>',
        keypress = msvcrt.getch()
        
        if keypress == ' ':
            throttle = [0,0]
        elif keypress == 'a':
            getPIDdata()
        elif keypress == 'c':
            throttle[0] = 0
        elif keypress == 'd':
            runDiagnostic()  # diagnostic test on IP2.5c board
        elif keypress == 'e':
   #         import pdb; pdb.set_trace()
            xb_send(0, command.ECHO,  "Echo Test")
            print 'xb_send ECHO'
        elif keypress == 'f':
            flashReadback()
        elif keypress == 'g':
            getGain('R')
            setGain()
        elif keypress == 'h':
            menu()
        elif keypress == 'l':
            getGain('L')
            setGain()    
        elif keypress =='m':
            telemetry = not(telemetry)
            print 'Telemetry recording', telemetry
        elif keypress =='n':
            xb_send(0, command.WHO_AM_I, "Robot Echo")      
        elif (keypress == 'p'):
             proceed()
        elif keypress == 'r':
            resetRobot()
            print 'Resetting robot'
        elif keypress == 's':  # set speed with throttle
            print "throttle = ", throttle, "enter throttle [0] (0-3800):",
            throttle[0]= int(raw_input())
            print "enter throttle[1]:",
            throttle[1]= int(raw_input())
            print "new throttle =", throttle
        elif keypress == 't':
            print 'cycle='+str(cycle)+' duration='+str(duration)+\
                     '. New duration[0]:',
            duration[0] = int(raw_input())
            print 'duration[1]:',
            duration[1] = int(raw_input())
        elif keypress =='v':
   #         getVelProfile()
   #         setVelProfile()
           queryVelProfile()
        elif keypress == 'w':
            throttle[1] += tinc
            print "Throttle = ",throttle
        elif keypress == 'x':
            setThrust()
        elif keypress == 'z':
            xb_send(0, command.ZERO_POS,  "Zero motor")
            print 'read motorpos and zero'
        elif (keypress == 'q') or (ord(keypress) == 26):
            print "Exit."
            xb.halt()
            ser.close()
            sys.exit(0)
        else:
            print "** unknown keyboard command** \n"
            menu()
            
        
        

#Provide a try-except over the whole main function
# for clean exit. The Xbee module should have better
# provisions for handling a clean exit, but it doesn't.
if __name__ == '__main__':
    try:
        main()
    except KeyboardInterrupt:
        xb.halt()
        ser.close()
    except IOError as inst:
        print type(inst)     # the exception instance
        print inst.args      # arguments stored in .args
        print inst 
        print "IO Error."
        xb.halt()
        ser.close()
