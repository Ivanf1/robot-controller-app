import 'package:robot_controller/data/Movement.dart';
import 'package:robot_controller/data/joystick_value.dart';
import 'package:robot_controller/ros/ros_manager.dart';
import 'package:robot_controller/streams/joystick_stream.dart';

class JoystickPublisher {
  static const String _topic = "/movement/xyz";
  static const String _topicType = "my_robot/xyz";

  static JoystickValue _left = JoystickValue(x: 0, y: 0);
  static JoystickValue _right = JoystickValue(x: 0, y: 0);

  static void init() {
    RosManager.registerTopic(_topic, _topicType);

    JoystickStreamController.leftJoystickValueStream
        .listen((JoystickValue value) {
      _left = value;
      _publishUpdatedValues();
    });

    JoystickStreamController.rightJoystickValueStream
        .listen((JoystickValue value) {
      _right = value;
      _publishUpdatedValues();
    });
  }

  static void _publishUpdatedValues() {
    RosManager.publish(_topic, Movement(x: _left.x, y: _left.y, z: _right.x));
  }
}
