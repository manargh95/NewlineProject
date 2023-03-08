import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:sanoqreok/design/customeColor.dart';
import 'package:sanoqreok/design/text.dart';

textStyle ts = textStyle();
customeColor_ c = customeColor_();

class myappBar extends StatelessWidget implements PreferredSizeWidget {
  Size get preferredSize => const Size.fromHeight(60);

  String t;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
      title: Text(
        t,
        style: TextStyle(color: c.mycolor),
      ),
      centerTitle: true,
      backgroundColor: Colors.white,
      leading: IconButton(
        onPressed: () {
          Get.back();
        },
        icon: Icon(
          CupertinoIcons.left_chevron,
          color: Colors.grey,
        ),
      ),
    ));
  }

  myappBar(this.t);
}

class simpleappBar extends StatelessWidget implements PreferredSizeWidget {
  Size get preferredSize => const Size.fromHeight(100);

  late String simplet;

  simpleappBar(this.simplet);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          simplet,
          style: TextStyle(color: c.mycolor),
        ),
        centerTitle: true,
        backgroundColor: Colors.white,
      ),
    );
  }
}


