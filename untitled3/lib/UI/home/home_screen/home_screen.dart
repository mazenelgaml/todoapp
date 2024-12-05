
 import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_state_manager/src/simple/get_state.dart';
import 'package:untitled3/UI/home/home_controller/home_controller.dart';
 import 'package:loading_animation_widget/loading_animation_widget.dart';
import '../../../models/todo_cell_model.dart';

class HomeScreen extends StatelessWidget {
    HomeScreen({Key?key});
  final int currentIndex=0;


  @override
  Widget build(BuildContext context) {
    return GetBuilder<HomeController>(
        init: HomeController(),
    builder: (HomeController controller) {
          return Scaffold(
      appBar: AppBar(
        backgroundColor: Color(0xFFa2b7f1),
        title: Text("Tasks"),
      ),

      floatingActionButton: FloatingActionButton(backgroundColor: Color(0xFFa2b7f1),
        onPressed: (){controller.displayBottomSheet(context);},child: Icon(Icons.add),),
      body:controller.isLoading?Container(
        decoration: BoxDecoration(color: Colors.white),
        height: double.infinity,
        width: double.infinity,
        child: Expanded(
          child:ListView.builder(
            itemCount: controller.todos.length,
            itemBuilder: (context, index) {
              return Card(
                elevation: 5,
                margin: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
                child: ListTile(
                  title: Text(
                    controller.todos[index].toDoTitle??"",
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  subtitle: Text(controller.todos[index].toDoText??""),
                  trailing: IconButton(
                    icon: Icon(Icons.remove),
                    onPressed: () => controller.removeTodo(index),
                  ),
                ),
              );
            },
          ),

        ),
      ):Center(
        child: LoadingAnimationWidget.twistingDots(
          leftDotColor: const Color(0xFFe9d9e9),
          rightDotColor: const Color(0xFF8a81d2),
          size: 200,
        ),
      ),

      bottomNavigationBar: BottomNavigationBar(
        currentIndex:currentIndex,
        onTap: (index)
        {

        },
        backgroundColor: Color(0xFFa2b7f1),
        items: [
          BottomNavigationBarItem(icon: Icon(Icons.menu,color: Colors.white,),
          label: "Tasks"),
          BottomNavigationBarItem(icon: Icon(Icons.check_circle_outline_outlined,color: Colors.white),
              label: "Done"),
          BottomNavigationBarItem(icon: Icon(Icons.archive_outlined,color: Colors.white),
              label: "Archive"),
        ],)

    );
    });}

}
