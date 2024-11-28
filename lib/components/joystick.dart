import 'package:flutter/material.dart';
import 'package:flutter_joystick/flutter_joystick.dart';

class CustomJoystick extends StatefulWidget {
  const CustomJoystick({
    super.key,
    required this.mode,
    required this.onJoystickChange,
    required this.joystickSize,
  });

  final JoystickMode mode;
  final double joystickSize;
  final void Function(StickDragDetails) onJoystickChange;

  @override
  State<CustomJoystick> createState() => _CustomJoystickState();
}

class _CustomJoystickState extends State<CustomJoystick> {
  @override
  Widget build(BuildContext context) {
    return Joystick(
      base: JoystickBase(
        size: widget.joystickSize,
        decoration: JoystickBaseDecoration(
          color: const Color.fromARGB(140, 202, 209, 241),
          drawArrows: true,
          drawOuterCircle: false,
          drawInnerCircle: false,
        ),
        arrowsDecoration: JoystickArrowsDecoration(
          color: const Color.fromARGB(20, 74, 36, 224),
          enableAnimation: false,
        ),
        mode: widget.mode,
      ),
      stick: JoystickStick(
        size: widget.joystickSize * 0.28,
        decoration: JoystickStickDecoration(
          color: const Color.fromARGB(140, 99, 153, 223),
          shadowColor: const Color.fromARGB(0, 99, 153, 223),
        ),
      ),
      mode: widget.mode,
      includeInitialAnimation: false,
      listener: widget.onJoystickChange,
    );
  }
}
