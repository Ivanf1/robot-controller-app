import 'dart:async';

import 'package:robot_controller/data/joystick_value.dart';

class ArmJoystickStreamController {
  static final StreamController<JoystickValue> _controller =
      StreamController<JoystickValue>.broadcast();

  static Stream<JoystickValue> get leftJoystickValueStream =>
      _controller.stream;

  static void updateValue(JoystickValue newValue) {
    _controller.sink.add(newValue);
  }

  static void dispose() {
    _controller.close();
  }
}
