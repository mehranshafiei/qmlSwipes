import QtQuick 2.14
import QtQuick.Window 2.14
import QtQuick.VirtualKeyboard 2.14
import QtQuick.Controls 2.14
import QtQml.Models 2.2

Window {
    id: window
    visible: true
    width: 640
    height: 480

    Rectangle
    {
        id: rect1
        height: 400
        width: 400
        anchors.centerIn: parent
        color: "red"

        SwipeDetector
        {
            id:detector

            onSwipeDetected:
            {
                console.debug("Horizontal swipe direction: ", direction)
            }
        }
    }
}
