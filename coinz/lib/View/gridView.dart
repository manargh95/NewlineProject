import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../Controller/controller.dart';
import 'SplashContainer.dart';

class SplahGridview extends StatelessWidget {
  const SplahGridview({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final SplashScreenController controller = Get.put(SplashScreenController());
    final screenWidth = MediaQuery.of(context).size.width;
    final screenHeight = MediaQuery.of(context).size.height;
    return Scaffold(
      body:   GridView.count(
        childAspectRatio: (screenWidth / screenHeight),
        crossAxisCount: 2,
        children: <Widget>[
          SplashContainer(
              controller.yellow.mycolor, controller.orange.mycolor),
          SplashContainer(
              controller.pink.mycolor, controller.purple.mycolor),
          SplashContainer(
              controller.blue.mycolor, controller.darkBlue.mycolor),
          SplashContainer(
              controller.green.mycolor, controller.turquoise.mycolor),
        ],
      ),
    );
  }
}
