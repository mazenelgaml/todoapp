import 'package:flutter/material.dart';

class DoneTasksScreen extends StatelessWidget {
  const DoneTasksScreen({Key?key});

  @override
  Widget build(BuildContext context) {
    return Center(child: Text("Done Tasks",style: TextStyle(color: Colors.black,fontSize: 20,fontWeight: FontWeight.bold),));
  }
}