import 'package:flutter/material.dart';
import 'package:flutter_slidable/flutter_slidable.dart';
import 'package:todo/config/theme.dart';
import 'package:todo/core/colors_manager.dart';
import 'package:todo/core/routes_manager.dart';
import 'package:todo/core/utils/firebase_manager/models/todo_dm.dart';

import '../../presentation/edit_screen.dart';
import '../../presentation/tabs/taskes_tab.dart';
import '../my_text_styles.dart';

class TaskItem extends StatefulWidget {
   TaskItem({super.key,required this.todo,required this.tasksTabKey});
late TodoDM todo ;
   GlobalKey<TaskesTabState> tasksTabKey;

  @override
  State<TaskItem> createState() => _TaskItemState();
}

class _TaskItemState extends State<TaskItem> {
  @override
  Widget build(BuildContext context) {
    return Stack(
      alignment: Alignment.center,
      children: [
        Row(
          children: [
            Expanded(
              child: Container(
                decoration: BoxDecoration(
                    color: Colors.red,

                    borderRadius: BorderRadius.circular(15)
                ),
                height: 105,
              ),
            ),
            Expanded(
              child: Container(
                height: 105,
                width: 200,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(15),

                  color: ColorsManager.darkedit,

                ),
              ),
            ),
          ],
        ),
        Slidable(
          startActionPane: ActionPane(
              motion: DrawerMotion(),
              // dismissible: DismissiblePane(onDismissed: () {}),
              extentRatio: 0.2,
              children: [
                SlidableAction(
                  onPressed: (_) {},
                  backgroundColor: Colors.red,
                  icon: Icons.delete,
                  label: "Delete",

                )
              ]),
          endActionPane:
              ActionPane(motion: DrawerMotion(), extentRatio: 0.2, children: [
            SlidableAction(
              onPressed: (_) {
                EditScreen.showEditSheet(context,widget.todo,widget.tasksTabKey);
               // Navigator.pushReplacementNamed(context, RoutesManager.editScreen);

              },
              icon: Icons.edit,
              label: "Edit",
              backgroundColor: ColorsManager.darkedit,
              borderRadius: BorderRadius.circular(15),
              spacing: 10,
              flex: 2,
            )
          ]),
          child: Container(
            decoration: BoxDecoration(
              gradient: LinearGradient(colors: [ColorsManager.blueColor,ColorsManager.bottleGreen],
              begin: Alignment.centerLeft,
                end: Alignment.centerRight
              ),
                color: Colors.red, borderRadius: BorderRadius.circular(15)),
            // margin: EdgeInsets.all(15),

            child: Row(
              children: [
                Padding(
                  padding: const EdgeInsets.all(20.0),
                  child: SizedBox(
                    height: 65,
                    child: VerticalDivider(
                      width: 4,
                      color: ColorsManager.whiteColor,
                      thickness: 5,
                      indent: 5,
                      endIndent: 5,
                    ),
                  ),
                ),
                Column(
                  children: [
                    Text(widget.todo.taskTitle??"",
                        style: LightMyAppTextStyles.taskTitleStyle,),
                    SizedBox(
                      height: 12,
                    ),
                    Text(widget.todo.taskDescription??"",
                      style: LightMyAppTextStyles.taskTitleStyle,),
                    SizedBox(
                      height: 12,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        Icon(
                          Icons.alarm_outlined,
                          color: Colors.grey,
                        ),
                        SizedBox(
                          width: 5,
                        ),
                        Row(
                          children: [
                            Text(
                              "10:30",
                              style: LightMyAppTextStyles.lightTimeText,
                            ),
                            SizedBox(
                              width: 2,
                            ),
                            Text(
                              "AM",
                              style:LightMyAppTextStyles.lightTimeText,
                            ),
                          ],
                        ),
                      ],
                    )
                  ],
                ),
                Spacer(),
                Padding(
                  padding: const EdgeInsets.all(10.0),
                  child: InkWell(
                    onTap: () {
                      setState(() {
                        widget.todo.isDone=!widget.todo.isDone;

                      });
                    },
                    child: Container(
                        padding:
                            EdgeInsets.symmetric(horizontal: 13, vertical: 2),
                        decoration: BoxDecoration(
                          color: Theme.of(context).primaryColor,
                          borderRadius: BorderRadius.circular(10),
                        ),
                        child:widget.todo.isDone? Icon(Icons.check, size: 30):Text("DONE!",style: TextStyle(color: ColorsManager.whiteColor),)),
                  ),
                )
              ],
            ),
          ),
        ),
      ],
    );
  }
}
