import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:todo/core/colors_manager.dart';
import 'package:todo/core/routes_manager.dart';

import '../../core/components/cutomTextFormField.dart';
import '../../core/components/logo.dart';
import '../../core/components/sighin_up_button.dart';
import '../../core/my_text_styles.dart';

class LoginScreen extends StatelessWidget {
   LoginScreen({super.key});
TextEditingController emailController=TextEditingController();
   TextEditingController passwordController=TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: ColorsManager.blueColor,
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: SingleChildScrollView(
          child: SafeArea(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Logo(),
                SizedBox(height: 25,),
            
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      "Sign In ",
                      style:LightMyAppTextStyles.signin ),
                    SizedBox(height: 15,),
                    Text(
                      "Sign in now to acces your Tasks' calender ",
                      style:LightMyAppTextStyles.signinDes
                    ),
                  ],
                ),
              SizedBox(height: 50,),
            emailTextField(),
                SizedBox(height: 30,),
            
            
                passwordTextField(),
            
            
                forgetPassword(),
                SizedBox(height: 20,),
            
                SighinUpButton(text: "LOGIN",),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                        "Don't have an account ?",
                        style:LightMyAppTextStyles.signinDes
                    ),
                    TextButton(onPressed: (){
            Navigator.pushReplacementNamed(context, RoutesManager.signinScreen);
            
                    }, child: Text("Sign Up",style: TextStyle(color: ColorsManager.whiteColor,fontSize:18 ),))
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );


  }
   forgetPassword(){

    return  Row(mainAxisAlignment: MainAxisAlignment.end,
      children: [
        TextButton(onPressed: (){}, child: Text("Forget Password?",style: TextStyle(
            color: ColorsManager.grayColor,fontSize: 12

        ),)),
      ],
    );
  }
  emailTextField(){
    return Cutomtextformfield(controller: emailController,hintText: "Email Address",validator: (email) {
      if(email==null||email.trim().isEmpty){
        return "Plz ,enter your email ";
      }

    },);

  }
passwordTextField(){

    return    Cutomtextformfield(controller: passwordController,isSecure : true,hintText: "Password",validator: (password) {
      if(password==null||password.trim().isEmpty){
        return "Plz ,enter your Password ";
      }else if (password.length<8)
        return "the password must be at least 8 chars "
        ;
    },
    );
}




}
