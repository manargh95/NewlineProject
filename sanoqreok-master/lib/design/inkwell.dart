import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:sanoqreok/design/text.dart';
import 'package:sanoqreok/myApp/homePage.dart';
import '../auth/Login.dart';
import '../auth/Register.dart';

textStyle ts = textStyle();

class myinkewell {
  Text inkwellTextlogin = Text(
    "  ليس لديك حساب؟",
    style: ts.textstylegrey,
  );

  InkWell myinkwelogin = InkWell(
    onTap: () {
      Get.to(Register());
    },
    child: Text(
      "سجّل الان",
      style: ts.textstyle1,
    ),
  );

  Text inkwellTextregister = Text(
    "   لديك حساب؟",
    style: ts.textstylegrey,
  );

  InkWell myinkweregister = InkWell(
    onTap: () {
      Get.to(Login());
    },
    child: Text(
      "اضغط هنا لتسجيل الدخول",
      style: ts.textstyle1,
    ),
  );
  InkWell myinkguest = InkWell(
    onTap: () {
      Get.to(homePage());
    },
    child: Text(
      "دخول كـ ضيف",
      style: ts.textstyle1,
    ),
  );
}
