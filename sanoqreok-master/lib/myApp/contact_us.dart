import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import '../design/appBar.dart';

class contact_us extends StatefulWidget {
  const contact_us({Key? key}) : super(key: key);

  @override
  State<contact_us> createState() => _contact_usState();
}

class _contact_usState extends State<contact_us> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: myappBar("اتصل بنا"),
      body: Center(
        child: Column(
          children: [
            SizedBox(
              height: 50,
            ),
            Text(
              ":يمكنك التواصل معنا من خلال وسائل التواصل الآتية ",
              style: TextStyle(color: Colors.grey),
            ),
            SizedBox(
              height: 100,
            ),
            Card(
              child: Image.asset("assets/contact.png"),
            ),
            SizedBox(
              height: 100,
            ),
            Text(
              "حقوق النشر محفوظة",
              style: TextStyle(color: Colors.grey),
            ),
          ],
        ),
      ),
    );
  }
}
