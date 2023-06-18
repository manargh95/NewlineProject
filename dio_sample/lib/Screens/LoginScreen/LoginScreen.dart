import 'package:flutter/material.dart';

import '../../Model/DioHelper.dart';

class LoginScreen extends StatelessWidget {
  final TextEditingController _textFieldController1 = TextEditingController();
  final TextEditingController _textFieldController2 = TextEditingController();

  void _submitForm(BuildContext context) async {
    String value1 = _textFieldController1.text;
    String value2 = _textFieldController2.text;

    try {
      final response = await DioHelper.dioHelper.toJson('/favourites', data: {
        'BTS': value1,
        '1234': value2,
      });

      if (response.statusCode == 200) {
        // Show success SnackBar
        _showSnackBar(context, 'Success', Colors.green);
      } else {
        // Show error SnackBar
        _showSnackBar(context, 'Error', Colors.red);
      }
    } catch (error) {
      print(error);
      // Show error SnackBar
      _showSnackBar(context, 'Error', Colors.red);
    }
  }

  void _showSnackBar(BuildContext context, String message, Color color) {
    final snackBar = SnackBar(
      content: Text(message),
      backgroundColor: color,
    );
    ScaffoldMessenger.of(context).showSnackBar(snackBar);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Form(
        child: Center(
          child: Column(
            children: [
              SizedBox(
                height: 150,
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20),
                child: TextFormField(
                  controller: _textFieldController1,
                ),
              ),
              SizedBox(
                height: 20,
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20),
                child: TextFormField(
                  controller: _textFieldController2,
                ),
              ),
              SizedBox(
                height: 20,
              ),
              MaterialButton(
                onPressed: () => _submitForm(context),
                child: Text("Submit"),
                height: 50,
                color: Colors.red,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
