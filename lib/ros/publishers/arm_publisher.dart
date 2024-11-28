import 'package:robot_controller/data/joystick_value.dart';
import 'package:robot_controller/ros/ros_manager.dart';
import 'package:robot_controller/streams/arm_joystick_stream.dart';

class ArmPublisher {
  static const String _topic = "/my_robot/arm/xy";
  static const String _topicType = "uno/xy";

  static JoystickValue _value = JoystickValue(x: 0, y: 0);

  static void init() {
    RosManager.registerTopic(_topic, _topicType);

    ArmJoystickStreamController.leftJoystickValueStream
        .listen((JoystickValue value) {
      _value = value;
      _publishUpdatedValues();
    });
  }

  static void _publishUpdatedValues() {
    RosManager.publish(_topic, _value);
  }
}
