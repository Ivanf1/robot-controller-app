import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:robot_controller/home.dart';
import 'package:robot_controller/preferences/preferences_manager.dart';
import 'package:robot_controller/ros/publishers/arm_publisher.dart';
import 'package:robot_controller/ros/publishers/movement_publisher.dart';
import 'package:robot_controller/ros/ros_manager.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await PreferencesManager.init();
  RosManager.init();
  MovementPublisher.init();
  ArmPublisher.init();

  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    SystemChrome.setPreferredOrientations([
      DeviceOrientation.landscapeLeft,
      DeviceOrientation.landscapeRight,
    ]);
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Robot controller',
      theme: ThemeData(
        useMaterial3: true,
      ),
      home: const MyHomePage(title: 'Robot controller'),
    );
  }
}
