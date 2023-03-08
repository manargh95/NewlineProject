import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:sanoqreok/design/viewBookdetails.dart';

class BookSearch extends StatefulWidget {
  @override
  _BookSearchState createState() => _BookSearchState();
}

class _BookSearchState extends State<BookSearch> {
  TextEditingController searchController = TextEditingController();
  FirebaseFirestore _firestore = FirebaseFirestore.instance;
  List<DocumentSnapshot> books = [];

  @override
  Widget build(BuildContext context) {
    return Directionality(
      textDirection: TextDirection.rtl,
      child: Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.white54,
          title: TextField(
            controller: searchController,
            decoration: InputDecoration(
                hintText: "ابحث عن كتاب..",
                prefixIcon: Icon(Icons.search),
                border: InputBorder.none),
            onChanged: (value) {
              searchBooks(value);
            },
          ),
        ),
        body: ListView.builder(
          itemCount: books.length,
          itemBuilder: (context, index) {
            return ListTile(
              title: Text(books[index]["bookName"]),
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => viewBookDetails(books: books[index]),
                  ),
                );
              },
            );
          },
        ),
      ),
    );
  }

  void searchBooks(String query) async {
    QuerySnapshot snapshot = await _firestore
        .collection("books")
        .where("bookName", isGreaterThanOrEqualTo: query)
        .get();
    setState(() {
      books = snapshot.docs;
    });
  }
}
