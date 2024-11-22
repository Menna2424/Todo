

import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import 'colors_manager.dart';

class LightMyAppTextStyles{

   static TextStyle appBarTextStyle =TextStyle
    (
    fontSize: 22,
    fontWeight: FontWeight.w700,
    color: ColorsManager.whiteColor,
  );

   static TextStyle taskTitleStyle= TextStyle(
   color: ColorsManager.whiteColor,
   fontWeight: FontWeight.w700,
   fontSize: 18,

   );

   static TextStyle signin=TextStyle(color: ColorsManager.whiteColor,fontWeight:FontWeight.bold,fontSize: 30 );
   static TextStyle signinDes= TextStyle(color: ColorsManager.grayColor,fontSize: 17);


   static TextStyle settingsItemLable= GoogleFonts.poppins(fontSize: 16,fontWeight: FontWeight.w700,color: ColorsManager.blueColor);

   static TextStyle addTaskTitle= GoogleFonts.poppins(
   fontSize: 20,
   color: ColorsManager.blueColor,
   fontWeight: FontWeight.bold,


   );
    static TextStyle SelectTimeText=GoogleFonts.poppins(
     fontSize: 20,
     color: ColorsManager.blueColor,);
   static TextStyle lightTimeText= TextStyle(
   fontSize: 12,
   fontWeight: FontWeight.w400,
   color: Colors.grey);




   static TextStyle languagechoice= TextStyle(color: ColorsManager.blueColor,fontSize: 14);
// fontWeight: FontWeight.bold,


}

class DarkMyAppTextStyles{

 static TextStyle appBarTextStyle =TextStyle
  (
  fontSize: 22,
  fontWeight: FontWeight.w700,
  color: ColorsManager.whiteColor,
 );

 static TextStyle taskTitleStyle= TextStyle(
  color: ColorsManager.whiteColor,
  fontWeight: FontWeight.w700,
  fontSize: 18,

 );

 static TextStyle signin=TextStyle(color: ColorsManager.whiteColor,fontWeight:FontWeight.bold,fontSize: 30 );
 static TextStyle signinDes= TextStyle(color: ColorsManager.grayColor,fontSize: 17);


 static TextStyle settingsItemLable= GoogleFonts.poppins(fontSize: 16,fontWeight: FontWeight.w700,color: ColorsManager.bottleGreen);

 static TextStyle addTaskTitle= GoogleFonts.poppins(
  fontSize: 20,
  color: ColorsManager.blueColor,
  fontWeight: FontWeight.bold,


 );
 static TextStyle SelectTimeText=GoogleFonts.poppins(
  fontSize: 20,
  color: ColorsManager.blueColor,);
 static TextStyle lightTimeText= TextStyle(
     fontSize: 12,
     fontWeight: FontWeight.w400,
     color: Colors.grey);

//8657
 //6071
 //6021



 static TextStyle languagechoice= TextStyle(color: ColorsManager.whiteColor,fontSize: 14);
// fontWeight: FontWeight.bold,


}
