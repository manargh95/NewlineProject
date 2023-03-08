import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:get/get.dart';
import 'package:sanoqreok/design/customeColor.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

customeColor_ c = customeColor_();

class viewBookDetails extends StatefulWidget {
  final books;

  const viewBookDetails({Key? key, required this.books}) : super(key: key);

  @override
  State<viewBookDetails> createState() => _viewBookDetailsState();
}

class _viewBookDetailsState extends State<viewBookDetails> {
  bookdelete() {
    CollectionReference bookre = FirebaseFirestore.instance
        .collection("userFavoriteBook")
        .doc(FirebaseAuth.instance.currentUser!.email)
        .collection("favoriteBooks");
    return bookre;
  }

  Future addToFavorite() async {
    final FirebaseAuth _auth = FirebaseAuth.instance;
    var currentUser = _auth.currentUser;
    CollectionReference bookref =
        FirebaseFirestore.instance.collection("userFavoriteBook");
    return bookref
        .doc(currentUser!.email)
        .collection("favoriteBooks")
        .doc()
        .set({
      "bookName": widget.books['bookName'],
      "authorName": widget.books['authorName'],
      "image": widget.books['image'],
      "rate": widget.books['rate'],
      "publisher": widget.books['publisher'],
      "shortAboutBook": widget.books['shortAboutBook'],
      "categoryname": widget.books['categoryname'],
    }).then((value) => print("added to favorite"));
  }

  @override
  void initState() {
    // TODO: implement initState
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return Directionality(
      textDirection: TextDirection.rtl,
      child: Scaffold(
        appBar: AppBar(
          actions: <Widget>[
            if (FirebaseAuth.instance.currentUser != null)
              Padding(
                padding: const EdgeInsets.only(top: 5),
                child: StreamBuilder(
                    stream: FirebaseFirestore.instance
                        .collection("userFavoriteBook")
                        .doc(FirebaseAuth.instance.currentUser!.email)
                        .collection("favoriteBooks")
                        .where("bookName", isEqualTo: widget.books['bookName'])
                        .snapshots(),
                    builder: (BuildContext context, AsyncSnapshot snapshot) {
                      int i = 0;
                      i >= 0;
                      if (snapshot.hasData!) {
                        return IconButton(
                          icon: snapshot.data!.docs.length == 0
                              ? Icon(
                                  Icons.favorite_border,
                                  color: c.mycolor,
                                )
                              : Icon(
                                  Icons.favorite,
                                  color: c.mycolor,
                                ),
                          onPressed: () async {
                            await snapshot.data!.docs.length == 0
                                ? addToFavorite()
                                : await bookdelete()
                                    .doc(snapshot.data?.docs[i].id)
                                    .delete();
                          },
                        );
                      }
                      return Text("");
                    }),
              ),
          ],
          title: Text(
            "كتبي",
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
        ),
        body: SingleChildScrollView(
          child: Column(children: <Widget>[
            Padding(
              padding: const EdgeInsets.only(top: 50),
              child: Card(
                child: Row(
                  children: [
                    Expanded(
                        flex: 1,
                        child: Image.network(
                          "${widget.books['image']}",
                          fit: BoxFit.fill,
                          height: 150,
                          width: 200,
                        )),
                    Expanded(
                      flex: 3,
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          ListTile(
                            title: Text("${widget.books['bookName']}"),
                            subtitle: Text("${widget.books['authorName']}"),
                          ),
                          Padding(
                            padding: const EdgeInsets.only(right: 12),
                            child: RatingBar.builder(
                              initialRating:
                                  double.parse(widget.books["rate"].toString()),
                              direction: Axis.horizontal,
                              tapOnlyMode: true,
                              ignoreGestures: true,
                              allowHalfRating: true,
                              itemCount: 5,
                              itemSize: 20,
                              itemPadding:
                                  const EdgeInsets.symmetric(horizontal: 4.0),
                              itemBuilder: (context, _) => const Icon(
                                Icons.star,
                                color: Colors.amber,
                              ),
                              onRatingUpdate: (rating) {},
                            ),
                          ),
                          ListTile(
                            title: Text("${widget.books['publisher']}"),
                            subtitle: Text("${widget.books["categoryname"]}"),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ),
            Container(
                padding: EdgeInsets.all(20.0),
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(30.0),
                    topRight: Radius.circular(30.0),
                  ),
                ),
                child: SingleChildScrollView(
                    child: Column(children: <Widget>[
                  SizedBox(height: 20.0),
                  Row(
                    children: [
                      Icon(
                        CupertinoIcons.square_fill,
                        color: c.mycolor,
                      ),
                      Text(
                        'نبذة عن الكتاب',
                        style: TextStyle(
                          fontSize: 20,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ],
                  ),
                  SizedBox(height: 10.0),
                  Text(
                    "${widget.books['shortAboutBook']}",
                    style: TextStyle(
                      fontSize: 16,
                    ),
                  ),
                  SizedBox(height: 20.0),
                  Container()
                ]
// decoration: BoxDec
                        )))
          ]),
        ),
      ),
    );
  }
}
