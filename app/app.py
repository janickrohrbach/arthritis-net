import sys
from PyQt5.QtGui import QPixmap
from PyQt5.QtWidgets import QWidget, QVBoxLayout, QPushButton, QLabel, \
    QFileDialog, QApplication


class App(QWidget):

    def __init__(self):
        super().__init__()
        self.title = 'Prediction'
        self.left = 300
        self.top = 300
        self.width = 640
        self.height = 480
        self.initUI()

    def initUI(self):
        layout = QVBoxLayout()
        self.btn = QPushButton("Upload Image")
        self.btn.clicked.connect(self.getfile)
        layout.addWidget(self.btn)

        self.label = QLabel(self)

        self.setLayout(layout)
        self.setWindowTitle("Prediction")

    def getfile(self):
        fname = QFileDialog.getOpenFileName(self, 'Open file',
                                            'c:\\',
                                            "Image files (*.jpg *.gif *.png)")

        pixmap = QPixmap(fname[0])
        self.label.setPixmap(pixmap)
        self.resize(pixmap.width(), pixmap.height())



if __name__ == '__main__':
    app = QApplication(sys.argv)
    ex = App()
    ex.show()
    sys.exit(app.exec_())