import 'package:flutter/material.dart';
import 'package:flutter_joystick/flutter_joystick.dart';
import 'package:robot_controller/components/joystick.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Robot controller',
      theme: ThemeData(
        useMaterial3: true,
      ),
      home: const MyHomePage(title: 'Robot controller'),
    );
  }
}

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
      body: const JoystickPage(),
    );
  }
}

class JoystickPage extends StatelessWidget {
  const JoystickPage({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: LayoutBuilder(
        builder: (context, constraints) => Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            SizedBox(
              height: constraints.maxHeight,
              width: constraints.maxWidth / 2,
              child: const CustomJoystick(
                mode: JoystickMode.all,
                initialAlignment: Alignment(-0.8, 0.2),
              ),
            ),
            SizedBox(
              height: constraints.maxHeight,
              width: constraints.maxWidth / 2,
              child: const CustomJoystick(
                mode: JoystickMode.horizontal,
                initialAlignment: Alignment(0.8, 0.2),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
