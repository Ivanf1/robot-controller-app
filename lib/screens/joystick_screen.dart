import 'package:flutter/material.dart';
import 'package:flutter_joystick/flutter_joystick.dart';
import 'package:robot_controller/components/joystick.dart';

int mapValue(double value, int lastValue) {
  if (value == 0) {
    return lastValue >= 1024 ? 1024 : 0;
  }
  if (value < 0) {
    return ((-value) * 1023).round();
  } else {
    return ((value * 1023) + 1024).round();
  }
}

class JoystickScreen extends StatefulWidget {
  const JoystickScreen({super.key});

  @override
  State<StatefulWidget> createState() => _JoystickScreenState();
}

class _JoystickScreenState extends State<JoystickScreen> {
  int _lastLeftYValue = 0;
  int _lastLeftXValue = 0;
  int _lastRightYValue = 0;
  int _lastRightXValue = 0;

  void _onLeftJoystickChange(StickDragDetails details) {
    int newLeftXValue = mapValue(details.x, _lastLeftXValue);
    print("left x: $newLeftXValue");
    _lastLeftXValue = newLeftXValue;

    int newLeftYValue = mapValue(details.y, _lastLeftYValue);
    print("left y: $newLeftYValue");
    _lastLeftYValue = newLeftYValue;
  }

  void _onRightJoystickChange(StickDragDetails details) {
    int newRightXValue = mapValue(details.x, _lastRightXValue);
    print("right x: $newRightXValue");
    _lastRightXValue = newRightXValue;

    int newRightYValue = mapValue(details.y, _lastRightYValue);
    print("right y: $newRightYValue");
    _lastRightYValue = newRightYValue;
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: LayoutBuilder(
        builder: (context, constraints) => Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            SizedBox(
              height: constraints.maxHeight,
              width: constraints.maxWidth / 2,
              child: CustomJoystick(
                mode: JoystickMode.all,
                initialAlignment: const Alignment(-0.8, 0.2),
                onJoystickChange: _onLeftJoystickChange,
              ),
            ),
            SizedBox(
              height: constraints.maxHeight,
              width: constraints.maxWidth / 2,
              child: CustomJoystick(
                mode: JoystickMode.horizontal,
                initialAlignment: const Alignment(0.8, 0.2),
                onJoystickChange: _onRightJoystickChange,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
