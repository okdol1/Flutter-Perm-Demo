import 'package:camera/camera.dart';
import 'package:flutter/material.dart';

import '../widgets/take_picture_screen.dart';

class CameraService {
  static Future<void> openCamera(BuildContext context) async {
    try {
      final cameras = await availableCameras();
      final backCamera = cameras.firstWhere(
        (camera) => camera.lensDirection == CameraLensDirection.back,
        orElse: () => throw Exception('후면 카메라가 없습니다.'),
      );

      Navigator.push(
        context,
        MaterialPageRoute(
          builder: (context) => TakePictureScreen(camera: backCamera),
        ),
      );
    } catch (e) {
      ScaffoldMessenger.of(
        context,
      ).showSnackBar(SnackBar(content: Text('카메라 오류: $e')));
    }
  }
}
