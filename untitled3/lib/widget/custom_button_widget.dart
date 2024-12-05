import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class Button extends StatelessWidget {
  const Button({Key?key, required this.onpressed, required this.text });
final void Function()  onpressed;
final String text;
  @override
  Widget build(BuildContext context) {
    return Container(height: 60,width: 300,child:
    ElevatedButton(style: ElevatedButton.styleFrom(
        shape: RoundedRectangleBorder
      (borderRadius: BorderRadius.circular(20)),
        padding: EdgeInsets.all(20),
        primary: Color(0xFF8a81d2)),
        onPressed: onpressed, child: Text("${text}"
          ,style: TextStyle(color: Colors.white,
              fontWeight: FontWeight.w700,fontSize: 18),)));
  }
}
