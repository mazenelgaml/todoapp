import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:untitled3/UI/auth/signUP/sign_up_screen/signup_screen.dart';
import 'package:untitled3/UI/home/home_screen/home_screen.dart';
import 'package:untitled3/UI/welcome/welcome_controller/welcome_controller.dart';
import 'package:untitled3/sevices/todo_services.dart';
import 'package:untitled3/widget/custom_button_widget.dart';
import 'package:untitled3/UI/auth/log_in/log_in_screen/login_screen.dart';

class welcomScreen extends StatefulWidget {
  const welcomScreen({Key?key});
   Welcomes()  {
    final SharedPreferences prefs =  SharedPreferences.getInstance() as SharedPreferences;
    bool? checker = prefs.containsKey("uid");
    if(checker){
      Get.off(()=> HomeScreen());
    }}
  @override
  State<welcomScreen> createState() => _welcomScreenState();
}

class _welcomScreenState extends State<welcomScreen> {
  @override
  Widget build(BuildContext context) {
    return GetBuilder<WelcomeController>(
        init: WelcomeController(),
    builder: (WelcomeController controller) {
    return Scaffold(
        body: Container(

          height: Get.height,
          width: Get.width,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [Center(child: Image(image:AssetImage("assets/images/welcome-center.png"),height: 450,)),
              SizedBox(height: 50,),
              Column(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  Button(onpressed: (){ Get.to(()=>SignUp());


                  }, text: "REGISTER"),
                  SizedBox(height: 30,),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text("Have an account ?",style: TextStyle(color: Colors.grey,fontWeight: FontWeight.bold,fontSize: 17),),
                      TextButton(onPressed: (){
                        ToDoServices().fetchData();

                        Get.to(()=>Login());


                      },
    child: Text("SIGN IN",style: TextStyle(decoration: TextDecoration.underline,fontWeight: FontWeight.w900,fontSize: 17,color: Color(0xFFa2b7f1)),)),
                    ],
                  )  ],
              ),],
          ),
        ) // This trailing comma makes auto-formatting nicer for build methods.

    );
    });}

}