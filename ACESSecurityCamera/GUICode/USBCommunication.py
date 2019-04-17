import serial

#ser = serial.Serial(port='/dev/ttyUSB1',baudrate=9600,parity=serial.PARITY_ODD,stopbits=serial.STOPBITS_TWO,bytesize=serial.SEVENBITS)

class myser():
    timer = ''
    buffer = b''
    ser = ''
    def __init__(self):
        pass

    def Cancel_Timer(self):
        try:
            self.timer.cancel()
        except Exception as ex:
            template = "ct: An exception of type {0} occured. Arguments:\n{1!r}"
            message = template.format(type(ex).__name__, ex.args)
            print(message)

    def OpenSerial(self, COM, Baud, Parity, sBits, dBits, Timeout):
    #    try:
        self.ser = serial.Serial(port=COM, baudrate=Baud, parity=Parity,
                         stopbits=sBits, bytesize=dBits, timeout=Timeout)
    #    except Exception as ex:

        template = "op: An exception of type {0} occured. Arguments:\n{1!r}"
        message = template.format(type(ex).__name__, ex.args)
        print(message)

    def SendSerial(self, data):
        try:
            if self.ser.is_open:
                s = str(data)
                print(s) ##
                chars = []
                for c in s:
                    chars.append(ord(c))
                    chars = list(map(int, chars))
                self.ser.write(chars)
                self.ser.flush()
            #    print("\n") ##
                #print(chars) ##
            #    print("\n") ##
        except Exception as ex:
            template = "ss: An exception of type {0} occured. Arguments:\n{1!r}"
            message = template.format(type(ex).__name__, ex.args)
            print(message)

    def ReadSerial(self, tmr, period):
        try:
            if self.ser.inWaiting() > 0:
                __stb = self.ser.read(self.ser.inWaiting())
                self.buffer += __stb
        except Exception as ex:
            template = "rs: An exception of type {0} occured. Arguments:\n{1!r}"
            message = template.format(type(ex).__name__, ex.args)
            print(message)
        if not tmr:
            return
        self.timer = threading.Timer(period, self.ReadSerial, [ True, period])
        self.timer.start()
        return


#mySer = myser()
#mySer.OpenSerial('COM1', 19200, 'N', 1, 8, 0)
#data = '010111010001'
#mySer.SendSerial(data)
