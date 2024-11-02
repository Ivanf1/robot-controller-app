import 'package:robot_controller/data/joystick_value.dart';
import 'package:robot_controller/ros/ros_manager.dart';
import 'package:robot_controller/streams/joystick_stream.dart';

class JoystickPublisher {
  static const String _topic = "/movement/xy";
  static const String _topicType = "uno/xy";

  static void init() {
    RosManager.registerTopic(_topic, _topicType);

    JoystickStreamController.leftJoystickValueStream
        .listen((JoystickValue value) {
      RosManager.publish(_topic, value);
    });
  }
}
