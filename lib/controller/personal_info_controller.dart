import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';

class PersonalInfoController extends GetxController {
  TextEditingController firstName = TextEditingController();
  TextEditingController lastName = TextEditingController();
  TextEditingController profession = TextEditingController();
  TextEditingController phone = TextEditingController();
  TextEditingController email = TextEditingController();
  TextEditingController dob = TextEditingController();

  RxString selectedGender = "Male".obs;
}
