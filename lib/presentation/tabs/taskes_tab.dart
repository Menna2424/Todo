import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:easy_date_timeline/easy_date_timeline.dart';
import 'package:flutter/material.dart';
import 'package:todo/core/colors_manager.dart';
import 'package:todo/core/utils/firebase_manager/models/todo_dm.dart';

import '../../core/components/task_item.dart';

class TaskesTab extends StatefulWidget {
  TaskesTab({super.key});

  @override
  State<TaskesTab> createState() => TaskesTabState();
}

class TaskesTabState extends State<TaskesTab> {
  List<TodoDM> todos = [];

  DateTime calenderSelecteddate=DateTime.now();
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    readTaskItemFromFirebase();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        EasyDateTimeLine(
          // headerProps: EasyHeaderProps(
          //   showHeader: false,
          // ),
          initialDate: DateTime.now(),
          
//estani ehna lsa msh 3arfen hyzbot walla l2=>okay w mt2olesh shokran!=>haddeer h
        //yes bs mkontsh a3raf enha blshola de ana 3omri m eshtghlt 3la physical device asln f ,m
          onDateChange: (selectedDate) {
            //btraga3ly el youm elly ana dost 3leh
            //handahelread function hena
            print(selectedDate);
            calenderSelecteddate=selectedDate;

            readTaskItemFromFirebase();
          },

          headerProps: EasyHeaderProps(
            monthPickerType: MonthPickerType.dropDown,
            dateFormatter: DateFormatter.fullDateDMY(),
          ),
          dayProps: EasyDayProps(
              height: 79,
              width: 42,
              dayStructure: DayStructure.dayStrDayNum,
              activeDayStyle: DayStyle(
                  dayStrStyle: TextStyle(
                    fontSize: 15,
                    color: ColorsManager.whiteColor,
                  ),
                  dayNumStyle: TextStyle(
                    fontSize: 15,
                    color: ColorsManager.whiteColor,
                  ),
                  decoration: BoxDecoration(
                      border: Border.all(color: ColorsManager.blueColor),
                      borderRadius: BorderRadius.all(Radius.circular(10)),
                      gradient: LinearGradient(
                          begin: Alignment.topCenter,
                          end: Alignment.bottomCenter,
                          colors: [
                            // Color(0xff3371ff),
                            //     Color(0xff8426d6)
                            ColorsManager.blueColor,
                            ColorsManager.bottleGreen
                          ])
                      // color: Colors.white,
                      )),
              inactiveDayStyle: DayStyle(
                  decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(10)),
                  dayNumStyle: TextStyle(
                    fontSize: 15,
                    color: Colors.black,
                  ),
                  dayStrStyle: TextStyle(
                    fontSize: 15,
                    color: Colors.black,
                  ))),
        ),
        SizedBox(
          height: 30,
        ),
        Expanded(
          flex: 70,
          child: ListView.builder(
            itemBuilder: (context, index) => Column(children: [TaskItem(
              todo: todos[index],
              tasksTabKey: widget.key as GlobalKey<TaskesTabState>,
            ),
             SizedBox(height: 20,),

            ],),
            itemCount: todos.length,
          ),
        )
        //TaskItem(),
      ],
    );
  }

  readTaskItemFromFirebase() async {
    CollectionReference taskCollection =
        FirebaseFirestore.instance.collection(TodoDM.collectionName);
    QuerySnapshot querySnapshots = await taskCollection.get();
    List<QueryDocumentSnapshot> documents = querySnapshots.docs;
    todos = documents.map((docSnapshot) {
      Map<String, dynamic> json = docSnapshot.data() as Map<String, dynamic>;
      TodoDM todo = TodoDM.fromJson(json);
      return todo;
    }).toList();

  todos =  todos.where((todo)=>todo.time?.day==calenderSelecteddate.day&&todo.time?.month==calenderSelecteddate.month&& todo.time?.year == calenderSelecteddate.year).toList();

    setState(() {});
  }
}
