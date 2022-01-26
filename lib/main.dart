// @dart=2.9
import 'package:flutter/material.dart';
import 'package:flutter_video_cast/flutter_video_cast.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: CastSample(),
    );
  }
}


class CastSample extends StatefulWidget {
  @override
  _CastSampleState createState() => _CastSampleState();
}

class _CastSampleState extends State<CastSample> {
  ChromeCastController _controller;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Cast Sample'),
        actions: [
          ChromeCastButton(
            onRequestFailed: (value) {
              print(value);
            },
            onButtonCreated: (controller) {
              print("3");

              setState(() => _controller = controller);
              _controller?.addSessionListener();
            },
            onSessionStarted: () {
              print("oi");

              _controller?.loadMedia('https://commondatastorage.googleapis.com/gtv-videos-bucket/sample/BigBuckBunny.mp4');
            },
          ),
        ],
      ),
    );
  }
}