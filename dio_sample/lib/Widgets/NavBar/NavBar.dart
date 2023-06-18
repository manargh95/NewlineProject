import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'NavBarController.dart';

class NavBar extends GetView<NavBarController> {
  @override
  Widget build(BuildContext context) {
    Get.put(NavBarController());
    return Obx(
          () => Directionality(
        textDirection: TextDirection.rtl,
        child: Scaffold(
          body: SafeArea(
            child: IndexedStack(
              index: controller.currentIndex.value,
              children: controller.pages,
            ),
          ),
          bottomNavigationBar: BottomNavigationBar(
            unselectedItemColor: Colors.grey,
            selectedItemColor: Colors.white,
            selectedLabelStyle: TextStyle(color: Colors.black),
            onTap: controller.changePage,
            currentIndex: controller.currentIndex.value,
            showSelectedLabels: true,
            showUnselectedLabels: true,unselectedIconTheme: IconThemeData(color: Colors.grey),
            type: BottomNavigationBarType.fixed,
            backgroundColor: Colors.black
            ,
            elevation: 0,
            items: [
              BottomNavigationBarItem(icon:Icon(Icons.home) ,label:"Home"),
              BottomNavigationBarItem(icon:Icon(Icons.login) ,label:"Login"),
            ],
          ),
        ),
      ),
    );
  }}
