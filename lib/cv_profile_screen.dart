import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:resumemaker/common_widgets.dart';
import 'package:resumemaker/controller/resume_controllet.dart';
import 'package:resumemaker/personal_info_screen.dart';
import 'package:resumemaker/model/resume_data_model.dart';

class CvProfileScreen extends StatelessWidget {
  int? index;
  ResumeDataModel? resumeData;
  CvProfileScreen({Key? key, this.resumeData, this.index}) : super(key: key);

  TextEditingController objective = TextEditingController();

  final resumeController = Get.find<ResumeController>();

  void addDataToClassObjects(ResumeDataModel resumeData, int index) {
    if (index >= 0 && index < resumeController.resumeList.length) {
      resumeController.resumeList[index] = resumeData;
    } else {
      print('Index out of range');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Profile"),
      ),
      body: Padding(
        padding: const EdgeInsets.all(15.0),
        child: Column(
          children: [
            CommonRow(
              onTap: () {
                Get.to(PersonalInfoScreen(
                  index: index,
                  resumeData: resumeData,
                ));
              },
              title: "Personal Info",
              icon: Icons.person,
            ),
            Divider(
              color: Colors.grey,
            ),
            CommonRow(
              onTap: () {
                objective.text = resumeData?.objective ?? "";
                Get.defaultDialog(
                    title: "Add Objective",
                    contentPadding: EdgeInsets.symmetric(horizontal: 15),
                    titlePadding: EdgeInsets.all(15),
                    content: Column(
                      children: [
                        TextFormField(
                          controller: objective,
                          maxLines: 3,
                          decoration: InputDecoration(
                              hintText: "Add Objective",
                              isDense: true,
                              border: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(10),
                                  borderSide: BorderSide(
                                    color: Colors.grey,
                                  ))),
                        ),
                        SizedBox(
                          height: 15,
                        ),
                        MaterialButton(
                          onPressed: () {
                            addDataToClassObjects(
                                ResumeDataModel(
                                  firstName: resumeData?.firstName,
                                  lastName: resumeData?.lastName,
                                  dob: resumeData?.dob,
                                  designation: resumeData?.designation,
                                  email: resumeData?.email,
                                  gender: resumeData?.gender,
                                  phone: resumeData?.phone,
                                  objective: objective.text,
                                ),
                                index ?? 0);
                          },
                          color: Colors.blue,
                          height: 40,
                          minWidth: Get.width,
                          shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(8)),
                          child: Text("Add",
                              style: TextStyle(color: Colors.white)),
                        )
                      ],
                    ));
              },
              title: "Objective",
              icon: Icons.arrow_circle_left_outlined,
            ),
            Divider(
              color: Colors.grey,
            ),
            CommonRow(
              onTap: () {},
              title: "Education",
              icon: Icons.library_books,
            ),
            Divider(
              color: Colors.grey,
            ),
            CommonRow(
              onTap: () {},
              title: "Skills",
              icon: Icons.lightbulb,
            ),
            Divider(
              color: Colors.grey,
            ),
            CommonRow(
              onTap: () {},
              title: "Experience",
              icon: Icons.menu_book_sharp,
            ),
            Divider(
              color: Colors.grey,
            ),
          ],
        ),
      ),
    );
  }
}
