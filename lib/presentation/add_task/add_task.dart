import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:todo/core/colors_manager.dart';
import 'package:todo/core/my_text_styles.dart';
import 'package:todo/core/utils/firebase_manager/models/todo_dm.dart';
import 'package:todo/core/utils/formatted_date_extention.dart';

import '../../core/components/cutomTextFormField.dart';

class AddTask extends StatefulWidget {
  AddTask({super.key});

  @override
  State<AddTask> createState() => _AddTaskState();

  static Future show(BuildContext context) {
    return showModalBottomSheet(
      isScrollControlled: true,
      context: context,
      builder: (context) =>
      // Padding(
      // padding: MediaQuery.of(context).viewInsets,
      // child:

      Padding(
        padding: MediaQuery
            .of(context)
            .viewInsets,
        child: AddTask(),
      ),
      // ),
    );
  }
}

class _AddTaskState extends State<AddTask> {
  DateTime userDate = DateTime.now();
  TextEditingController titleController = TextEditingController();
  TextEditingController descController = TextEditingController();
  var formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Container(
      height:MediaQuery.of(context).size.height*0.45,

      padding: EdgeInsets.all(20),
      child: Form(
        key: formKey,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            addTaskText("Add new Task"),
            SizedBox(
              height: 10,
            ),
            Cutomtextformfield(
              hintText: "enter your task",
              controller: titleController,
              validator: (title) {
                if (title == null || title.trim().isEmpty) {
                  return "Plz,Enter the task title";
                }
              },
            ),
            SizedBox(
              height: 10,
            ),
            Cutomtextformfield(
                hintText: "enter task description",
                controller: descController,
                validator: (value) {
                  if (value == null || value.trim().isEmpty) {
                    return "Plz,Enter description";
                  }
                }),
            SizedBox(
              height: 10,
            ),
            SelectTimeText("Select time "),
            SizedBox(
              height: 10,
            ),
            InkWell(
                onTap: () {
                  showMyDatePicker(context);
                },
                child: Text(
                  userDate.dateFormatted(),
                  textAlign: TextAlign.center,
                )),
            Spacer(),
            ElevatedButton(
                onPressed: () {
                  addTodoToFireStore();
                },
                style: ElevatedButton.styleFrom(
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(20))),
                child: Text(
                  textAlign: TextAlign.center,
                  "Add task",
                  style:
                      TextStyle(color: ColorsManager.whiteColor, fontSize: 15),
                ))
          ],
        ),
      ),
    );
  }

  addTaskText(String text) {
    return Text(
      text,
      style: LightMyAppTextStyles.addTaskTitle,
      textAlign: TextAlign.center,
    );
  }

  SelectTimeText(String s) {
    return Text(s, style: LightMyAppTextStyles.SelectTimeText);
  }

  void showMyDatePicker(BuildContext context) async {
    userDate = await showDatePicker(
            // barrierColor: ColorsManager.blueColor,
            builder: (context, Widget? child) {
              return Theme(
                  data: Theme.of(context).copyWith(
                      colorScheme: Theme.of(context).colorScheme.copyWith(
                            primary: ColorsManager.blueColor,
                            // onPrimary: ColorsManager.blueColor,
                            onSurface: ColorsManager.blueColor,
                          )),
                  child: child!);
            },
            context: context,
            firstDate: DateTime.now(),
            lastDate: DateTime.now().add(Duration(days: 365)),
            initialDate: DateTime.now()) ??
        userDate;

    setState(() {});
  }

  descValidator(String value) {
    if (value == null || value.trim().isEmpty) {
      return "Plz,Enter description";
    }
  }

  void addTodoToFireStore() {
    if (formKey.currentState?.validate() == false) return;
    CollectionReference<Map<String, dynamic>> todocollection =
        FirebaseFirestore.instance.collection(TodoDM.collectionName);
    DocumentReference document = todocollection.doc();
    TodoDM todo = TodoDM(
        id: document.id,
        taskTitle: titleController.text,
        taskDescription: descController.text,
        time: userDate,
        isDone: false);

    document
        .set(todo.toJson())
        .then((_) {})
        .onError((error, stackTrace) {})
        .timeout(Duration(milliseconds: 500),onTimeout:() {
         if(mounted) Navigator.pop(context);
        }, );
print("hiiiii");
    // todocollection.
  }
}
