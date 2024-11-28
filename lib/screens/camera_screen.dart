import 'package:flutter/material.dart';
import 'package:robot_controller/preferences/preferences_manager.dart';
import 'package:robot_controller/widgets/webview_page.dart';

class CameraScreen extends StatefulWidget {
  const CameraScreen({super.key});

  @override
  State<CameraScreen> createState() => _CameraScreenState();
}

class _CameraScreenState extends State<CameraScreen> {
  String? _cameraAddress = "";

  @override
  void initState() {
    _cameraAddress = PreferencesManager.getPicameraAddress();
    PreferencesManager.picameraAddressUpdateStream.listen((String address) {
      setState(() {
        _cameraAddress = address;
      });
    });
    super.initState();
  }

  Widget _buildView() {
    if (_cameraAddress == null || _cameraAddress == "") {
      return LayoutBuilder(builder: (context, constraints) {
        return SizedBox(
          width: constraints.maxWidth,
          child: const Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Text(
                "No camera",
                style: TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.w500,
                ),
              ),
            ],
          ),
        );
      });
    }

    return WebViewPage(url: _cameraAddress!);
  }

  @override
  Widget build(BuildContext context) {
    return _buildView();
  }
}
