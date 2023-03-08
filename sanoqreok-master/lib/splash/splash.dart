import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:sanoqreok/auth/Login.dart';

class splash extends StatefulWidget {
  const splash({Key? key}) : super(key: key);

  @override
  State<splash> createState() => _splashState();
}

class _splashState extends State<splash> {
  @override
  void initState() {
    navigait_to_login();
    super.initState();
  }

  navigait_to_login() async {
    await Future.delayed(Duration(milliseconds: 10), () {});
    Get.to(Login());
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        child: Image.asset(
          "assets/splash.png",
          fit: BoxFit.fill,
        ),
      ),
    );
  }
}
