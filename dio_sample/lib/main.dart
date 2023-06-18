import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'Widgets/NavBar/NavBar.dart';



void main() {
  WidgetsFlutterBinding.ensureInitialized();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(backgroundColor: Colors.black),
      home:  NavBar(),
    );
  }
}