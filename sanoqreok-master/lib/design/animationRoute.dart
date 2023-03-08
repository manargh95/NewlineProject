
import 'package:flutter/material.dart';
class animationRoute extends PageRouteBuilder {
  final page;

  animationRoute({this.page}) :super(
      pageBuilder: (context, animation, animationtwo) => page,
      transitionsBuilder: (context, animation, animationtwo,child) {

        var begin = Offset(1, 0);
//Offset(x,y) >> محور افقي ومحور عامودي
        var end = Offset(0, 0);
        var tween = Tween(begin: begin,end:end );
        var offsetanimation = animation.drive(tween);
        return
          //نوع من الانيمشن ويدجيت
          SlideTransition(position: offsetanimation,child: child,);
      });


}