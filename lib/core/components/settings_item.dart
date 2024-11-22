import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'package:todo/core/my_text_styles.dart';
import 'package:todo/provider/theme_provider.dart';

import '../colors_manager.dart';

class SettingsItem extends StatefulWidget {
String? text;
List<String> options=[];

SettingsItem({required this.text,required this.options});

  @override
  State<SettingsItem> createState() => _SettingsItemState();
}

class _SettingsItemState extends State<SettingsItem> {
  @override
  Widget build(BuildContext context) {
    var provider = Provider.of<ThemeProvider>(context);

    return Container(
      padding: EdgeInsets.symmetric(horizontal: 15,),
      margin: EdgeInsets.symmetric(vertical: 20,horizontal: 15),
      decoration: BoxDecoration(
        border: Border.all(width: 2,color: ColorsManager.blueColor),
        color: Theme.of(context).colorScheme.secondary,


      ),
      child: Row(
        children: [
          Text(widget.text??" ",style: LightMyAppTextStyles.languagechoice),
          Spacer(),
          DropdownButton<String>(
            dropdownColor: Theme.of(context).colorScheme.secondary,
            iconDisabledColor: ColorsManager.grayColor,
            style:LightMyAppTextStyles.settingsItemLable,
            elevation: 0,
              items: widget.options.map((String value){
            return DropdownMenuItem<String>(

              child: Text(value),value: value,);

          }).toList(), onChanged: (selectedItem){
              if(selectedItem=="Light")
                {
                  Provider.of<ThemeProvider>(context, listen: false).changeTheme(ThemeMode.light);

                }

              else if(selectedItem=="Dark")
                Provider.of<ThemeProvider>(context, listen: false).changeTheme(ThemeMode.dark);

              widget.text=selectedItem;
              print(selectedItem);
           setState(() {

           });
          })

        ],

      ),
    )
    ;
  }
}
