import 'package:flutter/material.dart';
import 'package:resumemaker/model/resume_data_model.dart';

class CvViewScreen extends StatelessWidget {
  ResumeDataModel? resumeData;
  CvViewScreen({Key? key, this.resumeData}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Preview"),
      ),
      body: Padding(
        padding: const EdgeInsets.all(10.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              "${resumeData?.firstName ?? ""} ${resumeData?.lastName ?? ""}",
              style: TextStyle(fontSize: 25, fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 5),
            Text(
              resumeData?.designation ?? "",
              style: TextStyle(fontSize: 16),
            ),
            SizedBox(height: 5),
            Row(
              children: [
                Text(
                  "Phone: ",
                  style: TextStyle(color: Colors.blue, fontSize: 12),
                ),
                Text(
                  resumeData?.phone ?? "",
                  style: TextStyle(fontSize: 12),
                ),
              ],
            ),
            Row(
              children: [
                Text(
                  "E-mail: ",
                  style: TextStyle(color: Colors.blue, fontSize: 12),
                ),
                Text(
                  resumeData?.email ?? "",
                  style: TextStyle(fontSize: 12),
                ),
              ],
            ),
            Divider(
              color: Colors.blue,
            ),
            Row(
              children: [
                Expanded(
                  child: Text(
                    "About me",
                    style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                  ),
                ),
                Expanded(
                  child: Text(
                    resumeData?.objective ?? "",
                    style: TextStyle(fontSize: 10),
                  ),
                ),
              ],
            ),
            Divider(
              color: Colors.blue,
            ),
            Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Expanded(
                  child: Text(
                    "Personal Information",
                    style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                  ),
                ),
                Expanded(
                  child: Column(
                    children: [
                      Row(
                        children: [
                          Text(
                            "Gender: ",
                            style: TextStyle(
                                fontWeight: FontWeight.w500, fontSize: 12),
                          ),
                          Text(
                            resumeData?.email ?? "",
                            style: TextStyle(fontSize: 12),
                          ),
                        ],
                      ),
                      Row(
                        children: [
                          Text(
                            "Date of birth: ",
                            style: TextStyle(
                                fontWeight: FontWeight.w500, fontSize: 12),
                          ),
                          Text(
                            resumeData?.dob ?? "",
                            style: TextStyle(fontSize: 12),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ],
            ),
            Divider(
              color: Colors.blue,
            ),
          ],
        ),
      ),
    );
  }
}
