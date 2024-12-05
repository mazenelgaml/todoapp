import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/rendering.dart';
import 'package:get/get.dart';
import 'package:get/get_state_manager/src/simple/get_state.dart';
import 'package:untitled3/UI/auth/log_in/controlle/log_in_controller.dart';
import 'package:untitled3/sevices/user_auth/firebase_auth_implementation/firebase_auth_services.dart';
import 'package:untitled3/widget/custom_text_field_widget.dart';
import 'package:flutter/material.dart';
import 'package:untitled3/widget/custom_button_widget.dart';

import '../../signUP/sign_up_screen/signup_screen.dart';
class Login extends StatelessWidget {

 const Login({Key?key});

  @override
  Widget build(BuildContext context) {
    return GetBuilder<SignInController>(
        init: SignInController(),
        builder: (SignInController controller) {
      return SafeArea(
        child: Scaffold(
            body: Container(
              height: double.infinity,
              width: double.infinity,
              decoration: BoxDecoration(
                  gradient: LinearGradient(
                    begin: Alignment.topCenter,
                    end: Alignment.bottomCenter,
                    colors: [
                      Color(0xFFe1c6e7),
                      Color(0xFF8a81d2)
                    ],
                  )
              ),
              child: SingleChildScrollView(
                padding: EdgeInsets.only(top: 60),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    ClipRRect(borderRadius: BorderRadius.circular(300.0),
                      child: Image(height: 120,
                        width: 120,
                        image: AssetImage("assets/images/p.jpg"),),),
                    SizedBox(height: 40,),
                    Container(width: 330, height: 440, decoration:
                    BoxDecoration(boxShadow: const [
                      BoxShadow(
                          color: Colors.grey,
                          offset: Offset(0, 0),
                          blurRadius: 10)
                    ],
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(20)),
                      child: Padding(
                        padding: const EdgeInsets.only(top: 50.0),
                        child: Form(
                          key: controller.formkey,
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.center,
                            mainAxisAlignment: MainAxisAlignment.spaceEvenly
                            ,
                            children: [const Padding(
                              padding: EdgeInsets.only(bottom: 15.0),
                              child: Text("Sign In", style: TextStyle(
                                  color: Color(0xFF877ecc),
                                  fontWeight: FontWeight.w900,
                                  fontSize: 27),),
                            ),
                              CustomTextFieldWidget(
                                controller: controller.email_controller,
                                onChange: controller.onChanged,
                                validator: controller.emailValidator,
                                keyboardType: TextInputType.emailAddress,
                                isPassField: false,
                                textFieldIcon: Icon(
                                  Icons.email_outlined, size: 35,),
                                textFieldTitle: 'Email Address',),
                              CustomTextFieldWidget(
                                  controller: controller.password_controller,
                                  onChange: controller.onChanged,
                                  validator: controller.passwordValidator,
                                  keyboardType: TextInputType.visiblePassword,
                                  isPassField: true,
                                  textFieldIcon: Icon(
                                    Icons.lock_outline_rounded, size: 35,),
                                  textFieldTitle: "Password"),
                              Button(onpressed: controller.signIn,
                                  text: "SIGN IN"),
                              Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Text("Don't have an account?",
                                    style: TextStyle(color: Colors.grey,
                                        fontWeight: FontWeight.bold),),
                                  TextButton(onPressed: () {
                                    Get.to(()=>SignUp());
                                  },
                                      child: Text("SIGN UP", style: TextStyle(
                                          color: Color(0xFFa2b7f1)),)),
                                ],
                              )

                            ],),
                        ),
                      ),)
                  ],
                ),
              ),

            )),
      );
    });
  }

}
