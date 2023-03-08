import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:sanoqreok/design/animationRoute.dart';
import 'package:sanoqreok/design/button.dart';
import 'package:sanoqreok/design/text.dart';
import '../myApp/aboutUs.dart';
import '../myApp/contact_us.dart';

class mydrawer extends StatefulWidget {
  const mydrawer({Key? key}) : super(key: key);

  @override
  State<mydrawer> createState() => _mydrawerState();
}

class _mydrawerState extends State<mydrawer> {
  bool? islogin;
  var user = FirebaseAuth.instance.currentUser;

  getuser() async {
    if (user == null) {
      islogin = false;
    } else {
      islogin = true;
    }
  }

  @override
  void initState() {
    getuser();
    super.initState();
  }

  islog(){
    if(islogin == true) { return drawerButton();}
    else return drawerButtonlogin();

  }

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: Container(
        padding: EdgeInsets.all(50),
        child: SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            mainAxisSize: MainAxisSize.min,
            children: [
              Text("سَنُقْرِئُكَ", style: textStyle().drawertext),
              Image.asset(
                "assets/girl.png",
                width: 200,
                height: 200,
              ),
              SizedBox(
                height: 20,
              ),
              InkWell(
                child: Text("عن سَنُقْرِئُكَ", style: textStyle().drawertext),
                onTap: () {
Navigator.of(context).push(animationRoute(page: aboutUs()))   ;             },
              ),
              SizedBox(
                height: 20,
              ),
              InkWell(
                child: Text("اتصل بنا", style: textStyle().drawertext),
                onTap: () {
                  Navigator.of(context).push(animationRoute(page: contact_us()))   ;                   },
              ),
              SizedBox(
                height: 50,
              ),
              islog()
            ],
          ),
        ),
      ),
    );
  }
}
