import 'package:get/get_state_manager/src/simple/get_controllers.dart';
import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:untitled3/UI/home/home_screen/home_screen.dart';



class WelcomeController extends GetxController{
  welcome(){
  Future<void> Welcomes(int index) async {
  final SharedPreferences prefs = await SharedPreferences.getInstance();
  bool? checker = prefs.containsKey("uid");
  if(checker){
  Get.off(()=> HomeScreen());
  }}}
  oninit()  {
    super.onInit();
   welcome();
  }
}