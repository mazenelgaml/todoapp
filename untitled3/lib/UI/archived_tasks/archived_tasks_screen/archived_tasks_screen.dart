import 'package:flutter/material.dart';

class ArchivedTasksScreen extends StatelessWidget {
  const ArchivedTasksScreen({Key?key});

  @override
  Widget build(BuildContext context) {
    return Center(child: Text("Archived Tasks",style: TextStyle(color: Colors.black,fontSize: 20,fontWeight: FontWeight.bold),));
  }
}