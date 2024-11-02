import 'package:flutter/material.dart';
import 'package:flutter_joystick/flutter_joystick.dart';
import 'package:robot_controller/components/joystick.dart';

class JoystickScreen extends StatelessWidget {
  const JoystickScreen({super.key});

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
              child: const CustomJoystick(
                mode: JoystickMode.all,
                initialAlignment: Alignment(-0.8, 0.2),
              ),
            ),
            SizedBox(
              height: constraints.maxHeight,
              width: constraints.maxWidth / 2,
              child: const CustomJoystick(
                mode: JoystickMode.horizontal,
                initialAlignment: Alignment(0.8, 0.2),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
