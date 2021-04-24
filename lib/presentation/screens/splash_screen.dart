import 'dart:async';

import 'package:flutter/material.dart';
import 'package:video_player/video_player.dart';

import '../../constants/videos.dart';
import 'sign_in_screen.dart';

class SplashScreen extends StatefulWidget {
  @override
  _SplashScreenState createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  VideoPlayerController _controller;

  VideoPlayerController _videoPlayerController;

  bool startedPlaying = false;

  @override
  void initState() {
    super.initState();

    _videoPlayerController = VideoPlayerController.asset(Videos.splashVideo)
      ..initialize();
    started();
    // _videoPlayerController.addListener(() {
    //   if (startedPlaying && !_videoPlayerController.value.isPlaying) {
    //     // Navigator.pop(contex);
    //   }
    // });
    Timer(
        Duration(seconds: 7),
        () => Navigator.push(
            context, MaterialPageRoute(builder: (context) => SignInScreen()))
        // () => Navigator.of(context).pushReplacementNamed( DeliveryInfo.routeName )

        );
  }

  @override
  void dispose() {
    _videoPlayerController.dispose();
    super.dispose();
  }

  // Future<bool> started() async {
  //   await _videoPlayerController.initialize();
  //   await _videoPlayerController.play();
  //   startedPlaying = true;
  //   return true;
  // }
  Future<void> started() async {
    await _videoPlayerController.play();
    startedPlaying = true;
    // return true;
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      height: double.infinity,
      width: double.infinity,
      child: VideoPlayer(_videoPlayerController),
    );
  }
}
