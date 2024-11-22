import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:todo/core/utils/formatted_date_extention.dart';
import 'package:todo/presentation/tabs/taskes_tab.dart';

import '../core/colors_manager.dart';
import '../core/components/cutomTextFormField.dart';
import '../core/my_text_styles.dart';
import '../core/utils/firebase_manager/models/todo_dm.dart';

class EditScreen extends StatefulWidget {
   TodoDM todo ;
   GlobalKey<TaskesTabState> tasksTabKey;

   EditScreen({super.key,required this.todo,required this.tasksTabKey});

  @override
  State<EditScreen> createState() => _EditScreenState();
  static Future showEditSheet(BuildContext context,TodoDM todo,GlobalKey<TaskesTabState> tasksTabKey) {
    return showDialog(

      context: context,
      builder: (context) =>Dialog(
        shape: RoundedRectangleBorder(

          borderRadius: BorderRadius.circular(15),
        ),child: Padding(padding: EdgeInsets.all(10),
      child: EditScreen(todo: todo,tasksTabKey: tasksTabKey, ),
      ),

      ),
    );
  }
}

class _EditScreenState extends State<EditScreen> {
  //late TodoDM


  DateTime userDate = DateTime.now();
  TextEditingController titleController = TextEditingController();
  TextEditingController descController = TextEditingController();


  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    titleController.text = widget.todo.taskTitle ?? "";
    descController.text = widget.todo.taskDescription ?? "";
    userDate =widget.todo.time ?? DateTime.now();
    //tasksTabKey.currentState?.readTaskItemFromFirebase();
  }
  @override
  Widget build(BuildContext context) {

    return Container(
      height:MediaQuery.of(context).size.height*0.5,

      padding: EdgeInsets.all(20),
      child: Form(
        //key: formKey,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            addTaskText("Edit Task"),
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
                onPressed: ()async {
                 await updateTaskInFirebase(widget.todo.id);
                 if (mounted) {
                   widget.tasksTabKey.currentState?.readTaskItemFromFirebase();
                 }
                 //readFunc
                  print("uppdaaateeeeddddd");
                  // addTodoToFireStore();
                },
                style: ElevatedButton.styleFrom(
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(20))),
                child: Text(
                  textAlign: TextAlign.center,
                  "Edit task",
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


  // Future<void> updateTaskInFirebase(String? id) async {
  //   try {
  //     CollectionReference taskCollection = FirebaseFirestore.instance.collection(TodoDM.collectionName);
  //
  //     await taskCollection.doc(id).update({
  //       "taskTitle": titleController.text,
  //       "taskDescription": descController.text,
  //       "time": userDate,
  //     });
  //
  //     Navigator.pop(context); // Close the dialog after successful update
  //   } catch (e) {
  //     print("Failed to update task: $e");
  //   }
  // }


  Future<void> updateTaskInFirebase(id)async {

   CollectionReference taskCollection=FirebaseFirestore.instance.collection(TodoDM.collectionName);
await taskCollection.doc(id).update({
"taskTitle":titleController.text,
 // "taskDescription":descController.text,
  "description":descController.text,
  "time":userDate,
}).then((_){}).timeout( Duration(milliseconds: 500), onTimeout: () async {
 // widget.tasksTabKey.currentState?.readTaskItemFromFirebase();
  Navigator.pop(context);
 // await tasksTabKey.currentState?.readTaskItemFromFirebase();


  print("reaaaded");
},).catchError((e){
  print("Faild to update task : $e ");
});
setState(() {

});
   DocumentSnapshot updatedTask = await taskCollection.doc(id).get();
   print("Edited task: ${updatedTask.data()}");
print("edited task : ${taskCollection.doc(id)} ");
  }

}
