import 'dart:async';

import 'package:robot_controller/data/joystick_value.dart';

class MovementJoystickStreamController {
  static final StreamController<JoystickValue> _leftController =
      StreamController<JoystickValue>.broadcast();
  static final StreamController<JoystickValue> _rightController =
      StreamController<JoystickValue>.broadcast();

  static Stream<JoystickValue> get leftJoystickValueStream =>
      _leftController.stream;
  static Stream<JoystickValue> get rightJoystickValueStream =>
      _rightController.stream;

  static void updateLeftValue(JoystickValue newValue) {
    _leftController.sink.add(newValue);
  }

  static void updateRightValue(JoystickValue newValue) {
    _rightController.sink.add(newValue);
  }

  static void dispose() {
    _leftController.close();
    _rightController.close();
  }
}
