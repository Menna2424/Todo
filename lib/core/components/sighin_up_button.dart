

import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:todo/core/routes_manager.dart';

import '../colors_manager.dart';

class SighinUpButton extends StatelessWidget {
  late String text ;
   SighinUpButton({super.key,required this.text});

  @override
  Widget build(BuildContext context) {
    return  MaterialButton(onPressed: (){

Navigator.pushReplacementNamed(context, RoutesManager.homeRoute);
    },
      child: Container(
        width: double.infinity,
        height: 60,
        padding: EdgeInsets.symmetric(horizontal: 20),
        decoration: BoxDecoration(
            color: ColorsManager.bottleGreen,
            borderRadius: BorderRadius.circular(12)


        ),
        child: Center(
          child: Text(text,style: GoogleFonts.poppins(
              color: ColorsManager.whiteColor,fontSize: 20,fontWeight: FontWeight.bold
          ),),
        ),
      )
    );
  }
}
