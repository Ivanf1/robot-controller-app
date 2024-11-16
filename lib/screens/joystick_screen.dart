import 'package:flutter/material.dart';
import 'package:flutter_joystick/flutter_joystick.dart';
import 'package:robot_controller/components/joystick.dart';
import 'package:robot_controller/data/joystick_value.dart';
import 'package:robot_controller/streams/joystick_stream.dart';

class JoystickScreen extends StatefulWidget {
  const JoystickScreen({super.key});

  @override
  State<StatefulWidget> createState() => _JoystickScreenState();
}

class _JoystickScreenState extends State<JoystickScreen> {
  void _onLeftJoystickChange(StickDragDetails details) {
    // NOTE: axis x of robot is axis y of joystick
    //       axis y of robot is axis x of joystick
    // y axis of joystick needs to be inverted
    JoystickStreamController.updateLeftValue(
      JoystickValue(x: details.y != 0 ? -details.y : 0, y: details.x),
    );
  }

  void _onRightJoystickChange(StickDragDetails details) {
    JoystickStreamController.updateRightValue(
      JoystickValue(x: details.x, y: details.y),
    );
  }

  void _onArmJoystickChange(StickDragDetails details) {
    // JoystickStreamController.updateRightValue(
    //   JoystickValue(x: details.x, y: details.y),
    // );
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
