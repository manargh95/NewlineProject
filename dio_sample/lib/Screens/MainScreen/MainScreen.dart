import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'MainScreenController.dart';

class MainScreenState extends StatelessWidget {
  final MainScreenController controller = Get.put(MainScreenController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Dio Sample"),
        backgroundColor: Colors.black,
      ),
      body: Obx(
            () => controller.isLoading.value
            ? Center(child: CircularProgressIndicator())
            : ListView.builder(
          itemCount: controller.newsList.length,
          itemBuilder: (context, index) {
            final code = controller.newsList[index].sCode;
            final name = controller.newsList[index].sName;
            final value = controller.newsList[index].dValue;
            return Container(
              decoration:
              BoxDecoration(border: Border.all(color: Colors.grey)),
              padding: EdgeInsets.all(8),
              margin: EdgeInsets.all(6),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    "$name",
                    style: TextStyle(color: Colors.red, fontSize: 20),
                    textAlign: TextAlign.center,
                  ),
                  SizedBox(height: 20),
                  Text(
                    "$code",
                    style: TextStyle(color: Colors.grey, fontSize: 15),
                  ),
                  SizedBox(height: 20),
                  Text(
                    "$value",
                    style: TextStyle(color: Colors.black, fontSize: 12),
                    textAlign: TextAlign.start,
                  ),
                ],
              ),
            );
          },
        ),
      ),
    );
  }
}
