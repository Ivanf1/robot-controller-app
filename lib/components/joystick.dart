import 'package:flutter/material.dart';
import 'package:flutter_joystick/flutter_joystick.dart';

class CustomJoystick extends StatefulWidget {
  const CustomJoystick({
    super.key,
    required this.mode,
    required this.initialAlignment,
    required this.onJoystickChange,
    // required this.joystickSize,
  });

  final JoystickMode mode;
  final Alignment initialAlignment;
  // final double joystickSize;
  final void Function(StickDragDetails) onJoystickChange;

  @override
  State<CustomJoystick> createState() => _CustomJoystickState();
}

class _CustomJoystickState extends State<CustomJoystick> {
  @override
  Widget build(BuildContext context) {
    return JoystickArea(
      initialJoystickAlignment: widget.initialAlignment,
      base: JoystickBase(
        size: 200,
        // size: widget.joystickSize,
        decoration: JoystickBaseDecoration(
          color: const Color.fromARGB(255, 202, 209, 241),
          drawArrows: true,
          drawOuterCircle: false,
          drawInnerCircle: false,
        ),
        arrowsDecoration: JoystickArrowsDecoration(
          color: const Color.fromARGB(25, 74, 36, 224),
          enableAnimation: false,
        ),
        mode: widget.mode,
      ),
      stick: JoystickStick(
        size: 40,
        // size: widget.joystickSize / 4,
        decoration: JoystickStickDecoration(
          color: const Color.fromARGB(255, 99, 153, 223),
          shadowColor: const Color.fromARGB(32, 99, 153, 223),
        ),
      ),
      mode: widget.mode,
      includeInitialAnimation: false,
      listener: widget.onJoystickChange,
    );
  }
}
