import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:socialdoormobile/constants/route_constants.dart';
import 'package:socialdoormobile/cubit/user_cubit.dart';
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
    //
    // Timer(
    //     Duration(seconds: 7),
    //     () => Navigator.push(
    //         context, MaterialPageRoute(builder: (context) => SignInScreen()))
    // () => Navigator.of(context).pushReplacementNamed( DeliveryInfo.routeName )

    // );
    BlocProvider.of<UserCubit>(context).autoLogin();
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
    BlocProvider.of<UserCubit>(context).autoLogin();
    return BlocListener<UserCubit, UserState>(
      listener: (context, state) {
        if (state is LoginSuccess) {
          Navigator.pushNamed(context, HOME_SCREEN_ROUTE);
        } else if (state is LoginFailed) {
          Navigator.push(
              context, MaterialPageRoute(builder: (context) => SignInScreen()));
        }
      },
      child: Container(
        height: double.infinity,
        width: double.infinity,
        child: VideoPlayer(_videoPlayerController),
      ),
    );
  }
}
