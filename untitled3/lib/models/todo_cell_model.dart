import 'package:firebase_database/firebase_database.dart';

class ToDoCellModel{
  final String? toDoTitle;
  final String? toDoText;

  ToDoCellModel({ this.toDoTitle,  this.toDoText, });

  factory ToDoCellModel.fromMap(Map<dynamic, dynamic> map) {
    return ToDoCellModel(
      toDoTitle: map['toDoTitle'] ?? '',
      toDoText: map['toDoText'] ?? '',

    );
  }
  Map<String,dynamic> toJson()=>{
    "toDoTitle":toDoTitle,
    "toDoText":toDoText,

};
}