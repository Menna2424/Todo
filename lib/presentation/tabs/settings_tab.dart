


import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:todo/provider/theme_provider.dart';


import '../../core/components/settings_item.dart';
import '../../core/my_text_styles.dart';

class SettingsTab extends StatelessWidget {
  const SettingsTab({super.key});

  @override
  Widget build(BuildContext context) {
    var provider = Provider.of<ThemeProvider>(context);
    return Padding(
      padding: const EdgeInsets.all(30.0),
      child: Column(

        crossAxisAlignment: CrossAxisAlignment.start,
        children: [

          textItemLable("Language",context,provider),
          SettingsItem(text: "English",options: ["English",'Arabic'],),
          textItemLable("Model",context,provider),
          SettingsItem(text: "Light",options: ["Light","Dark"],),
        ],
      ),
    );

  }

  textItemLable(String lable,context,ThemeProvider provider){

    return Text(lable, style: provider.currentTheme==ThemeMode.light? LightMyAppTextStyles.settingsItemLable:DarkMyAppTextStyles.settingsItemLable);

  }



}
