
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_state_manager/src/simple/get_state.dart';
import 'package:untitled3/widget/custom_text_field_widget.dart';
import 'package:untitled3/widget/test_custom_button.dart';
import 'package:untitled3/widget/test_text_form_field.dart';

import '../home_controller/edit_profile_controller.dart';

class EditProfile extends StatelessWidget {
  const EditProfile({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return  GetBuilder<EditProfileController>(
        init: EditProfileController(),
    builder: (EditProfileController controller) {
    return Scaffold(body: Column(children: [
      Row(mainAxisAlignment: MainAxisAlignment.start,crossAxisAlignment: CrossAxisAlignment.end,
        children: [
          Padding(
            padding: const EdgeInsets.only(top: 45.0,left: 17),
            child: IconButton(onPressed: (){}, icon: Icon(Icons.keyboard_backspace_rounded,color:Color(0xff0A0A0A).withOpacity(0.7) ,size:44 ,weight: 20,)),
          ),Padding(
            padding: const EdgeInsets.only(left: 15.0,bottom: 12),
            child: Text("Edit Profile",style: TextStyle(color: Color(0xff0A0A0A).withOpacity(0.7),fontWeight: FontWeight.w700,fontSize: 25),),
          ) ],),Padding(
            padding: const EdgeInsets.only(top: 25.0),
            child: Container(height: 130,width: 130,decoration: BoxDecoration(
            image: DecorationImage(image: AssetImage("assets/images/Profile.png"),fit: BoxFit.fill)),),
          ),
      Padding(
        padding: const EdgeInsets.only(top: 65.0,bottom: 25.0,left: 15.0,right: 20.0),
        child: TestCustomTextFormField(controller: controller.fullName_controller,
            onChange: (String){}, validator: (String){},
            keyboardType: TextInputType.name, isPassField: false,
            textFieldTitle: "    Full name", col: Color(0xff666666).withOpacity(0.2), icon: Icon(Icons.abc,color: Colors.transparent,),),
      ),
      Padding(
        padding: const EdgeInsets.only(top: 10.0,bottom: 25.0,left: 15.0,right: 20.0),
        child:
        TestCustomTextFormField(controller:controller.nickName_controller,
            onChange: (String){}, validator: (String){},
            keyboardType: TextInputType.name, isPassField: false,
            textFieldTitle: "    Nickname", col:Color(0xff666666).withOpacity(0.2), icon: Icon(Icons.abc,color: Colors.transparent) ,),
      ),
      Padding(
        padding: const EdgeInsets.only(top: 10.0,bottom: 25.0,left: 15.0,right: 20.0),
        child:
        TestCustomTextFormField(controller:controller.email_controller,
            onChange: (String){}, validator: (String){},
            keyboardType: TextInputType.emailAddress, isPassField: false,
            textFieldTitle: "    Email", col: Color(0xff666666).withOpacity(0.2), icon: Icon(Icons.email_outlined,color: Colors.black),),
      ),
      Padding(
        padding: const EdgeInsets.only(top: 10.0,bottom: 25.0,left: 15.0,right: 20.0),
        child:
        TestCustomTextFormField(controller: controller.phoneNumber_controller,
            onChange: (String){}, validator: (String){},
            keyboardType: TextInputType.phone, isPassField: false,
            textFieldTitle: "    Phone Number", col: Color(0xff666666).withOpacity(0.2), icon: Icon(Icons.abc,color: Colors.transparent),),
      ),Padding(
        padding: const EdgeInsets.only(top: 60.0),
        child: CustomButton(onpressed: (){}, text: "Update", col: Colors.white),
      ),TextButton(onPressed: (){}, child: Text('Cancel',style: TextStyle(color: Color(0xff666666),fontWeight: FontWeight.w500),))],),);
    },

    );
  }
}




