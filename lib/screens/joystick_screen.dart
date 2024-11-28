import 'package:flutter/material.dart';
import 'package:flutter_joystick/flutter_joystick.dart';
import 'package:robot_controller/components/joystick.dart';
import 'package:robot_controller/data/joystick_value.dart';
import 'package:robot_controller/screens/settings_screen.dart';
import 'package:robot_controller/streams/arm_joystick_stream.dart';
import 'package:robot_controller/streams/movement_joystick_stream.dart';

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
    MovementJoystickStreamController.updateLeftValue(
      JoystickValue(x: details.y != 0 ? -details.y : 0, y: details.x),
    );
  }

  void _onRightJoystickChange(StickDragDetails details) {
    MovementJoystickStreamController.updateRightValue(
      JoystickValue(x: details.x, y: details.y),
    );
  }

  void _onArmJoystickChange(StickDragDetails details) {
    ArmJoystickStreamController.updateValue(
      JoystickValue(x: details.x, y: -details.y),
    );
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: LayoutBuilder(builder: (context, constraints) {
        var joystickMaxHeight = constraints.maxHeight * 0.4;

        return Column(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                SizedBox(
                  height: constraints.maxHeight * 0.2,
                  width: constraints.maxHeight * 0.2,
                  child: IconButton(
                    icon: const Icon(Icons.settings_outlined),
                    onPressed: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => const SettingsScreen(),
                        ),
                      );
                    },
                  ),
                ),
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Column(
                  children: [
                    SizedBox(
                      height: joystickMaxHeight,
                      width: joystickMaxHeight,
                    ),
                    SizedBox(
                      height: joystickMaxHeight,
                      width: joystickMaxHeight,
                      child: CustomJoystick(
                        mode: JoystickMode.all,
                        onJoystickChange: _onLeftJoystickChange,
                        joystickSize: joystickMaxHeight,
                      ),
                    ),
                  ],
                ),
                Column(
                  children: [
                    SizedBox(
                      height: joystickMaxHeight,
                      width: joystickMaxHeight,
                      child: CustomJoystick(
                        mode: JoystickMode.horizontalAndVertical,
                        onJoystickChange: _onArmJoystickChange,
                        joystickSize: joystickMaxHeight,
                      ),
                    ),
                    SizedBox(
                      height: joystickMaxHeight,
                      width: joystickMaxHeight,
                      child: CustomJoystick(
                        mode: JoystickMode.horizontal,
                        onJoystickChange: _onRightJoystickChange,
                        joystickSize: joystickMaxHeight,
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ],
        );
      }),
    );
  }
}
