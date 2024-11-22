import 'package:flutter/material.dart';
import 'package:todo/core/colors_manager.dart';
import 'package:todo/presentation/tabs/settings_tab.dart';
import 'package:todo/presentation/tabs/taskes_tab.dart';

import 'add_task/add_task.dart';

class HomeScreen extends StatefulWidget {
  HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  GlobalKey<TaskesTabState> tasksTabKey=GlobalKey();
  int selectedIndex = 0;
String appBarTitle = 'To Do List ';
  List<Widget>  tabs = [];
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    tabs = [
      TaskesTab(
        key: tasksTabKey,

      ),
      SettingsTab(),
    ];
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBody: true,
      appBar: AppBar(
        toolbarHeight: 100,
        title: Text(appBarTitle),
      ),
      floatingActionButton:buildFAP(),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      bottomNavigationBar:

      buildBottomNav(),

      body: tabs[selectedIndex],
    );
  }
  buildBottomNav() {

    return  BottomAppBar(

      notchMargin: 8,
      child:


      BottomNavigationBar(
          currentIndex: selectedIndex,
          onTap: (value) {
            selectedIndex = value;
            if(value==0){
              appBarTitle="To Do List ";

            }else
              appBarTitle="Settings";
            setState(() {});
          },
          items: [
            BottomNavigationBarItem(
              icon: Icon(
                Icons.menu,
                size: 22,
              ),
              label: "Tasks",
            ),
            BottomNavigationBarItem(
                icon: Icon(
                  Icons.settings_outlined,
                  size: 22,
                ),
                label: "settings")
          ]),
    );
  }

  buildFAP() {

    return  FloatingActionButton(
      onPressed: () async{
        
         await AddTask.show(context);
         tasksTabKey.currentState?.readTaskItemFromFirebase();
        
      },
      backgroundColor: ColorsManager.blueColor ,
      child: Icon(
        Icons.add,
        color: Colors.white,
      ),
    );
  }
}
