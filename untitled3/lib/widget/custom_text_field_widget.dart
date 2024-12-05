import 'package:flutter/material.dart';

class CustomTextFieldWidget extends StatelessWidget {
  const CustomTextFieldWidget({Key? key, required this.controller, required this.onChange, required this.validator, required this.keyboardType, required this.isPassField, required this.textFieldIcon, required this.textFieldTitle}) : super(key: key);
  final TextEditingController controller;
  final Function(String) onChange;
  final String?Function(String?) validator;
  final TextInputType keyboardType;
  final bool isPassField;
  final Icon textFieldIcon;
  final String textFieldTitle;


  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(right: 35,left: 35,bottom: 20,top: 5),
      child: TextFormField(
        controller: controller,
        onChanged: onChange,
        validator: validator,
        keyboardType: keyboardType,
        obscureText: isPassField,
        textAlign: TextAlign.center,
        decoration: InputDecoration(
          focusedBorder:OutlineInputBorder(
              borderRadius: BorderRadius.circular(20),borderSide:
          BorderSide(color:Color(0xFFe9d9e9),width: 3 ))
          ,hoverColor: Colors.white,fillColor: Colors.white,
          border: OutlineInputBorder(borderRadius: BorderRadius.circular(20),borderSide:
          BorderSide(color: Colors.grey)),
            enabledBorder: OutlineInputBorder(borderRadius: BorderRadius.circular(20),borderSide: BorderSide(color: Colors.grey)),
            suffixIcon:textFieldIcon ,
            hintText: textFieldTitle,
            hintStyle: TextStyle(fontSize: 18,color: Colors.grey,)),),
    );
  }
}
