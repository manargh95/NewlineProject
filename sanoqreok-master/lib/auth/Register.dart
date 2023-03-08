import 'package:awesome_dialog/awesome_dialog.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:sanoqreok/controller/controller.dart';
import 'package:sanoqreok/design/inkwell.dart';
import '../design/customeColor.dart';
import 'package:animated_button/animated_button.dart' as Button;
import '../component/alertLoding.dart';
import '../design/text.dart';
import 'package:cloud_firestore/cloud_firestore.dart';


customeColor_ c = new customeColor_();
textStyle ts = textStyle();

class Register extends StatefulWidget {
  const Register({Key? key}) : super(key: key);

  @override
  State<Register> createState() => _RegisterState();
}

class _RegisterState extends State<Register> {
  late String username;
  late String email;
  late String password;

  GlobalKey<FormState> formstat = new GlobalKey<FormState>();
  controller control = controller();
  //
  signUp_method() async {
    var formdata = formstat.currentState;
    if (formdata!.validate()) {
      formdata.save();
      try {
        showLoading(context);
        await Firebase.initializeApp();
        UserCredential credential =
            await FirebaseAuth.instance.createUserWithEmailAndPassword(
          email: email,
          password: password,
        );
        return credential;
      } on FirebaseAuthException catch (e) {
        if (e.code == 'weak-password') {
          Navigator.of(context).pop();
          AwesomeDialog(
              context: context,
              title: "خطأ",
              body: Text("كلمة السر التي أدخلتها ضعيفة"))
            ..show();
        } else if (e.code == 'email-already-in-use') {
          Navigator.of(context).pop();

          AwesomeDialog(
              context: context,
              title: "خطأ",
              body: Text("الإيميل الذي أدخلته مسجّل بالفعل"))
            ..show();
        }
      } catch (e) {
        print(e);
      }
    } else {
      Navigator.of(context).pop();
    }
  }
  bool isEmail(String em) {
    String p =
        r'^(([^<>()[\]\\.,;:\s@\"]+(\.[^<>()[\]\\.,;:\s@\"]+)*)|(\".+\"))@((\[[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\])|(([a-zA-Z\-0-9]+\.)+[a-zA-Z]{2,}))$';

    RegExp regExp = new RegExp(p);

    return regExp.hasMatch(em);
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Center(
          child: Container(
            padding: EdgeInsets.symmetric(vertical: 80),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  "انضم إلى سَنُقْرِئُكَ",
                  style: ts.textstyle3,
                ),
                SizedBox(
                  height: 100,
                ),
                Form(key: formstat,
                    child: Container(
                  padding: EdgeInsets.symmetric(horizontal: 20),
                  margin: EdgeInsets.symmetric(horizontal: 20),
                  child: Column(
                    children: [
                      TextFormField(
                        decoration: InputDecoration(
                            icon: Icon(Icons.person),
                            hintText: "ادخل اسمك الثلاثي ",
                            labelText: " اسمك "),
                        onSaved: (val) {
                          username=val!;
                        },
                        validator: (val) {
                          if (val!.length > 50) {
                            return "لايمكن ان يكون الاسم اكثر من 50 حرفاَ";
                          }
                          if (val!.length < 2) {
                            return "لايمكن ان يكون الاسم اقل من حرفين";
                          }
                          return null;
                        },
                      ),
                      TextFormField(
                        decoration: InputDecoration(
                            icon: Icon(Icons.email),
                            hintText: "ادخل البريد الالكتروني",
                            labelText: " البريد الالكتروني"),
                        onSaved: (val) {
                          email=val!;
                        },
                        validator: (val) {
                          isEmail(val!);
                        },
                      ),
                      TextFormField(
                        obscureText: true,
                        obscuringCharacter: "*",
                        decoration: InputDecoration(
                            icon: Icon(Icons.lock_outline),
                            hintText: "ادخل كلمة المرور",
                            labelText: "كلمة المرور"),
                        onSaved: (val) {
                          password=val!;
                        },
                        validator: (val) {
                          if (val!.length > 20) {
                            return "يجب ان تكون كلمة المرور أقل من 20 حرف/رقم";
                          }
                          if (val!.length < 6) {
                            return "لا يمكن ان تكون كلمة المرور أقل من 6 أحرف/أرقام";
                          }
                          return null;
                        },
                      ),
                      SizedBox(
                        height: 60,
                      ),
            AnimatedButton(
              color: c.mycolor,
              text: 'التسجيل',
              buttonTextStyle: TextStyle(fontSize: 20),
              height: 40, pressEvent:  ()async {
              UserCredential response = await signUp_method();
              print("===========");
              print(response);
              if (response != null) {
                await FirebaseFirestore.instance
                    .collection("users")
                    .add({
                  "username": username,
                  "email": email,
                });
                Navigator.of(context)
                    .pushReplacementNamed("homePage");
              }
            },

            )  ,

                      SizedBox(
                        height: 10,
                      ),
                      Center(
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                           myinkewell().myinkweregister,
                            myinkewell().inkwellTextregister
                          ],
                        ),
                      )
                    ],
                  ),
                ))
              ],
            ),
          ),
        ),
      ),
    );
  }
}
