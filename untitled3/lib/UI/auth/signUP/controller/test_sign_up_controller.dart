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
  TextEditingController confirm_password_controller = new TextEditingController();
  final GlobalKey<FormState> formkey = GlobalKey<FormState>();
  @override
  void onInit(){
    super.onInit();
    ToDoServices().fetchData();

  }
  onChanged(String? val){
    formkey.currentState?.validate();
  }
  String? passwordValidator (String? value){
    print(value);
    if(value!.isEmpty){
      return "Please Enter your Password";
    }else if(!RegExp(r'^(?=.*?[A-Z])(?=.*?[a-z])(?=.*?[0-9])(?=.*?[!@#\$&*~]).{8,}$').hasMatch(value))
    {
      return "Please Enter a Valid password";
    }
    return null;
  }
 String? confirmValidator (String? val){
  if(val!.isEmpty)
  return 'Empty';
  if(val != password_controller.text)
  return 'Not Match';
  return null;
  }
  String? emailValidator (String? value){
    print(value);
    if(value!.isEmpty){
      return "Please Enter your Email";
    }else if(!RegExp(r'\S+@\S+\.\S+').hasMatch(value))
    {
      return "Please Enter a Valid Email";
    }
    return null;
  }

  String? phoneNumberValidator (String? value)
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
    String phoneNumber=phoneNumber_controller.text;
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
    confirm_password_controller.dispose();
  }
}