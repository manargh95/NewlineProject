import 'package:awesome_dialog/awesome_dialog.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:sanoqreok/auth/Login.dart';
import 'package:sanoqreok/design/animationRoute.dart';
import 'package:sanoqreok/design/appBar.dart';
import 'package:sanoqreok/design/customeColor.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:sanoqreok/myApp/homePage.dart';
import 'books_categoty.dart';

class favorite extends StatefulWidget {
  @override
  State<favorite> createState() => _favoriteState();
}

customeColor_ c = customeColor_();

class _favoriteState extends State<favorite> {
  bool? islogin;

  getuser() async {
    var user = FirebaseAuth.instance.currentUser;
    if (user == null) {
      islogin = false;
    } else {
      islogin = true;
    }
  }

  bookrefdel() {
    CollectionReference bookref = FirebaseFirestore.instance
        .collection("userFavoriteBook")
        .doc(FirebaseAuth.instance.currentUser!.email)
        .collection("favoriteBooks");
    return bookref;
  }

  @override
  void initState() {
    getuser();
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    if (islogin == true)
      return Directionality(
        textDirection: TextDirection.rtl,
        child: Scaffold(
          appBar: simpleappBar("كتبي"),
          body: FutureBuilder(
              future: bookrefdel().get(),
              builder: (BuildContext context,
                  AsyncSnapshot<QuerySnapshot<Object?>> snapshot) {
                if (snapshot.hasData) {
                  List<QueryDocumentSnapshot<Object?>> list =
                      snapshot.data!.docs.toList();
                  return ListView.builder(
                      itemCount: list.length,
                      padding: EdgeInsets.zero,
                      itemBuilder: (context, i) {
                        return Dismissible(
                            confirmDismiss: (DismissDirection direction) async {
                              return await showDialog(
                                context: context,
                                builder: (BuildContext context) {
                                  return AlertDialog(
                                    title: const Text("تأكيد الحذف"),
                                    content: const Text(
                                        "هل تريد حذف الكتاب من المفضلة؟"),
                                    actions: <Widget>[
                                      Padding(
                                        padding: EdgeInsets.only(bottom: 10),
                                        child: AnimatedButton(
                                            pressEvent: () {
                                              Navigator.of(context).pop(true);
                                            },
                                            text: "نعم"),
                                      ),
                                      AnimatedButton(
                                          pressEvent: () {
                                            Navigator.of(context).pop(false);
                                          },
                                          text: "لا"),
                                    ],
                                  );
                                },
                              );
                            },
                            key: UniqueKey(),
                            direction: DismissDirection.endToStart,
                            onDismissed: (direction) async {
                              await bookrefdel()
                                  .doc(snapshot.data?.docs[i].id)
                                  .delete();
                            },
                            child: Container(
                              width: 250,
                              height: 150,
                              key: UniqueKey(),
                              child: Listbooks(bookID: list[i].data()
                                  // bookID: list[i],
                                  ),
                            ));
                      });
                }
                if (snapshot.connectionState == ConnectionState.waiting) {
                  return const Center(child: CircularProgressIndicator());
                }
                return const Center(
                    // child: CircularProgressIndicator(),
                    );
              }),
        ),
      );
    else
      return Scaffold(
        body: Center(
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Text('لا يمكنك الدخول الى المفضلة'),
              Text('يجب عليك تسجيل الدخول أولاً'),
              ElevatedButton(
                onPressed: () => Navigator.of(context)
                    .push(animationRoute(page: homePage())),
                child: Text('تم'),
              ),
              ElevatedButton(
                onPressed: () =>
                    Navigator.of(context).push(animationRoute(page: Login())),
                child: Text('تسجيل الدخول'),
              ),
            ],
          ),
        ),
      );
  }
}
