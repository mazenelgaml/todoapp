import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:untitled3/sevices/todo_services.dart';
import 'package:untitled3/sevices/user_auth/firebase_auth_implementation/firebase_auth_services.dart';

import '../../../home/home_screen/home_screen.dart';

class SignUpController extends GetxController{
  final FirebaseAuthServices auth=FirebaseAuthServices();
  TextEditingController email_controller = new TextEditingController();
  TextEditingController password_controller = new TextEditingController();
  TextEditingController phoneNumber_controller = new TextEditingController();
  TextEditingController userName_controller = new TextEditingController();
  final RegExp nameRegExp = RegExp(r"^[a-zA-Z]+$");
  final GlobalKey<FormState> formkey = GlobalKey<FormState>();
   @override
   void onInit(){
     super.onInit();
     ToDoServices().fetchData();

   }
  onChanged(val){
    formkey.currentState?.validate();
  }
  String? userNmeValidator (value){
    print(value);
    if(value!.isEmpty){
      return "Please Enter username";
    }else if(!RegExp(r'^[a-zA-Z0-9](_(?!(\.|_))|\.(?!(_|\.))|[a-zA-Z0-9]){4,18}[a-zA-Z0-9]$').hasMatch(value))
    {
      return "Please Enter a Valid username";
    }
    return null;
  }
  String? emailValidator (value){
    print(value);
    if(value!.isEmpty){
      return "Please Enter your Email";
    }else if(!RegExp(r'\S+@\S+\.\S+').hasMatch(value))
    {
      return "Please Enter a Valid Email";
    }
    return null;
  }
  String? nameValidator(value)=>value!.isEmpty
      ? 'Please Enter Your Name'
      : (nameRegExp.hasMatch(value)
      ? null
      : 'Enter a Valid Name');

  String? phoneNumberValidator (value)
  {
    String patttern = r'(^(?:[+0]9)?[0-9]{10,12}$)';
    RegExp regExp = new RegExp(patttern);
    if (value!.length == 0) {
      return 'Please enter mobile number';
    }
    else if (!regExp.hasMatch(value)) {
      return 'Please enter valid mobile number';
    }
    return null;
  }


  void signUp()async
  {
    String userName=userName_controller.text;
    String email=email_controller.text;
    String password=password_controller.text;
    User? user= await auth.signUpwithEmailAndPassword(email, password);
    if(formkey.currentState!.validate())
    {
    if (user!= null )
    {
      print("user is successfully created");
      Get.to(()=>HomeScreen());
    }else
    {
      print("some error happened");
    }
  }}
  @override
  void dispose()
  {
    super.dispose();
    email_controller.dispose();
    password_controller.dispose();
    phoneNumber_controller.dispose();
    userName_controller.dispose();
  }
}