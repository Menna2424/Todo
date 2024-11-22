import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:todo/provider/theme_provider.dart';
import 'package:todo/src/my_app.dart';




void main()async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: FirebaseOptions(apiKey: "AIzaSyCgWBDsZ_Po3BL-f4bLH6j5RCyeCCv7ZSE", appId: "com.example.todo", messagingSenderId: "", projectId: "to-do-app-49295"),
  );
await FirebaseFirestore.instance.disableNetwork();
  runApp( ChangeNotifierProvider(create:(context) => ThemeProvider(),child: MyApp(),)  );
}

