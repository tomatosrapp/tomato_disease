import 'package:flutter/material.dart';
import 'package:camera/camera.dart';

class LiveDetection extends StatefulWidget {
  @override
  _LiveDetectionState createState() => _LiveDetectionState();
}

class _LiveDetectionState extends State<LiveDetection> {
  late CameraController _cameraController;
  late List<CameraDescription> _cameras;

  @override
  void initState() {
    super.initState();
    initializeCamera();
  }

  Future<void> initializeCamera() async {
    _cameras = await availableCameras();
    _cameraController = CameraController(_cameras[0], ResolutionPreset.medium);
    await _cameraController.initialize();
    if (!mounted) return;
    setState(() {});
  }

  @override
  void dispose() {
    _cameraController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    if (!_cameraController.value.isInitialized) {
      return Container();
    }

    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Live Detection',
          style: TextStyle(color: Colors.black),
        ),
        backgroundColor: Color(0xFFB1EBCC),
      ),
      body: Stack(
        children: [
          Positioned.fill(
            child: CameraPreview(_cameraController),
          ),
          Positioned(
            top: 20.0,
            right: 20.0,
            child: IconButton(
              icon: Icon(Icons.close),
              color: Colors.white,
              onPressed: () {
                Navigator.pop(context);
              },
            ),
          ),
        ],
      ),
    );
  }
}
