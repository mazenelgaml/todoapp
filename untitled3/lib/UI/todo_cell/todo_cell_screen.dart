import 'package:flutter/material.dart';

class TodoCellScreen extends StatelessWidget {
  const TodoCellScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(body:Container(
      child: Column(mainAxisAlignment: MainAxisAlignment.spaceAround,children: [Center(child: Padding(
        padding: const EdgeInsets.all(15.0),
        child: TextFormField( decoration: InputDecoration(
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
      Container(
        height: 100,
        child: TextFormField( decoration: InputDecoration(
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
     ],),
    ));
  }
}
