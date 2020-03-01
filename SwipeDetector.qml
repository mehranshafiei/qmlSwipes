import QtQuick 2.0

MultiPointTouchArea
{
    anchors.fill: parent
    minimumTouchPoints: 1
    maximumTouchPoints: 1
    mouseEnabled: true

    enum Directions
    {
        LeftSwipe,
        RightSwipe,
        UpSwipe,
        DownSwipe
    }

    signal swipeDetected(int direction)

    touchPoints:
        [ TouchPoint { id: point1 } ]

    onReleased:
    {
        var xChange = Math.abs(point1.startX - point1.x)
        var yChange = Math.abs(point1.startY - point1.y)

        // delta should be at least 10 percent of the width to
        // detect a swipe
        if (xChange > (0.1 * parent.width))
        {
            if (point1.startX > point1.x)
            {
                swipeDetected(SwipeDetector.Directions.LefSwipe)
            }
            else
            {
                swipeDetected(SwipeDetector.Directions.RightSwipe)
            }
        }

        if (yChange > (0.1 * parent.height))
        {
            if (point1.startY > point1.y)
            {
                swipeDetected(SwipeDetector.Directions.UpSwipe)
            }
            else
            {
                swipeDetected(SwipeDetector.Directions.DownSwipe)
            }
        }

    }
}
