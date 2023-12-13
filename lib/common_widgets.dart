import 'package:flutter/material.dart';

// ignore: must_be_immutable
class CommonRow extends StatelessWidget {
  String? title;
  IconData? icon;
  void Function()? onTap;
  CommonRow({Key? key, this.title, this.onTap, this.icon}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8.0),
      child: InkWell(
        onTap: onTap,
        child: Row(
          children: [
            Icon(
              icon,
              color: Colors.blue,
            ),
            SizedBox(
              width: 15,
            ),
            Text(title ?? "")
          ],
        ),
      ),
    );
  }
}
