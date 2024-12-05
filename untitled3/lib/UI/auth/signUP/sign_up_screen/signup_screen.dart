
import 'package:flutter/cupertino.dart';
import 'package:flutter/rendering.dart';
import 'package:get/get.dart';
import 'package:get/get_state_manager/get_state_manager.dart';
import 'package:untitled3/UI/auth/signUP/controller/sign_up_controller.dart';
import 'package:untitled3/widget/custom_text_field_widget.dart';
import 'package:flutter/material.dart';
import 'package:untitled3/widget/custom_button_widget.dart';
import 'package:untitled3/UI/auth/log_in/log_in_screen/login_screen.dart';
class SignUp extends StatelessWidget {

   SignUp({Key?key});

  @override
  Widget build(BuildContext context) {
    return  GetBuilder<SignUpController>(
      init: SignUpController(),
      builder: (SignUpController controller) {return SafeArea(
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
                    Container(width: 330,height: 640,decoration:
                    BoxDecoration(boxShadow: const [
                      BoxShadow(
                          color: Colors.grey,
                          offset: Offset(0, 0),
                          blurRadius: 10)
                    ],color: Colors.white,borderRadius: BorderRadius.circular(20)),
                      child: Padding(
                        padding: const EdgeInsets.only(top: 50.0),
                        child: Form(
                          key: controller.formkey,
                          child: Column(crossAxisAlignment: CrossAxisAlignment.center,mainAxisAlignment: MainAxisAlignment.spaceEvenly
                            ,children: [Padding(
                              padding: const EdgeInsets.only(bottom: 15.0),
                              child: Text("SIGN UP",style: TextStyle(color: Color(0xFF877ecc),fontWeight: FontWeight.w900,fontSize:27),),
                            ),
                              CustomTextFieldWidget(controller: controller.userName_controller,
                                onChange:controller.onChanged, validator: controller.nameValidator,
                                keyboardType: TextInputType.name, isPassField: false,
                                textFieldIcon: Icon(Icons.person,size: 35,), textFieldTitle: 'Jay Dhameliya',
                              ),

                              CustomTextFieldWidget(controller: controller.email_controller, onChange: controller.onChanged,
                                validator: controller.emailValidator,
                                keyboardType:TextInputType.emailAddress, isPassField: false,
                                textFieldIcon: Icon(Icons.email_outlined,size: 35,), textFieldTitle: 'Email Address' ,
                              ),
                              CustomTextFieldWidget(controller: controller.phoneNumber_controller, onChange: controller.onChanged,
                                validator: controller.phoneNumberValidator, keyboardType: TextInputType.phone, isPassField: false,
                                textFieldIcon: Icon(Icons.phone,size: 35,), textFieldTitle: 'Number Phone',
                              ),

                              CustomTextFieldWidget(controller: controller.password_controller,
                                onChange: controller.onChanged, validator: controller.passwordValidator, keyboardType: TextInputType.visiblePassword,
                                isPassField: true, textFieldIcon:Icon(Icons.lock_outline_rounded,size: 35,),
                                textFieldTitle: 'Password',),
                              Button(onpressed: (){if(controller.formkey.currentState!.validate())
                                controller.signUp();
                              }, text: "SIGN UP")
                              ,
                              Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Text("Have an account ?",style: TextStyle(color: Colors.grey,fontWeight: FontWeight.bold),),
                                  TextButton(onPressed: (){ Get.to(()=>Login());}, child: Text("SIGN IN",style: TextStyle(decoration: TextDecoration.underline,fontWeight: FontWeight.w900,color: Color(0xFFa2b7f1)),)),
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
        },

    );
  }
}
