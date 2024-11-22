import 'package:flutter/material.dart';
import 'package:todo/core/colors_manager.dart';

import '../core/my_text_styles.dart';

class MyTheme{

static ThemeData light= ThemeData(
colorScheme: ColorScheme.fromSeed(seedColor: ColorsManager.whiteColor,primary: ColorsManager.blueColor,secondary: ColorsManager.whiteColor)
  
  ,

useMaterial3: false,
primaryColor: ColorsManager.blueColor,
scaffoldBackgroundColor: ColorsManager.scaffoldColor,
appBarTheme: AppBarTheme(
backgroundColor: ColorsManager.blueColor,
  elevation: 4,
  centerTitle: true,
  titleTextStyle: LightMyAppTextStyles.appBarTextStyle,

),
  bottomNavigationBarTheme: BottomNavigationBarThemeData(

backgroundColor: Colors.transparent,
    selectedItemColor: ColorsManager.blueColor,
    unselectedItemColor:ColorsManager.grayColor,
elevation: 0,
    selectedIconTheme: IconThemeData(

      size: 32
    )

  ),
  floatingActionButtonTheme: FloatingActionButtonThemeData(
    backgroundColor: ColorsManager.blueColor ,
    shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(50),side:BorderSide(color: Colors.white,width: 4) ),
    iconSize: 30,
  ),
bottomAppBarTheme: BottomAppBarTheme(
    color: ColorsManager.whiteColor,
  shape: CircularNotchedRectangle(),
  elevation: 14,




),
cardTheme: CardTheme(
  color: ColorsManager.whiteColor,

),
  dividerColor: ColorsManager.blueColor,
  iconTheme: IconThemeData(
    color: ColorsManager.whiteColor,

  ),
  bottomSheetTheme: BottomSheetThemeData(
shape: RoundedRectangleBorder(
  
  borderRadius: BorderRadius.only(
    topLeft: Radius.circular(12),
    topRight: Radius.circular(12)
    
  ),
),


  ),


);
static ThemeData dark= ThemeData(
  colorScheme: ColorScheme.fromSeed(seedColor: ColorsManager.whiteColor,primary: ColorsManager.blueColor,secondary: ColorsManager.bottleGreen)

  ,

  useMaterial3: false,
  primaryColor: ColorsManager.blueColor,
  scaffoldBackgroundColor: ColorsManager.blueColor,
  appBarTheme: AppBarTheme(
    backgroundColor: ColorsManager.blueColor,
    elevation: 4,
    centerTitle: true,
    titleTextStyle: LightMyAppTextStyles.appBarTextStyle,

  ),
  bottomNavigationBarTheme: BottomNavigationBarThemeData(

      backgroundColor: Colors.transparent,
      selectedItemColor: ColorsManager.bottleGreen,
      unselectedItemColor:ColorsManager.grayColor,
      elevation: 40,
      selectedIconTheme: IconThemeData(

          size: 32
      )

  ),
  floatingActionButtonTheme: FloatingActionButtonThemeData(
    backgroundColor: ColorsManager.blueColor ,
    shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(50),side:BorderSide(color: ColorsManager.bottleGreen,width: 4) ),
    iconSize: 30,
  ),
  bottomAppBarTheme: BottomAppBarTheme(
    color: ColorsManager.darkbottomAppbar,
    shape: CircularNotchedRectangle(),
    elevation: 50,




  ),
  cardTheme: CardTheme(
elevation: 40,
    color: ColorsManager.whiteColor,

  ),
  dividerColor: ColorsManager.blueColor,
  iconTheme: IconThemeData(
    color: ColorsManager.whiteColor,

  ),
  bottomSheetTheme: BottomSheetThemeData(
    backgroundColor: ColorsManager.bottleGreen,
    shape: RoundedRectangleBorder(

      borderRadius: BorderRadius.only(
          topLeft: Radius.circular(12),
          topRight: Radius.circular(12)

      ),
    ),


  ),


);


}