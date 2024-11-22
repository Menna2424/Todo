

import 'package:flutter/material.dart';

class Logo extends StatelessWidget {
  const Logo({super.key});

  @override
  Widget build(BuildContext context) {
    return  Row(
      children: [
        Image(image: AssetImage("assets/logo2.png"),height: 50,width: 50,)
      ],
    );
  }
}
