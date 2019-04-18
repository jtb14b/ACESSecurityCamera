The following must be done to use the GUI:

1) Install Python37
    Found at: https://www.python.org/downloads/
    Change PATH variable location of python.exe
        Can be changed in advanced settings of python installer
2) Install PySerial
    Open Command Line
    'pip install pyserial'
3) Install PyQt5
    Open Command Line
    'pip install PyQt5'
4) Run the GUI
    Open Command Line
    'python GUICode\CameraGUI.py'
    or
    'python GUICode\CameraGUI.py -p <COM Port>'
5) Wait for FPGA Bootup
    Indicated by green LED labeled 'DONE'

6) Click Power button in GUI

7) Run Commands

Possible other required steps:

    Check COM port in Device Manager
        Specify in Command Line Launcher of GUI using "-p <COM Port>"

Unlikely required steps:

    Install pip
        https://bootstrap.pypa.io/get-pip.py

    Change specified python location in pyuic5.bat

    Configure virtual COM ports
