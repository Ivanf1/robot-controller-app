import 'package:flutter/material.dart';
import 'package:robot_controller/screens/joystick_screen.dart';

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: const Color.fromARGB(8, 0, 0, 0),
        title: Text(widget.title),
      ),
      body: const JoystickScreen(),
    );
  }
}
