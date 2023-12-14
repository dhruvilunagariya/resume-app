import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:intl/intl.dart';
import 'package:resumemaker/controller/personal_info_controller.dart';
import 'package:resumemaker/controller/resume_controllet.dart';
import 'package:resumemaker/model/resume_data_model.dart';

class PersonalInfoScreen extends StatefulWidget {
  int? index;
  ResumeDataModel? resumeData;
  PersonalInfoScreen({Key? key, this.resumeData, this.index}) : super(key: key);

  @override
  State<PersonalInfoScreen> createState() => _PersonalInfoScreenState();
}

class _PersonalInfoScreenState extends State<PersonalInfoScreen> {
  final personalInfoController =
      Get.put<PersonalInfoController>(PersonalInfoController());

  final resumeController = Get.find<ResumeController>();

  // Function to update an item at a specific index
  void updateItem(int index, ResumeDataModel newValue) {
    if (index >= 0 && index < resumeController.resumeList.length) {
      resumeController.resumeList[index] = newValue;
    }
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    if (widget.resumeData != null) {
      personalInfoController.firstName.text =
          widget.resumeData?.firstName ?? "";
      personalInfoController.lastName.text = widget.resumeData?.lastName ?? "";
      personalInfoController.dob.text = widget.resumeData?.dob ?? "";
      personalInfoController.profession.text =
          widget.resumeData?.designation ?? "";
      personalInfoController.email.text = widget.resumeData?.email ?? "";
      personalInfoController.phone.text = widget.resumeData?.phone ?? "";
      personalInfoController.selectedGender.value =
          widget.resumeData?.gender ?? "";
    }
  }

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
                onPressed: () {
                  if (widget.resumeData != null) {
                    updateItem(
                        widget.index ?? 0,
                        ResumeDataModel(
                          firstName: personalInfoController.firstName.text,
                          lastName: personalInfoController.lastName.text,
                          dob: personalInfoController.dob.text,
                          designation: personalInfoController.profession.text,
                          email: personalInfoController.email.text,
                          gender: personalInfoController.selectedGender.value,
                          phone: personalInfoController.phone.text,
                        ));
                  } else {
                    resumeController.resumeList.add(ResumeDataModel(
                      firstName: personalInfoController.firstName.text,
                      lastName: personalInfoController.lastName.text,
                      dob: personalInfoController.dob.text,
                      designation: personalInfoController.profession.text,
                      email: personalInfoController.email.text,
                      gender: personalInfoController.selectedGender.value,
                      phone: personalInfoController.phone.text,
                    ));
                  }

                  Get.back();
                },
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
