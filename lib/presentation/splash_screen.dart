


import 'dart:async';

import 'package:flutter/material.dart';
import 'package:todo/core/routes_manager.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {

 @override
  void initState() {
    super.initState();
    Timer(Duration(seconds: 2),() {

      Navigator.pushReplacementNamed(context, RoutesManager.loginScreen);
    },);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [

          Image(image: AssetImage("assets/logo2.png"),width: 200,height: 200,)
        ],
      ),



    );
  }
}
