import 'package:flutter/material.dart';
import 'customeColor.dart';

customeColor_ c = customeColor_();

class textStyle {
  TextStyle textstyle1 = TextStyle(color: c.mycolor);
  TextStyle textstyle2 = TextStyle(color: c.mycolor, fontSize: 18);
  TextStyle textstyle3 = TextStyle(color: c.mycolor, fontSize: 25);
  TextStyle textstylegrey = TextStyle(color: Colors.black54);
  TextStyle drawertext = TextStyle(color: c.mycolor, fontSize: 35, shadows: [
    Shadow(offset: Offset.zero, blurRadius: 5, color: Colors.grey)
  ]);
}
