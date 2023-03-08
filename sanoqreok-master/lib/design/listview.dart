import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:sanoqreok/design/animationRoute.dart';
import 'package:sanoqreok/design/text.dart';
import '../myApp/books_categoty.dart';

textStyle ts = textStyle();

class mylistview extends StatefulWidget {
  final String categoryID;

  const mylistview({super.key, required this.categoryID});

  @override
  State<mylistview> createState() => _mylistviewState();
}

class _mylistviewState extends State<mylistview> {
  CollectionReference categoryref =
      FirebaseFirestore.instance.collection("category");

  CollectionReference bookref = FirebaseFirestore.instance.collection("books");

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Padding(
      padding: const EdgeInsets.all(3),
      child: FutureBuilder(
          future: categoryref.get(),
          builder: (BuildContext context,
              AsyncSnapshot<QuerySnapshot<Object?>> snapshot) {
            if (snapshot.hasData) {
              return ListView.builder(
                itemCount: snapshot.data!.docs.length,
                scrollDirection: Axis.vertical,
                shrinkWrap: true,
                itemBuilder: (BuildContext context, int i) {
                  return Card(
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(180),
                    ),
                    child: Column(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        Text(
                          "${snapshot.data!.docs[i]["categoryName"]}",
                          style: ts.textstyle2.copyWith(
                              fontWeight: FontWeight.normal, fontSize: 20),
                        ),
                        MaterialButton(
                          onPressed: () {
                            Navigator.of(context).push(animationRoute(
                                page: bookCategory(
                              categoryID: snapshot.data!.docs[i]["ID"],
                            )));
                          },
                          child: FutureBuilder(
                            future: bookref
                                .where("bookid", whereIn: [
                                  "e1",
                                  "poe1",
                                  "his1",
                                  "nov1",
                                  "psy1",
                                  "reli1",
                                  "rom1"
                                ])
                                .orderBy("id")
                                .get(),
                            builder: (BuildContext context,
                                AsyncSnapshot<dynamic> snapshot) {
                              if (snapshot.hasData) {
                                return Container(
                                    key: UniqueKey(),
                                    height: 150,
                                    width: 120,
                                    child: CircleAvatar(
                                      radius: 80,
                                      backgroundImage: NetworkImage(
                                          "${snapshot.data.docs[i]['image']}"),
                                    ));
                              }
                              return Center();
                            },
                          ),
                        )
                      ],
                    ),
                  );
                },
              );
            }
            if (snapshot.connectionState == ConnectionState.waiting) {
              return const Center(child: CircularProgressIndicator());
            }
            return const Center();
          }),
    ));
  }
}
