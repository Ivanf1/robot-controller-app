import 'package:robot_controller/preferences/preferences_manager.dart';
import 'package:roslibdart/roslibdart.dart';

class RosManager {
  static late Ros _ros;
  static final Map<String, Topic> _topics = {};

  static void init() {
    String? rosBridgeAddress = PreferencesManager.getRosbridgeAddress();
    PreferencesManager.rosbridgeAddressUpdateStream
        .listen(_onRosbridgeAddressUpdate);
    _ros = Ros(url: rosBridgeAddress);

    if (rosBridgeAddress == null || rosBridgeAddress == "") {
      print("no address specified for rosbridge");
      return;
    }

    _connect();
  }

  static void _onRosbridgeAddressUpdate(String newAddress) async {
    if (_ros.status == Status.connecting || _ros.status == Status.connected) {
      await _ros.close();
    }
    print(newAddress);
    _ros.url = newAddress;
    _connect();
  }

  static void _connect() {
    try {
      print("connecting to ${_ros.url}");
      _ros.connect();
    } catch (e) {
      print("could not connect to ros bridge, error: ${e.toString()}");
    }
  }

  static void registerTopic(String topic, String type) {
    if (_topics.containsKey(topic)) {
      print("topic already registered");
      return;
    }

    var t = Topic(
      ros: _ros,
      name: topic,
      type: type,
      reconnectOnClose: true,
      queueLength: 10,
      queueSize: 10,
    );

    _topics[topic] = t;
  }

  static void publish(String topic, dynamic message) {
    if (!_topics.containsKey(topic)) return;
    // if (_ros.status != Status.connected) return;

    _topics[topic]!.publish(message);
  }
}
