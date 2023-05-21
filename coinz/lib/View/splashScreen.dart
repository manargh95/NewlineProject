import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../Controller/controller.dart';
import 'gridView.dart';
import 'home.dart';

class splashScreen extends StatelessWidget {
  final SplashScreenController controller = Get.put(SplashScreenController());

  @override
  Widget build(BuildContext context) {
    Future.delayed(Duration(seconds: 5), () {
      Get.off(home());
    });
    return Scaffold(
      body: Stack(
        children: [
          SplahGridview(),
          Positioned.fill(
            child: Center(child: controller.splashText.splashText),
            top: 60,
          ),
          Positioned.fill(
            top: 405,
            child: Center(
              child: Image.asset(
                "assets/square.png",
                fit: BoxFit.cover,
                height: 135,
                width: 150,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
