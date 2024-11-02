import 'package:flutter/material.dart';
import 'package:robot_controller/preferences/preferences_manager.dart';

class SettingsScreen extends StatefulWidget {
  const SettingsScreen({super.key});

  @override
  State<StatefulWidget> createState() => _SettingsScreenState();
}

class _SettingsScreenState extends State<SettingsScreen> {
  final inputAddressController = TextEditingController();

  @override
  void initState() {
    super.initState();
    inputAddressController.text =
        PreferencesManager.getRosbridgeAddress() ?? "";
  }

  @override
  void dispose() {
    inputAddressController.dispose();
    super.dispose();
  }

  void _onSaveButtonPressed() {
    PreferencesManager.setRosbridgeAddress(inputAddressController.text);
    Navigator.pop(context);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: const Color.fromARGB(8, 0, 0, 0),
        title: const Text('Settings'),
      ),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.only(top: 20, left: 10, right: 10),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Padding(
                padding: EdgeInsets.only(bottom: 10),
                child: Text(
                  'rosbridge address',
                  style: TextStyle(fontSize: 16, fontWeight: FontWeight.w600),
                ),
              ),
              TextField(
                controller: inputAddressController,
                decoration: InputDecoration(
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(8.0),
                  ),
                  hintText: 'rosbridge address',
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(top: 20),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    OutlinedButton(
                      onPressed: _onSaveButtonPressed,
                      style: OutlinedButton.styleFrom(
                        // primary: Colors.blue, // Text color
                        backgroundColor: const Color.fromARGB(
                            255, 26, 91, 145), // Button background color
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(8.0), // Roundness
                        ),
                      ),
                      child: const Text(
                        'Save',
                        style: TextStyle(color: Colors.white),
                      ), // Button text
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
