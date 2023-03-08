import 'package:firebase_auth/firebase_auth.dart';
import 'package:awesome_dialog/awesome_dialog.dart';
import 'package:flutter/material.dart';
import 'package:sanoqreok/design/customeColor.dart';

customeColor_ c = customeColor_();


class  drawerButton extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return   AnimatedButton(
    color: c.mycolor,
text: 'تسجيل الخروج',
buttonTextStyle: TextStyle(fontSize: 20),
height: 30,width: 250,
pressEvent: ()async {
  await FirebaseAuth.instance.signOut();
  Navigator.of(context).pushReplacementNamed("login");
},
);
  }
}



class  drawerButtonlogin extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return   AnimatedButton(
      color: c.mycolor,
      text: 'تسجيل الدخول',
      buttonTextStyle: TextStyle(fontSize: 20),
      height: 30,width: 250,
      pressEvent: () {
        Navigator.of(context).pushReplacementNamed("login");
      },
    );
  }
}
