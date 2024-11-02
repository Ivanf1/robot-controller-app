import 'package:flutter/material.dart';
import 'package:flutter_joystick/flutter_joystick.dart';
import 'package:robot_controller/components/joystick.dart';
import 'package:robot_controller/data/joystick_value.dart';
import 'package:robot_controller/streams/joystick_stream.dart';
import 'package:robot_controller/utils/utils.dart';

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
    int newLeftXValue =
        mapJoystickValueToMotorSpeed(details.x, _lastLeftXValue);
    int newLeftYValue =
        mapJoystickValueToMotorSpeed(details.y, _lastLeftYValue);

    JoystickStreamController.updateLeftValue(
      JoystickValue(x: newLeftXValue, y: newLeftYValue),
    );

    _lastLeftXValue = newLeftXValue;
    _lastLeftYValue = newLeftYValue;
  }

  void _onRightJoystickChange(StickDragDetails details) {
    int newRightXValue =
        mapJoystickValueToMotorSpeed(details.x, _lastRightXValue);
    int newRightYValue =
        mapJoystickValueToMotorSpeed(details.y, _lastRightYValue);

    JoystickStreamController.updateRightValue(
      JoystickValue(x: newRightXValue, y: newRightYValue),
    );

    _lastRightXValue = newRightXValue;
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
