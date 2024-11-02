import 'dart:async';

import 'package:shared_preferences/shared_preferences.dart';

class PreferencesManager {
  static late SharedPreferences _prefs;
  static const String _rosbridgeAddressKey = "rosbridge-address";

  static final StreamController<String> _rosbridgeAddressUpdateController =
      StreamController<String>.broadcast();

  static Stream<String> get rosbridgeAddressUpdateStream =>
      _rosbridgeAddressUpdateController.stream;

  static Future<void> init() async {
    _prefs = await SharedPreferences.getInstance();
  }

  static void dispose() {
    _rosbridgeAddressUpdateController.close();
  }

  static void setRosbridgeAddress(String address) {
    _prefs.setString(_rosbridgeAddressKey, address);
    _rosbridgeAddressUpdateController.sink.add(address);
  }

  static String? getRosbridgeAddress() {
    return _prefs.getString(_rosbridgeAddressKey);
  }
}
