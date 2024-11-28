import 'dart:async';

import 'package:shared_preferences/shared_preferences.dart';

class PreferencesManager {
  static late SharedPreferences _prefs;
  static const String _rosbridgeAddressKey = "rosbridge-address";
  static const String _picameraAddressKey = "picamera-address";

  static final StreamController<String> _rosbridgeAddressUpdateController =
      StreamController<String>.broadcast();

  static final StreamController<String> _picameraAddressUpdateController =
      StreamController<String>.broadcast();

  static Stream<String> get rosbridgeAddressUpdateStream =>
      _rosbridgeAddressUpdateController.stream;

  static Stream<String> get picameraAddressUpdateStream =>
      _picameraAddressUpdateController.stream;

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

  static void setPicameraAddress(String address) {
    _prefs.setString(_picameraAddressKey, address);
    _picameraAddressUpdateController.sink.add(address);
  }

  static String? getRosbridgeAddress() {
    return _prefs.getString(_rosbridgeAddressKey);
  }

  static String? getPicameraAddress() {
    return _prefs.getString(_picameraAddressKey);
  }
}
