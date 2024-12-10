import 'package:flutter/material.dart';
import 'package:flutter_webrtc/flutter_webrtc.dart';

class CameraScreen extends StatefulWidget {
  @override
  _CameraScreenState createState() => _CameraScreenState();
}

class _CameraScreenState extends State<CameraScreen> {
  late RTCVideoRenderer _renderer;
  late MediaStream _localStream;

  @override
  void initState() {
    super.initState();
    _initializeCamera();
  }

  // تهيئة الكاميرا
  void _initializeCamera() async {
    // إنشاء عنصر لتشغيل الفيديو
    _renderer = RTCVideoRenderer();
    await _renderer.initialize();

    // الحصول على تدفق الفيديو المحلي من الكاميرا
    _localStream = await navigator.mediaDevices.getUserMedia({
      'audio': false, // إذا كنت لا ترغب في الصوت
      'video': {
        'facingMode': 'user', // استخدام كاميرا أمامية
        'width': 640,
        'height': 480,
      },
    });

    // تعيين تدفق الفيديو ليظهر على الشاشة
    _renderer.srcObject = _localStream;

    // إعادة بناء الواجهة لتحديث العرض
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('WebRTC Camera Screen'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            // عرض الفيديو المحلي (الكاميرا)
            _renderer != null
                ? Container(
              width: 320,
              height: 240,
              child: RTCVideoView(_renderer),
            )
                : CircularProgressIndicator(),
            ElevatedButton(
              onPressed: () {
                // معالجة الصورة أو التفاعل مع الكاميرا
                // يمكن إضافة وظائف هنا مثل التقاط الصور
              },
              child: Text('Capture Image'),
            ),
          ],
        ),
      ),
    );
  }

  @override
  void dispose() {
    // تحرير موارد الكاميرا
    _localStream.dispose();
    _renderer.dispose();
    super.dispose();
  }
}
