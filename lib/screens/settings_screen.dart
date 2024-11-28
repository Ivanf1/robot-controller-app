import 'package:flutter/material.dart';
import 'package:robot_controller/preferences/preferences_manager.dart';

class SettingsScreen extends StatefulWidget {
  const SettingsScreen({super.key});

  @override
  State<StatefulWidget> createState() => _SettingsScreenState();
}

class _SettingsScreenState extends State<SettingsScreen> {
  final inputBridgeAddressController = TextEditingController();
  final inputPicameraAddressController = TextEditingController();

  @override
  void initState() {
    super.initState();
    inputBridgeAddressController.text =
        PreferencesManager.getRosbridgeAddress() ?? "";
    inputBridgeAddressController.text =
        PreferencesManager.getPicameraAddress() ?? "";
  }

  @override
  void dispose() {
    inputBridgeAddressController.dispose();
    inputPicameraAddressController.dispose();
    super.dispose();
  }

  void _onSaveButtonPressed() {
    PreferencesManager.setRosbridgeAddress(inputBridgeAddressController.text);
    PreferencesManager.setPicameraAddress(inputPicameraAddressController.text);
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
                controller: inputBridgeAddressController,
                decoration: InputDecoration(
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(8.0),
                  ),
                  hintText: 'rosbridge address',
                ),
              ),
              const Padding(
                padding: EdgeInsets.only(bottom: 10, top: 20),
                child: Text(
                  'picamera address',
                  style: TextStyle(fontSize: 16, fontWeight: FontWeight.w600),
                ),
              ),
              TextField(
                controller: inputPicameraAddressController,
                decoration: InputDecoration(
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(8.0),
                  ),
                  hintText: 'picamera address',
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
