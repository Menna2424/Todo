import 'package:cloud_firestore/cloud_firestore.dart';

class TodoDM{
  static const collectionName ="ToDo";
    String? id ;
    String? taskTitle;
   String? taskDescription;
   DateTime? time ;
   bool isDone=false ;

  TodoDM({ required this.id, required this.taskTitle, required this.taskDescription,required this.time,required this.isDone});

  Map<String,dynamic>toJson()=>{
    "id":id,
    "title":taskTitle,
    "description":taskDescription,
    "time":time,
    "isDone":isDone,

  };

  TodoDM.fromJson(Map<String,dynamic>json){

    id=json["id"];
    taskTitle=json["title"];
    taskDescription=json["description"];
    DateTime taskTime=json["time"].toDate();
    time=taskTime;
    isDone=json["isDone"];

  }

}