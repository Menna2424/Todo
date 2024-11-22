import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:todo/core/colors_manager.dart';
import 'package:todo/core/routes_manager.dart';

import '../../core/components/cutomTextFormField.dart';
import '../../core/components/logo.dart';
import '../../core/components/sighin_up_button.dart';
import '../../core/my_text_styles.dart';

class SignInScreen extends StatelessWidget {
  SignInScreen({super.key});

  TextEditingController userNameController = TextEditingController();
  TextEditingController emailController = TextEditingController();
  TextEditingController phoneController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  TextEditingController confirmPasswordController = TextEditingController();

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
                SizedBox(
                  height: 25,
                ),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text("Sign Up ", style: LightMyAppTextStyles.signin),
                    SizedBox(
                      height: 15,
                    ),
                    Text("Sign up now for free and start schedule your tasks",
                        style: LightMyAppTextStyles.signinDes),
                  ],
                ),
                SizedBox(
                  height: 50,
                ),
                emailTextField(),
                SizedBox(
                  height: 20,
                ),
                userNameTextField(),
                SizedBox(
                  height: 20,
                ),
                PhoneTextField(),
                SizedBox(
                  height: 20,
                ),
                passwordTextField(),
                SizedBox(
                  height: 20,
                ),
                confermPasswordTextField(),
                SizedBox(
                  height: 20,
                ),
                SighinUpButton(
                  text: "SIGNUP",
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text("Already have an account?",
                        style: LightMyAppTextStyles.signinDes),
                    TextButton(
                        onPressed: () {
                          Navigator.pushReplacementNamed(
                              context, RoutesManager.loginScreen);
                        },
                        child: Text(
                          "Sign in",
                          style: TextStyle(
                              color: ColorsManager.whiteColor, fontSize: 18),
                        ))
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  forgetPassword() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.end,
      children: [
        TextButton(
            onPressed: () {},
            child: Text(
              "Forget Password?",
              style: TextStyle(color: ColorsManager.grayColor, fontSize: 12),
            )),
      ],
    );
  }

  emailTextField() {
    return Cutomtextformfield(
      controller: emailController,
      hintText: "Email Address",
      validator: (email) {
        if (email == null || email.trim().isEmpty) {
          return "Plz ,enter your email ";
        }
      },
    );
  }

  userNameTextField() {
    return Cutomtextformfield(
      controller: userNameController,
      hintText: "User Name",
      validator: (name) {
        if (name == null || name.trim().isEmpty) {
          return "Plz ,enter your Name ";
        }
      },
    );
  }

  PhoneTextField() {
    return Cutomtextformfield(
      controller: phoneController,
      hintText: "Phone number",
      validator: (phone) {
        if (phone == null || phone.trim().isEmpty) {
          return "Plz ,enter your phone number ";
        } else if (phone.length < 11) {
          return "your phone number is wrong";
        }
      },
    );
  }

  passwordTextField() {
    return Cutomtextformfield(
      isSecure: true,
      controller: passwordController,
      hintText: "Password",
      validator: (password) {
        if (password == null || password.trim().isEmpty) {
          return "Plz ,enter your Password ";
        } else if (password.length < 8) {
          return "your password must be more than 8 chars";
        }
      },
    );
  }

  confermPasswordTextField() {
    return Cutomtextformfield(
      isSecure: true,
      controller: confirmPasswordController,
      hintText: "Confirm Password",
    );
  }
}
