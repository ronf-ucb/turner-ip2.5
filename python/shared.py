BS_COMPORT = 'COM4' # ron
#BS_COMPORT = 'COM5' # ron
#BS_COMPORT = 'COM3' # duncan, ROBOPROC
BS_BAUDRATE = 230400

motor_gains_set = False
steering_gains_set = False
steering_rate_set = False
pkts = 0
bytesIn = 0
count2deg = 2000.0/(2**15-1)
echo_set = False   # set true when echo is received

imudata = [[]] * 300 # HACK should use numSamples
statedata = []
dutycycles = []
