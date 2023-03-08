import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:curved_navigation_bar/curved_navigation_bar.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:sanoqreok/design/animationRoute.dart';
import 'package:sanoqreok/design/drawer.dart';
import 'package:sanoqreok/design/listview.dart';
import 'package:sanoqreok/design/text.dart';
import 'package:sanoqreok/myApp/favorite.dart';
import '../design/customeColor.dart';
import '../controller/controller.dart';

customeColor_ c = customeColor_();
textStyle ts = textStyle();

class homePage extends StatefulWidget {
  const homePage({Key? key}) : super(key: key);

  @override
  State<homePage> createState() => _homePageState();
}

class _homePageState extends State<homePage> {
  int index = 2;
  GlobalKey<CurvedNavigationBarState> _bottomNavigationKey = GlobalKey();
  controller control = controller();

  getUser() {
    FirebaseAuth.instance.currentUser;
  }

  @override
  void initState() {
    getUser();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        drawer: const mydrawer(),
        extendBody: true,
        body: control.screens[index],
        floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
        bottomNavigationBar: CurvedNavigationBar(
          key: _bottomNavigationKey,
          animationCurve: Curves.easeInOut,
          animationDuration: const Duration(milliseconds: 300),
          index: 2,
          height: 50,
          backgroundColor: Colors.transparent,
          color: c.mycolor,
          items: const [
            ImageIcon(
              AssetImage("assets/loc.png"),
              size: 25,
              color: Colors.white,
            ),
            Icon(Icons.search, size: 25, color: Colors.white),
            Icon(
              Icons.home,
              color: Colors.white,
            ),
            ImageIcon(AssetImage("assets/quotes.png"),
                size: 25, color: Colors.white),
            ImageIcon(AssetImage("assets/books.png"),
                size: 25, color: Colors.white),
          ],
          onTap: (index) {
            setState(() {
              this.index = index;
            });
          },
        ));
  }
}

class home extends StatefulWidget {
  const home({Key? key}) : super(key: key);

  @override
  State<home> createState() => _homeState();
}

class _homeState extends State<home> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text(
            "الرئيسية",
            style: ts.textstyle1,
          ),
          centerTitle: true,
          backgroundColor: Colors.white,
          leading: IconButton(
              icon: Icon(
                Icons.menu,
                color: c.mycolor,
              ),
              onPressed: () {
                Scaffold.of(context).openDrawer();
              }),
          actions: <Widget>[
            IconButton(
              icon: Icon(
                Icons.favorite,
                color: c.mycolor,
              ),
              onPressed: () {
                Navigator.of(context).push(animationRoute(page: favorite()));
              },
            )
          ],
        ),
        body: Container(
            margin: const EdgeInsets.only(top: 10),
            padding: const EdgeInsets.symmetric(
              horizontal: 10,
            ),
            child: const mylistview(
              categoryID: '',
            )));
  }
}
