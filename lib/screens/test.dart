import 'package:flutter/material.dart';

class MyWidget extends StatefulWidget {
  const MyWidget({super.key});

  @override
  _MyWidgetState createState() => _MyWidgetState();
}

class _MyWidgetState extends State<MyWidget> {
  double _containerHeight = 100.0;
  double _previousYPosition = 0.0;

  void _onVerticalDragUpdate(DragUpdateDetails details) {
    double currentYPosition = details.globalPosition.dy;
    double difference = currentYPosition - _previousYPosition;
    print(currentYPosition);
    print(difference);
    setState(() {
      if (difference > 0) {
        // Slide down
        _containerHeight += difference;
        print('아래로');
      } else {
        // Slide up
        _containerHeight += difference;
        print('위로');
      }

      _previousYPosition = currentYPosition;
    });
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onVerticalDragUpdate: _onVerticalDragUpdate,
      child: Stack(children: [
        Positioned(
            child: Container(
                color: Colors.white,
                height: MediaQuery.sizeOf(context).height)),
        Positioned(
          child: Container(
            height: _containerHeight,
            color: Colors.blue,
          ),
        ),
      ]),
    );
  }
}
