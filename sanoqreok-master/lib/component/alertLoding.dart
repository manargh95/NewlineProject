import 'package:flutter/material.dart';

//this method for loading time

showLoading(context) {
  return
    showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(alignment: Alignment.center,
          title: Text(" الرجاء الانتظار"),
          content: Container(
            height: 50,
            child: Center(
              child: CircularProgressIndicator(),
            ),
          ),
        );
      });
}
