import 'package:dio/dio.dart';
import 'package:flutter/material.dart';

class MainScreen extends StatefulWidget {
  const MainScreen({Key? key}) : super(key: key);

  @override
  State<MainScreen> createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
  List<Map<String, dynamic>> newsList = [];

  @override
  void initState() {
    super.initState();
    getApiData();
  }

  void getApiData() async {
    try {
      Response response = await Dio().get(
        'http://api.mediastack.com/v1/news',
        queryParameters: {'access_key': '17ad138ca63a84718ebdf5b5e9c013da'},
      );

      setState(() {
        newsList = List<Map<String, dynamic>>.from(response.data['data']);
      });
    } catch (error) {
      print(error.toString());
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Dio Sample"),
      ),
      body: ListView.builder(
        itemCount: newsList.length,
        itemBuilder: (context, index) {
          final news = newsList[index];
          final category = news['category'];
          final title = news['title'];
          final description = news['description'];

          return Container(decoration: BoxDecoration(border: Border.all(color: Colors.grey)),
            padding: EdgeInsets.all(8),margin: EdgeInsets.all(6),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text("$title",
                    style: TextStyle(color: Colors.red, fontSize: 20),
                    textAlign: TextAlign.center),
                SizedBox(
                  height: 20,
                ),
                Text("$category",
                    style: TextStyle(color: Colors.grey, fontSize: 15)),
                SizedBox(
                  height: 20,
                ),
                Text(
                  "$description",
                  style: TextStyle(color: Colors.black, fontSize: 12),
                  textAlign: TextAlign.start,
                ),
              ],
            ),
          );
        },
      ),
    );
  }
}
