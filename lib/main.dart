import 'package:flutter/material.dart';
import 'package:camera/camera.dart';
import 'camera_screen.dart';  // استيراد شاشة الكاميرا

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter AR Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: CameraScreen(), // شاشة الكاميرا كواجهة رئيسية
    );
  }
}
