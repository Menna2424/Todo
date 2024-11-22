




import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:todo/config/theme.dart';
import 'package:todo/core/routes_manager.dart';

import '../provider/theme_provider.dart';

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    var provider =Provider.of<ThemeProvider>(context);
    return MaterialApp(
debugShowCheckedModeBanner: false ,
      onGenerateRoute: RoutesManager.router,
      initialRoute: RoutesManager.splashScreen,
      theme: MyTheme.light,
      darkTheme: MyTheme.dark,
      themeMode: provider.currentTheme,
    );
  }
}
