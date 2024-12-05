import 'package:flutter/material.dart';

class NewTasksScreen extends StatelessWidget {
  const NewTasksScreen({Key?key});

  @override
  Widget build(BuildContext context) {
    return Center(child: Text("New Tasks",style: TextStyle(color: Colors.black,fontSize: 20,fontWeight: FontWeight.bold),));
  }
}