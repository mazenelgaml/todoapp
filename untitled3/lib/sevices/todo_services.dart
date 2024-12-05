import 'dart:convert';

import 'package:firebase_database/firebase_database.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:untitled3/models/todo_cell_model.dart';


class ToDoServices {

  final DatabaseReference _toDoRef =
  FirebaseDatabase.instance.ref().child('ToDo');
  Future<void> saveToDo(ToDoCellModel toDo) async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();

    final String? userId = prefs.getString('uid');
    _toDoRef.child(userId??"").push().set(toDo.toJson());
  }
  Future<List<ToDoCellModel>> fetchData() async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    final String? userId = prefs.getString('uid');

    final snapshot   = await _toDoRef.child(userId??"").get();

    print(snapshot.value); // to debug and see if data is returned

    List<ToDoCellModel> todos = [];

    final Map<dynamic, dynamic>  map = snapshot.value as Map<dynamic, dynamic>;
    map.forEach((key, value) {
      final todo = ToDoCellModel.fromMap(value);

      todos.add(todo);
    });

    return todos;
  }  }



