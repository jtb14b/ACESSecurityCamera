
#from PyQt5.QtWidgets import QApplication, QLabel
#app = QApplication([])
#label = QLabel('Hello World')
#label.show()
#app.exec()

#from Security_Camera.py import Ui_Dialog

#from PyQt5 import QtCore, QtGui, QtWidgets
#from PyQt5.QtWidgets import QApplication

#from PyQt5 import QtGui, QtWidgets
#import sys

#import Security_Camera

#class ExampleApp(QtWidgets.QMainWindow, Security_Camera.Ui_MainWindow):
#    def __init__(self):
#        super(self.__class__, self).__init__()
#        self.setupUi(self)


#def main():
#    app = QtGui.QApplication(sys.argv)
#    form = ExampleApp()
#    form.show()
#    app.exec_()

#if __name__ == '__main__':
#    main()

import sys
from PyQt5.QtWidgets import QApplication, QDialog
from Security_Camera_2 import Ui_Dialog

app = QApplication(sys.argv)
window = QDialog()
ui = Ui_Dialog()
ui.setupUi(window)

window.show()
sys.exit(app.exec_())
