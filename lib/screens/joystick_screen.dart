import 'package:flutter/material.dart';
import 'package:flutter_joystick/flutter_joystick.dart';
import 'package:robot_controller/components/joystick.dart';

class JoystickScreen extends StatefulWidget {
  const JoystickScreen({super.key});

  @override
  State<StatefulWidget> createState() => _JoystickScreenState();
}

class _JoystickScreenState extends State<JoystickScreen> {
  void _onLeftJoystickChange(details) {
    print("left x: ${details.x}");
    print("left y: ${details.y}");
  }

  void _onRightJoystickChange(details) {
    print("right x: ${details.x}");
    print("right y: ${details.y}");
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
