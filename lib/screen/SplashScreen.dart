import 'dart:async';

import 'package:flutter/material.dart';
import 'package:fooddelivery/main.dart';
import 'package:video_player/video_player.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({Key? key}) : super(key: key);

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  late VideoPlayerController _videoPlayerController;
  bool _loading = false;

  @override
  void initState() {
    super.initState();
    _videoPlayerController = VideoPlayerController.asset('assets/splash.mp4');
    _videoPlayerController.initialize().then((_) {
      setState(() {
        _videoPlayerController.play();
        _videoPlayerController.setLooping(true);
      });
    });
    Timer(const Duration(seconds: 3), () {
      // Navigator.pushReplacement(
      //     context, MaterialPageRoute(builder: (context) =>  HomePage()));
      Navigator.pushAndRemoveUntil(context,MaterialPageRoute(builder: (context) =>  HomePage()) , (route) => false);
    });
  }

  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
    _videoPlayerController.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        fit: StackFit.expand,
        children: [
          _videoPlayerController.value.isInitialized
              ? AspectRatio(
                  aspectRatio: _videoPlayerController.value.aspectRatio,
                  child: VideoPlayer(_videoPlayerController),
                )
              : Container()
        ],
      ),
    );
  }
}
