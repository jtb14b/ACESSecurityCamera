from PyQt5.QtWidgets import *
from Security_Camera_4 import Ui_Dialog

class ImageDialog(QDialog):



    def __init__(self):
        super(ImageDialog, self).__init__()
    #    self.initUI()
        self.ui = Ui_Dialog()
        #self.ui.setupUi(self)

    #    print('yo')

        #self.ui.pushButton_11.clicked.connect(self.on_button_clicked)
        #self.ui.pushButton_11.show()

    #def on_button_clicked(self):
        #print('hello')
    #def initUI(self):
        #self.ui = Ui_Dialog()
    #    self.ui.setupUi(self)

    #    print('yo')

    #    self.ui.pushButton_11.clicked.connect(self.on_button_clicked)
    #    self.ui.pushButton_11.show()

    #def on_button_clicked(self):
    #    print('hello')

if __name__ == "__main__":
    from PyQt5.QtWidgets import QApplication
    import sys, getopt

    port = 'COM5'

    try:
        opts, args = getopt.getopt(sys.argv[1:],'p:',['port='])
    except getopt.GetoptError:
        print("Error Error Error Error Error Error Error Error Error Error Error Error Error Error Error Error Error Error Error Error Error Error Error Error Error Error Error Error")
    for opt, arg in opts:
        if opt in ("-p", "--port"):
            port = arg
    print("COM port is", port)
    app = QApplication(sys.argv)
    b = ImageDialog()
    window = QDialog()
    b.ui.setupUi(window, port)
    window.show()
    sys.exit(app.exec_())

    if(b.ui.mySer.ser.isOpen()):
        b.ui.mySer.ser.close()
