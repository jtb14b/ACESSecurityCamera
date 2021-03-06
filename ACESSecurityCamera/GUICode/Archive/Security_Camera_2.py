# -*- coding: utf-8 -*-

# Form implementation generated from reading ui file 'Secuity_Camera_2.ui'
#
# Created by: PyQt5 UI code generator 5.12.1
#
# WARNING! All changes made in this file will be lost!

from PyQt5 import QtCore, QtGui, QtWidgets
from USBCommunication import myser

class Ui_Dialog(object):
    mySer = myser()

    def setupUi(self, Dialog):

        #mySer = myser()
        self.mySer.OpenSerial('COM5', 115200, 'N', 1, 8, 0)

        Dialog.setObjectName("Dialog")
        Dialog.setEnabled(True)
        Dialog.resize(537, 443)
        sizePolicy = QtWidgets.QSizePolicy(QtWidgets.QSizePolicy.Preferred, QtWidgets.QSizePolicy.MinimumExpanding)
        sizePolicy.setHorizontalStretch(0)
        sizePolicy.setVerticalStretch(0)
        sizePolicy.setHeightForWidth(Dialog.sizePolicy().hasHeightForWidth())
        Dialog.setSizePolicy(sizePolicy)
        Dialog.setCursor(QtGui.QCursor(QtCore.Qt.ArrowCursor))
        Dialog.setMouseTracking(False)
        Dialog.setFocusPolicy(QtCore.Qt.WheelFocus)
        Dialog.setContextMenuPolicy(QtCore.Qt.PreventContextMenu)
        icon = QtGui.QIcon()
        icon.addPixmap(QtGui.QPixmap("camera icon.png"), QtGui.QIcon.Normal, QtGui.QIcon.Off)
        Dialog.setWindowIcon(icon)
        Dialog.setWindowOpacity(1.0)
        Dialog.setToolTipDuration(-2)
        Dialog.setLayoutDirection(QtCore.Qt.RightToLeft)
        Dialog.setSizeGripEnabled(False)
        self.verticalLayout = QtWidgets.QVBoxLayout(Dialog)
        self.verticalLayout.setObjectName("verticalLayout")
        self.horizontalLayout = QtWidgets.QHBoxLayout()
        self.horizontalLayout.setObjectName("horizontalLayout")
        self.pushButton = QtWidgets.QPushButton(Dialog)
        self.pushButton.setCursor(QtGui.QCursor(QtCore.Qt.ArrowCursor))
        self.pushButton.setFocusPolicy(QtCore.Qt.WheelFocus)
        self.pushButton.setContextMenuPolicy(QtCore.Qt.NoContextMenu)
        self.pushButton.setCheckable(False)
        self.pushButton.setObjectName("pushButton")
        self.horizontalLayout.addWidget(self.pushButton)
        self.pushButton_2 = QtWidgets.QPushButton(Dialog)
        self.pushButton_2.setEnabled(True)
        self.pushButton_2.setMouseTracking(True)
        self.pushButton_2.setAcceptDrops(False)
        self.pushButton_2.setInputMethodHints(QtCore.Qt.ImhHiddenText)
        self.pushButton_2.setIconSize(QtCore.QSize(9, 10))
        self.pushButton_2.setCheckable(True)
        self.pushButton_2.setChecked(False)
        self.pushButton_2.setAutoDefault(True)
        self.pushButton_2.setDefault(False)
        self.pushButton_2.setFlat(False)
        self.pushButton_2.setObjectName("pushButton_2")
        self.horizontalLayout.addWidget(self.pushButton_2)
        self.verticalLayout.addLayout(self.horizontalLayout)
        self.line_3 = QtWidgets.QFrame(Dialog)
        self.line_3.setFrameShape(QtWidgets.QFrame.HLine)
        self.line_3.setFrameShadow(QtWidgets.QFrame.Sunken)
        self.line_3.setObjectName("line_3")
        self.verticalLayout.addWidget(self.line_3)
        self.Modes = QtWidgets.QGridLayout()
        self.Modes.setObjectName("Modes")
        self.pushButton_8 = QtWidgets.QPushButton(Dialog)
        self.pushButton_8.setObjectName("pushButton_8")
        self.Modes.addWidget(self.pushButton_8, 3, 0, 1, 1)
        self.pushButton_5 = QtWidgets.QPushButton(Dialog)
        self.pushButton_5.setObjectName("pushButton_5")
        self.Modes.addWidget(self.pushButton_5, 5, 0, 1, 1)
        self.pushButton_4 = QtWidgets.QPushButton(Dialog)
        self.pushButton_4.setObjectName("pushButton_4")
        self.Modes.addWidget(self.pushButton_4, 5, 1, 1, 1)
        self.pushButton_9 = QtWidgets.QPushButton(Dialog)
        self.pushButton_9.setObjectName("pushButton_9")
        self.Modes.addWidget(self.pushButton_9, 2, 1, 1, 1)
        self.pushButton_6 = QtWidgets.QPushButton(Dialog)
        self.pushButton_6.setObjectName("pushButton_6")
        self.Modes.addWidget(self.pushButton_6, 2, 0, 1, 1)
        self.label_2 = QtWidgets.QLabel(Dialog)
        self.label_2.setObjectName("label_2")
        self.Modes.addWidget(self.label_2, 0, 1, 1, 1)
        self.pushButton_7 = QtWidgets.QPushButton(Dialog)
        self.pushButton_7.setObjectName("pushButton_7")
        self.Modes.addWidget(self.pushButton_7, 3, 1, 1, 1)
        self.verticalLayout.addLayout(self.Modes)
        self.line = QtWidgets.QFrame(Dialog)
        self.line.setFrameShape(QtWidgets.QFrame.HLine)
        self.line.setFrameShadow(QtWidgets.QFrame.Sunken)
        self.line.setObjectName("line")
        self.verticalLayout.addWidget(self.line)
        self.AzEl = QtWidgets.QVBoxLayout()
        self.AzEl.setObjectName("AzEl")
        self.gridLayout = QtWidgets.QGridLayout()
        self.gridLayout.setObjectName("gridLayout")
        self.pushButton_10 = QtWidgets.QPushButton(Dialog)
        self.pushButton_10.setEnabled(True)
        self.pushButton_10.setBaseSize(QtCore.QSize(0, 0))
        self.pushButton_10.setIconSize(QtCore.QSize(16, 16))
        self.pushButton_10.setObjectName("pushButton_10")
        self.gridLayout.addWidget(self.pushButton_10, 3, 2, 1, 1)
        spacerItem = QtWidgets.QSpacerItem(7, 20, QtWidgets.QSizePolicy.Expanding, QtWidgets.QSizePolicy.Minimum)
        self.gridLayout.addItem(spacerItem, 5, 0, 1, 1)
        spacerItem1 = QtWidgets.QSpacerItem(40, 20, QtWidgets.QSizePolicy.Expanding, QtWidgets.QSizePolicy.Minimum)
        self.gridLayout.addItem(spacerItem1, 3, 1, 1, 1)
        spacerItem2 = QtWidgets.QSpacerItem(6, 0, QtWidgets.QSizePolicy.Minimum, QtWidgets.QSizePolicy.Expanding)
        self.gridLayout.addItem(spacerItem2, 5, 2, 1, 1)
        spacerItem3 = QtWidgets.QSpacerItem(40, 20, QtWidgets.QSizePolicy.Expanding, QtWidgets.QSizePolicy.Minimum)
        self.gridLayout.addItem(spacerItem3, 3, 3, 1, 1)
        self.pushButton_12 = QtWidgets.QPushButton(Dialog)
        self.pushButton_12.setObjectName("pushButton_12")
        self.gridLayout.addWidget(self.pushButton_12, 5, 3, 1, 1)
        self.pushButton_11 = QtWidgets.QPushButton(Dialog)
        self.pushButton_11.setObjectName("pushButton_11")
        self.gridLayout.addWidget(self.pushButton_11, 6, 2, 1, 1)
        spacerItem4 = QtWidgets.QSpacerItem(7, 20, QtWidgets.QSizePolicy.Expanding, QtWidgets.QSizePolicy.Minimum)
        self.gridLayout.addItem(spacerItem4, 5, 4, 1, 1)
        spacerItem5 = QtWidgets.QSpacerItem(0, 0, QtWidgets.QSizePolicy.Expanding, QtWidgets.QSizePolicy.Minimum)
        self.gridLayout.addItem(spacerItem5, 2, 2, 1, 1)
        self.pushButton_13 = QtWidgets.QPushButton(Dialog)
        self.pushButton_13.setObjectName("pushButton_13")
        self.gridLayout.addWidget(self.pushButton_13, 5, 1, 1, 1)
        self.lineEdit = QtWidgets.QLineEdit(Dialog)
        self.lineEdit.setMaxLength(32751)
        self.lineEdit.setObjectName("lineEdit")
        self.gridLayout.addWidget(self.lineEdit, 0, 0, 1, 1)
        self.label_16 = QtWidgets.QLabel(Dialog)
        self.label_16.setAlignment(QtCore.Qt.AlignRight|QtCore.Qt.AlignTrailing|QtCore.Qt.AlignVCenter)
        self.label_16.setObjectName("label_16")
        self.gridLayout.addWidget(self.label_16, 0, 1, 1, 1)
        self.lineEdit_2 = QtWidgets.QLineEdit(Dialog)
        self.lineEdit_2.setObjectName("lineEdit_2")
        self.gridLayout.addWidget(self.lineEdit_2, 1, 0, 1, 1)
        self.label_17 = QtWidgets.QLabel(Dialog)
        self.label_17.setAlignment(QtCore.Qt.AlignRight|QtCore.Qt.AlignTrailing|QtCore.Qt.AlignVCenter)
        self.label_17.setObjectName("label_17")
        self.gridLayout.addWidget(self.label_17, 1, 1, 1, 1)
        self.label_4 = QtWidgets.QLabel(Dialog)
        self.label_4.setObjectName("label_4")
        self.gridLayout.addWidget(self.label_4, 0, 4, 1, 1)
        self.AzEl.addLayout(self.gridLayout)
        self.verticalLayout.addLayout(self.AzEl)
        self.line_2 = QtWidgets.QFrame(Dialog)
        self.line_2.setFrameShape(QtWidgets.QFrame.HLine)
        self.line_2.setFrameShadow(QtWidgets.QFrame.Sunken)
        self.line_2.setObjectName("line_2")
        self.verticalLayout.addWidget(self.line_2)
        self.Zoom = QtWidgets.QVBoxLayout()
        self.Zoom.setObjectName("Zoom")
        self.label = QtWidgets.QLabel(Dialog)
        self.label.setObjectName("label")
        self.Zoom.addWidget(self.label)
        self.horizontalSlider = QtWidgets.QSlider(Dialog)
        self.horizontalSlider.setPageStep(10)
        self.horizontalSlider.setOrientation(QtCore.Qt.Horizontal)
        self.horizontalSlider.setTickPosition(QtWidgets.QSlider.TicksBelow)
        self.horizontalSlider.setTickInterval(11)
        self.horizontalSlider.setObjectName("horizontalSlider")
        self.Zoom.addWidget(self.horizontalSlider)
        self.horizontalLayout_5 = QtWidgets.QHBoxLayout()
        self.horizontalLayout_5.setObjectName("horizontalLayout_5")
        self.label_7 = QtWidgets.QLabel(Dialog)
        self.label_7.setAlignment(QtCore.Qt.AlignRight|QtCore.Qt.AlignTrailing|QtCore.Qt.AlignVCenter)
        self.label_7.setObjectName("label_7")
        self.horizontalLayout_5.addWidget(self.label_7)
        spacerItem6 = QtWidgets.QSpacerItem(45, 20, QtWidgets.QSizePolicy.Expanding, QtWidgets.QSizePolicy.Minimum)
        self.horizontalLayout_5.addItem(spacerItem6)
        self.label_13 = QtWidgets.QLabel(Dialog)
        self.label_13.setMaximumSize(QtCore.QSize(16777213, 16777215))
        self.label_13.setObjectName("label_13")
        self.horizontalLayout_5.addWidget(self.label_13)
        spacerItem7 = QtWidgets.QSpacerItem(55, 20, QtWidgets.QSizePolicy.Expanding, QtWidgets.QSizePolicy.Minimum)
        self.horizontalLayout_5.addItem(spacerItem7)
        self.label_9 = QtWidgets.QLabel(Dialog)
        self.label_9.setObjectName("label_9")
        self.horizontalLayout_5.addWidget(self.label_9)
        spacerItem8 = QtWidgets.QSpacerItem(52, 20, QtWidgets.QSizePolicy.Expanding, QtWidgets.QSizePolicy.Minimum)
        self.horizontalLayout_5.addItem(spacerItem8)
        self.label_11 = QtWidgets.QLabel(Dialog)
        self.label_11.setObjectName("label_11")
        self.horizontalLayout_5.addWidget(self.label_11)
        spacerItem9 = QtWidgets.QSpacerItem(52, 20, QtWidgets.QSizePolicy.Expanding, QtWidgets.QSizePolicy.Minimum)
        self.horizontalLayout_5.addItem(spacerItem9)
        self.label_14 = QtWidgets.QLabel(Dialog)
        self.label_14.setObjectName("label_14")
        self.horizontalLayout_5.addWidget(self.label_14)
        spacerItem10 = QtWidgets.QSpacerItem(54, 20, QtWidgets.QSizePolicy.Expanding, QtWidgets.QSizePolicy.Minimum)
        self.horizontalLayout_5.addItem(spacerItem10)
        self.label_6 = QtWidgets.QLabel(Dialog)
        self.label_6.setAlignment(QtCore.Qt.AlignCenter)
        self.label_6.setObjectName("label_6")
        self.horizontalLayout_5.addWidget(self.label_6)
        spacerItem11 = QtWidgets.QSpacerItem(52, 20, QtWidgets.QSizePolicy.Expanding, QtWidgets.QSizePolicy.Minimum)
        self.horizontalLayout_5.addItem(spacerItem11)
        self.label_10 = QtWidgets.QLabel(Dialog)
        self.label_10.setObjectName("label_10")
        self.horizontalLayout_5.addWidget(self.label_10)
        spacerItem12 = QtWidgets.QSpacerItem(52, 20, QtWidgets.QSizePolicy.Expanding, QtWidgets.QSizePolicy.Minimum)
        self.horizontalLayout_5.addItem(spacerItem12)
        self.label_8 = QtWidgets.QLabel(Dialog)
        self.label_8.setObjectName("label_8")
        self.horizontalLayout_5.addWidget(self.label_8)
        spacerItem13 = QtWidgets.QSpacerItem(55, 20, QtWidgets.QSizePolicy.Expanding, QtWidgets.QSizePolicy.Minimum)
        self.horizontalLayout_5.addItem(spacerItem13)
        self.label_12 = QtWidgets.QLabel(Dialog)
        self.label_12.setAlignment(QtCore.Qt.AlignLeading|QtCore.Qt.AlignLeft|QtCore.Qt.AlignVCenter)
        self.label_12.setObjectName("label_12")
        self.horizontalLayout_5.addWidget(self.label_12)
        spacerItem14 = QtWidgets.QSpacerItem(53, 20, QtWidgets.QSizePolicy.Expanding, QtWidgets.QSizePolicy.Minimum)
        self.horizontalLayout_5.addItem(spacerItem14)
        self.label_5 = QtWidgets.QLabel(Dialog)
        self.label_5.setObjectName("label_5")
        self.horizontalLayout_5.addWidget(self.label_5)
        self.Zoom.addLayout(self.horizontalLayout_5)
        self.horizontalLayout_4 = QtWidgets.QHBoxLayout()
        self.horizontalLayout_4.setObjectName("horizontalLayout_4")
        self.pushButton_16 = QtWidgets.QPushButton(Dialog)
        self.pushButton_16.setObjectName("pushButton_16")
        self.horizontalLayout_4.addWidget(self.pushButton_16)
        self.pushButton_14 = QtWidgets.QPushButton(Dialog)
        self.pushButton_14.setObjectName("pushButton_14")
        self.horizontalLayout_4.addWidget(self.pushButton_14)
        self.Zoom.addLayout(self.horizontalLayout_4)
        self.verticalLayout.addLayout(self.Zoom)

        self.retranslateUi(Dialog)
        QtCore.QMetaObject.connectSlotsByName(Dialog)
        Dialog.setTabOrder(self.pushButton, self.pushButton_14)
        Dialog.setTabOrder(self.pushButton_14, self.pushButton_2)
        Dialog.setTabOrder(self.pushButton_2, self.pushButton_7)
        Dialog.setTabOrder(self.pushButton_7, self.pushButton_4)
        Dialog.setTabOrder(self.pushButton_4, self.pushButton_8)
        Dialog.setTabOrder(self.pushButton_8, self.pushButton_5)
        Dialog.setTabOrder(self.pushButton_5, self.pushButton_9)
        Dialog.setTabOrder(self.pushButton_9, self.pushButton_6)

    def retranslateUi(self, Dialog):
        _translate = QtCore.QCoreApplication.translate
        Dialog.setWindowTitle(_translate("Dialog", "A.C.E.S."))
        self.pushButton.setText(_translate("Dialog", "Automatic Panning"))
        self.pushButton_2.setText(_translate("Dialog", "Power On"))
        self.pushButton_8.setText(_translate("Dialog", "Shade"))
        self.pushButton_5.setText(_translate("Dialog", "Direct Sunlight"))
        self.pushButton_4.setText(_translate("Dialog", "Disffused Sunlight"))
        self.pushButton_9.setText(_translate("Dialog", "Sunrise/Sunset"))
        self.pushButton_6.setText(_translate("Dialog", "Overcast"))
        self.label_2.setText(_translate("Dialog", "Modes:"))
        self.pushButton_7.setText(_translate("Dialog", "Daylight"))
        self.pushButton_10.setText(_translate("Dialog", "Up"))
        self.pushButton_12.setText(_translate("Dialog", "Left"))
        self.pushButton_11.setText(_translate("Dialog", "Down"))
        self.pushButton_13.setText(_translate("Dialog", "Right"))
        self.label_16.setText(_translate("Dialog", "Tilt:"))
        self.label_17.setText(_translate("Dialog", "Pan:"))
        self.label_4.setText(_translate("Dialog", "Azimuth and Elevation:"))
        self.label.setText(_translate("Dialog", "Zoom"))
        self.label_7.setText(_translate("Dialog", "10X"))
        self.label_13.setText(_translate("Dialog", "9X"))
        self.label_9.setText(_translate("Dialog", "8X"))
        self.label_11.setText(_translate("Dialog", "7X"))
        self.label_14.setText(_translate("Dialog", "6X"))
        self.label_6.setText(_translate("Dialog", "5X"))
        self.label_10.setText(_translate("Dialog", "4X"))
        self.label_8.setText(_translate("Dialog", "3X"))
        self.label_12.setText(_translate("Dialog", "2X"))
        self.label_5.setText(_translate("Dialog", "1X"))
        self.pushButton_16.setText(_translate("Dialog", "Max Zoom in"))
        self.pushButton_14.setText(_translate("Dialog", "Max Zoom out"))
        print('wassup')
        self.pushButton_10.clicked.connect(self.tiltUp)
        self.pushButton_11.clicked.connect(self.tiltDown)
        self.pushButton_12.clicked.connect(self.panLeft)
        self.pushButton_13.clicked.connect(self.panRight)

    def tiltUp(self):
        print("Tilt Up")
        self.mySer.SendSerial('C')

    def tiltDown(self):
        print("Tilt Down")
        self.mySer.SendSerial('D')

    def panLeft(self):
        print("Pan Left")
        self.mySer.SendSerial('A')

    def panRight(self):
        print("Pan Right")
        self.mySer.SendSerial('B')
