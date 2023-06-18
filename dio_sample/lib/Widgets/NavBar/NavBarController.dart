import 'package:dio_sample/Screens/LoginScreen/LoginScreen.dart';
import 'package:dio_sample/Screens/MainScreen/MainScreen.dart';
import 'package:get/get.dart';
import 'package:flutter/material.dart';



class NavBarController extends GetxController {
  RxInt currentIndex = 0.obs;

  List<Widget> pages = [
    MainScreenState(),
    LoginScreen()
  ];

  void changePage(int index) {
    currentIndex.value = index;
  }
}
