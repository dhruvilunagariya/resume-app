import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:resumemaker/common_widgets.dart';
import 'package:resumemaker/personal_info_screen.dart';

class CvProfileScreen extends StatelessWidget {
  const CvProfileScreen({Key? key}) : super(key: key);

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
                Get.to(PersonalInfoScreen());
              },
              title: "Personal Info",
              icon: Icons.person,
            ),
            Divider(
              color: Colors.grey,
            ),
            CommonRow(
              onTap: () {},
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
