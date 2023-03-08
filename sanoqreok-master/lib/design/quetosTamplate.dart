import 'package:flutter/material.dart';
import 'package:sanoqreok/design/customeColor.dart';

customeColor_ c = customeColor_();

class tamplate extends StatelessWidget {
  late String myq;
  late String qbook;

  tamplate(this.myq, this.qbook);

  @override
  Widget build(BuildContext context) {
    return Directionality(
      textDirection: TextDirection.rtl,
      child: Column(
        children: [
          Row(
            // mainAxisSize: MainAxisSize.min,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Image.asset(
                "assets/q2.png",
                color: c.mycolor,
                height: 12,
              ),
              SizedBox(
                width: 7,
              ),
              Expanded(
                child: Text(
                  myq,
                  style: TextStyle(fontSize: 15, color: Colors.black45),
                ),
              ),
              SizedBox(
                width: 7,
              ),
              Image.asset(
                "assets/q2.png",
                color: c.mycolor,
                height: 12,
              )
            ],
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Image.asset(
                "assets/books.png",
                color: c.mycolor,
                height: 20,
              ),
              SizedBox(
                width: 5,
              ),
              Text(qbook, style: TextStyle(color: c.mycolor, fontSize: 20)),
            ],
          )
        ],
      ),
    );
  }
}
