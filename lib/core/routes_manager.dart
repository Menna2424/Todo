import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:todo/presentation/authontication/login.dart';
import 'package:todo/presentation/authontication/sign_in.dart';
import 'package:todo/presentation/home_screen.dart';
import 'package:todo/presentation/splash_screen.dart';

import '../presentation/edit_screen.dart';

class RoutesManager{
  static const String homeRoute = "/home";
  static const String splashScreen = "/splashScreen";
  static const String loginScreen = "/LoginScreen";
  static const String signinScreen = "/signinScreen";
  static const String editScreen = "/editScreen";


  static Route<dynamic>?router(RouteSettings settings){
    switch (settings.name){
      case homeRoute:
        {
          return MaterialPageRoute(builder: (context) => HomeScreen(),);
        }
      case splashScreen:{


        return MaterialPageRoute(builder: (context) => SplashScreen(),);
      }
      case loginScreen:{
        return MaterialPageRoute(builder: (context) => LoginScreen(),);


      }
      case signinScreen:{
        return MaterialPageRoute(builder: (context) => SignInScreen(),);

      }
      case editScreen:{
       // return MaterialPageRoute(builder: (context) => EditScreen(),);

      }
      
    }
    
    
  }
  
  
}