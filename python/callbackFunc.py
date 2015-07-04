from lib import command
from struct import pack,unpack

import shared

def xbee_received(packet):
    #global shared.shared.pkts, shared.motor_gains_set, shared.steering_gains_set, \
    #       shared.steering_rate_set, shared.count2deg
    rf_data = packet.get('rf_data')
#    rssi = ord(packet.get('rssi'))
#    print "rssi= ", rssi
    #(src_addr, ) = unpack('H', packet.get('source_addr'))
    #id = packet.get('id')
    #options = ord(packet.get('options'))

    status = ord(rf_data[0])
    type = ord(rf_data[1])
    data = rf_data[2:]
#    print 'rcv cmd:', str(type)
    if (type == command.GET_IMU_DATA):
        datum = unpack('l6h', data)
        #datum = unpack('l3f', data)
        if (datum[0] != -1):
            shared.imudata.append(datum)
            print "got datum:",datum
    elif (type == command.TX_SAVED_STATE_DATA):
        datum = unpack('l3f', data)
        if (datum[0] != -1):
            statedata.append(datum)
    elif (type == command.TX_DUTY_CYCLE):
        datum = unpack('lf', data)
        if (datum[0] != -1):
            dutycycles.append(datum)
    elif (type == command.ECHO):
        if shared.echo_set == True:
            print "echo:",status, type, data
        shared.echo_set = True  # set every time echo is received
    elif (type == command.WHO_AM_I):
       # print "whoami:",status, hex(type), data
        print "whoami:",data
        (src_addr, ) = unpack('>H', packet.get('source_addr'))
        print "Source address: 0x%02X | " % src_addr,
        print "rssi= ", ord(packet.get('rssi'))

    elif (type == command.SET_PID_GAINS):
        print "Set PID gains"
        gains = unpack('10h', data) # 10 gain 16 bit words
        print gains
        shared.motor_gains_set = True 
    elif (type == command.SET_STEERING_GAINS):
        print "Set Steering gains"
        gains = unpack('5h', data)
        print gains
        shared.steering_gains_set = True
 ###  commands related to Hall effect position control
    elif (type == command.SET_VEL_PROFILE):
        print "Set Velocity Profile readback"
 #      print "length data =",len(data)
        temp = unpack('24h', data)
      #  print temp
    elif (type == command.ZERO_POS):
        print 'Previous motor positions:',
        motor = unpack('=2l',data)
        print 'motor 0= %x' %motor[0] + ' motor 1= %x ' %motor[1]
    elif (type == command.SET_CTRLD_TURN_RATE):
        print "Set turning rate"
        rate = unpack('=h', data)[0]
        print "degrees: ",shared.count2deg * rate
        print "counts: ", rate
        shared.steering_rate_set = True
    elif (type == command.GET_IMU_LOOP_ZGYRO):
        pp = 2;
        print "Z Gyro Data Packet"
        datum = unpack('='+pp*'Lhhh', data)
        #print datum
        if (datum[0] != -1):
            for i in range(pp):
                shared.imudata.append(datum[4*i:4*(i+1)] )
    elif (type == command.ESTOP):
        print 'Emergency Stop from Robot'
        print "estop:",data
        
   # elif (type == command.SPECIAL_TELEMETRY):
    elif (type == command.FLASH_READBACK):
        shared.pkts = shared.pkts + 1
        # first word is packet #
        # updated angle position to signed long (l) for IP2.5
        # print "pkt ",shared.pkts,
        if (shared.pkts % 100) == 0:
            print shared.pkts,
        # print 'len(data), data=', len(data)
        #       pattern = '=LLll'+13*'h'  # RSF telem format, L = unsigned long
        pattern = '=LLllll'+11*'h'  # seq + Duncan telem format, added ref pos, no steer
        datum = unpack(pattern, data)
        telem_index = datum[0]
        datum = list(datum) #DUNCAN
 # diagnostic
 #      if (shared.pkts <= 30):
 #          print "telem_index, datum =", telem_index, map(hex,datum)
 #        if (datum[0] != -1):
 #       print "telemetry packet #", telem_index, '\r',
        if (datum[0] != -1) and (telem_index >= 0):
            shared.imudata[telem_index] = datum[0:18] # duncan telem format, no steer
            shared.bytesIn = shared.bytesIn + (5*4 + 11*2)
##         
##            if (shared.pkts != telem_index):
##                print str(shared.pkts) + "<>" + str(telem_index),
##            shared.imudata.append(datum)  # save data anyway
##      
    else:
        print 'Unknown rcv cmd:', hex(type)
        pass


