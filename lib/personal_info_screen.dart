import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';
import 'package:resumemaker/controller/personal_info_controller.dart';

class PersonalInfoScreen extends StatefulWidget {
  PersonalInfoScreen({Key? key}) : super(key: key);

  @override
  State<PersonalInfoScreen> createState() => _PersonalInfoScreenState();
}

class _PersonalInfoScreenState extends State<PersonalInfoScreen> {
  final personalInfoController =
      Get.put<PersonalInfoController>(PersonalInfoController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Personal Info"),
      ),
      body: SingleChildScrollView(
        physics: BouncingScrollPhysics(),
        child: Padding(
          padding: const EdgeInsets.all(15.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              TextFormField(
                controller: personalInfoController.firstName,
                decoration: InputDecoration(
                  labelText: "First Name",
                  border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(8),
                      borderSide: BorderSide(color: Colors.grey)),
                ),
              ),
              SizedBox(height: 15),
              TextFormField(
                controller: personalInfoController.lastName,
                decoration: InputDecoration(
                  labelText: "Last Name",
                  border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(8),
                      borderSide: BorderSide(color: Colors.grey)),
                ),
              ),
              SizedBox(height: 15),
              TextFormField(
                controller: personalInfoController.profession,
                decoration: InputDecoration(
                  labelText: "Profession",
                  border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(8),
                      borderSide: BorderSide(color: Colors.grey)),
                ),
              ),
              SizedBox(height: 15),
              TextFormField(
                controller: personalInfoController.dob,
                readOnly: true,
                onTap: () async {
                  final DateTime? picked = await showDatePicker(
                      context: context,
                      initialDate: DateTime.now(),
                      firstDate: DateTime(2000),
                      lastDate: DateTime(2101));
                  if (picked != null) {
                    setState(() {
                      personalInfoController.dob.text =
                          DateFormat('dd MMM, yyyy').format(picked);
                    });
                  }
                },
                decoration: InputDecoration(
                  labelText: "Date of Birth",
                  border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(8),
                      borderSide: BorderSide(color: Colors.grey)),
                ),
              ),
              SizedBox(height: 15),
              TextFormField(
                controller: personalInfoController.phone,
                keyboardType: TextInputType.phone,
                decoration: InputDecoration(
                  labelText: "Phone",
                  border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(8),
                      borderSide: BorderSide(color: Colors.grey)),
                ),
              ),
              SizedBox(height: 15),
              TextFormField(
                controller: personalInfoController.email,
                keyboardType: TextInputType.emailAddress,
                decoration: InputDecoration(
                  labelText: "Email",
                  border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(8),
                      borderSide: BorderSide(color: Colors.grey)),
                ),
              ),
              SizedBox(height: 15),
              Text("Gender"),
              SizedBox(height: 10),
              Obx(
                () => Row(
                  children: [
                    Radio(
                      value: "Male",
                      groupValue: personalInfoController.selectedGender.value,
                      onChanged: (value) {
                        personalInfoController.selectedGender.value = value!;
                      },
                    ),
                    Text("Male"),
                    Radio(
                      value: "Female",
                      groupValue: personalInfoController.selectedGender.value,
                      onChanged: (value) {
                        personalInfoController.selectedGender.value = value!;
                      },
                    ),
                    Text("Female"),
                  ],
                ),
              ),
              SizedBox(
                height: 20,
              ),
              MaterialButton(
                onPressed: () {},
                color: Colors.blue,
                height: 50,
                minWidth: Get.width,
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(8)),
                child: Text("Save", style: TextStyle(color: Colors.white)),
              )
            ],
          ),
        ),
      ),
    );
  }
}
