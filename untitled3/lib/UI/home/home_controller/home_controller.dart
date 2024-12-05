import 'package:get/get_state_manager/src/simple/get_controllers.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:untitled3/models/todo_cell_model.dart';
import 'package:untitled3/sevices/todo_services.dart';


class HomeController extends GetxController{


  final TextEditingController titleController = TextEditingController();
  final TextEditingController descriptionController = TextEditingController();
  List<ToDoCellModel> todos =<ToDoCellModel>[];
  final GlobalKey<FormState> formkey = GlobalKey<FormState>();

  bool isLoading = true;
  @override
   onInit()  {
    super.onInit();
    getTodos();


  }
   addTodo() async {
  String newTitle = titleController.text;
  String newDescription = descriptionController.text;

  if (newTitle.isNotEmpty && newDescription.isNotEmpty) {
  ToDoServices services = ToDoServices();
  await services.saveToDo(ToDoCellModel(toDoTitle: newTitle,toDoText: newDescription));

  todos= await services.fetchData();
  print(todos.length);
  update();
  titleController.clear();
  descriptionController.clear();
  }
  }
  getTodos() async {
    ToDoServices services = ToDoServices();

    todos= await services.fetchData();
    isLoading= false;
    update();
    print(todos.length);
    print(todos[0].toDoTitle??"");
  }

  Future<void> removeTodo(int index) async {
  todos.removeAt(index);
  final SharedPreferences prefs = await SharedPreferences.getInstance();

  }
  String? Validator (value){
    print(value);
    if(value!.isEmpty){
      return "Please Enter title";}
    else return null;}
    onChanged(val){
      formkey.currentState?.validate();
    }

  Future displayBottomSheet(BuildContext context){
    return showModalBottomSheet(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(25.0),
        ),
        backgroundColor: Colors.white,
        context: context, builder: (context)=>
        Container(
          width: Get.width,
          child: Column(
          crossAxisAlignment: CrossAxisAlignment.end,
            children: [Padding(
              padding: const EdgeInsets.all(8.0),
              child: InkWell(onTap: (){ Navigator.pop(context);}, child: const Icon(Icons.close,color: Colors.black,)),
            ),
              Container(
                decoration: BoxDecoration(border: Border.all(color: Colors.white ),
                    borderRadius: BorderRadius.circular(20.0)),
                child: Column(mainAxisAlignment: MainAxisAlignment.start,children: [Center(child: Padding(
                  padding: const EdgeInsets.only(left: 10.0,top: 55.0,bottom: 10.0,right: 10.0),
                  child: TextFormField(
                    onChanged:onChanged ,
                    validator:Validator ,
                      controller: titleController,
                      decoration: InputDecoration(
                          focusedBorder:OutlineInputBorder(
                              borderRadius: BorderRadius.circular(20),borderSide:
                          BorderSide(color:Color(0xFFe9d9e9),width: 3 ))
                          ,hoverColor: Colors.white,fillColor: Colors.white,
                          border: OutlineInputBorder(borderRadius: BorderRadius.circular(20),borderSide:
                          BorderSide(color: Colors.grey)),
                          enabledBorder: OutlineInputBorder(borderRadius: BorderRadius.circular(20),borderSide: BorderSide(color: Colors.grey)),
                          suffixIcon:Icon(Icons.title) ,
                          hintText: "Todo Title",
                          hintStyle: TextStyle(fontSize: 18,color: Colors.grey,))),

                ),),
                  SingleChildScrollView(
                    child: Padding(
                      padding: const EdgeInsets.only(left: 10.0,right: 10.0),
                      child: Container(
                        height: 100,
                        child: TextFormField(
                          onChanged: onChanged,
                          validator: Validator,
                            controller:descriptionController,
                            keyboardType: TextInputType.multiline,
                            maxLines: null,
                            decoration: InputDecoration(
                                focusedBorder:OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(20),borderSide:
                                BorderSide(color:Color(0xFFe9d9e9),width: 3 ))
                                ,hoverColor: Colors.white,fillColor: Colors.white,
                                border: OutlineInputBorder(borderRadius: BorderRadius.circular(20),borderSide:
                                BorderSide(color: Colors.grey)),
                                enabledBorder: OutlineInputBorder(borderRadius: BorderRadius.circular(20),borderSide: BorderSide(color: Colors.grey)),
                                hintText: "Todo Text",
                                hintStyle: TextStyle(fontSize: 18,color: Colors.grey,))),
                      ),
                    ),
                  ),
                  Container(height: 60,width: 150,
                    child: ElevatedButton(style: ElevatedButton.styleFrom(
    shape: RoundedRectangleBorder
    (borderRadius: BorderRadius.circular(20)),
    padding: EdgeInsets.all(20),
    primary: Color(0xFF8a81d2)),
                        onPressed: ()  { addTodo();
                        Navigator.pop(context);}, child: Text("ADD",style: TextStyle(fontWeight: FontWeight.bold,fontSize: 17),)),
                  )
                ],),
              ),
            ],
          ),
        ));
  }
  }
