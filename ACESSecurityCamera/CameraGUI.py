from PyQt5.QtWidgets import *
from Security_Camera_2 import Ui_Dialog

class ImageDialog(QDialog):



    def __init__(self):
        super(ImageDialog, self).__init__()
        self.initUI()
        self.ui = Ui_Dialog()
        #self.ui.setupUi(self)

        #print('yo')

        #self.ui.pushButton_11.clicked.connect(self.on_button_clicked)
        #self.ui.pushButton_11.show()

    #def on_button_clicked(self):
        #print('hello')
    def initUI(self):
        #self.ui = Ui_Dialog()
    #    self.ui.setupUi(self)

        print('yo')

    #    self.ui.pushButton_11.clicked.connect(self.on_button_clicked)
    #    self.ui.pushButton_11.show()

    #def on_button_clicked(self):
    #    print('hello')

if __name__ == "__main__":
    from PyQt5.QtWidgets import QApplication
    import sys
    app = QApplication(sys.argv)
    b = ImageDialog()
    window = QDialog()
    b.ui.setupUi(window)
    window.show()
    sys.exit(app.exec_())
