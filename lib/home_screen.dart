import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:resumemaker/controller/resume_controllet.dart';
import 'package:resumemaker/cv_profile_screen.dart';
import 'package:resumemaker/cv_view_screen.dart';

class HomeScreen extends StatefulWidget {
  HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final resumeController = Get.put<ResumeController>(ResumeController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Resume Maker"),
      ),
      body: Stack(
        alignment: Alignment.bottomCenter,
        children: [
          Obx(
            () => resumeController.resumeList.isEmpty
                ? Center(
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Icon(
                          Icons.speaker_notes_outlined,
                          size: 70,
                          color: Colors.blue,
                        ),
                        Text("No recent CV yet")
                      ],
                    ),
                  )
                : Obx(
                    () => ListView.separated(
                      separatorBuilder: (context, index) =>
                          SizedBox(height: 15),
                      itemCount: resumeController.resumeList.length,
                      padding: EdgeInsets.all(10),
                      itemBuilder: (context, index) => Container(
                        decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.circular(10),
                            boxShadow: [
                              BoxShadow(
                                  color: Colors.black.withOpacity(0.5),
                                  blurRadius: 2,
                                  spreadRadius: 0)
                            ]),
                        padding: EdgeInsets.all(15),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              "${resumeController.resumeList[index].firstName ?? ""} ${resumeController.resumeList[index].lastName ?? ""}",
                              style: TextStyle(
                                  fontSize: 20, fontWeight: FontWeight.bold),
                            ),
                            Text(
                              resumeController.resumeList[index].designation ??
                                  "",
                            ),
                            SizedBox(
                              height: 15,
                            ),
                            Row(
                              children: [
                                Expanded(
                                  child: MaterialButton(
                                    onPressed: () {
                                      Get.to(CvProfileScreen(
                                        index: index,
                                        resumeData:
                                            resumeController.resumeList[index],
                                      ));
                                    },
                                    color: Colors.blue,
                                    height: 40,
                                    shape: RoundedRectangleBorder(
                                        borderRadius: BorderRadius.circular(8)),
                                    child: Text("Edit",
                                        style: TextStyle(color: Colors.white)),
                                  ),
                                ),
                                SizedBox(
                                  width: 15,
                                ),
                                Expanded(
                                  child: MaterialButton(
                                    onPressed: () {
                                      Get.to(CvViewScreen(
                                        resumeData:
                                            resumeController.resumeList[index],
                                      ));
                                    },
                                    color: Colors.blue,
                                    height: 40,
                                    shape: RoundedRectangleBorder(
                                        borderRadius: BorderRadius.circular(8)),
                                    child: Text("View",
                                        style: TextStyle(color: Colors.white)),
                                  ),
                                )
                              ],
                            )
                          ],
                        ),
                      ),
                    ),
                  ),
          ),
          Padding(
            padding: const EdgeInsets.all(20.0),
            child: MaterialButton(
              onPressed: () {
                Get.to(CvProfileScreen());
              },
              color: Colors.blue,
              height: 50,
              minWidth: Get.width,
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(8)),
              child: Text("Create Cv", style: TextStyle(color: Colors.white)),
            ),
          )
        ],
      ),
    );
  }
}
