

import 'package:flutter/material.dart';
import 'package:todo/core/my_text_styles.dart';

import '../colors_manager.dart';
typedef Validator = String? Function(String?);
class Cutomtextformfield extends StatelessWidget {
  late String hintText;
  Validator? validator ;
  TextEditingController? controller;
  bool isSecure;

  Cutomtextformfield({super.key,required this.hintText, this.validator, this.controller, this.isSecure=false});
  @override
  Widget build(BuildContext context) {
    return TextFormField(
      obscureText: isSecure,
     validator: validator,
      controller:controller ,
      decoration: InputDecoration(

        hintText: hintText,
        hintStyle: LightMyAppTextStyles.signinDes,
      focusedBorder: UnderlineInputBorder(borderSide: BorderSide(color:Colors.black)),
       enabledBorder: UnderlineInputBorder(borderSide: BorderSide(color: ColorsManager.grayColor)),
      ),


    );
  }
}
