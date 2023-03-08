import 'package:animated_button/animated_button.dart' as Button;
import 'package:awesome_dialog/awesome_dialog.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:sanoqreok/design/inkwell.dart';
import 'package:sanoqreok/design/text.dart';
import '../component/alertLoding.dart';
import '../design/customeColor.dart';
import 'package:animated_text_kit/animated_text_kit.dart';

customeColor_ c = customeColor_();
textStyle ts = textStyle();

class Login extends StatefulWidget {
  const Login({Key? key}) : super(key: key);

  @override
  State<Login> createState() => _LoginState();
}

class _LoginState extends State<Login> {
  var email, password;

  GlobalKey<FormState> formstat = new GlobalKey<FormState>();

  //
  signIn() async {
    var formdata = formstat.currentState;
    if (formdata!.validate()) {
      formdata.save();
      try {
        showLoading(context);
        await Firebase.initializeApp();
        UserCredential credential = await FirebaseAuth.instance
            .signInWithEmailAndPassword(email: email, password: password);
        Navigator.of(context).pop(); // close the loading dialog
        return credential;
      } on FirebaseAuthException catch (e) {
        Navigator.of(context).pop(); // close the loading dialog
        if (e.code == 'user-not-found') {
          AwesomeDialog(
              context: context,
              title: "خطأ",
              body: Text("لا يوجد مستخدم مسجّل بهذا الإيميل"))
            ..show();
        } else if (e.code == 'wrong-password') {
          AwesomeDialog(
              context: context,
              title: "خطأ",
              body: Text("كلمة المرور التي أدخلتها غير صحيحة"))
            ..show();
        }
        else {
          AwesomeDialog(
            context: context,
            title: "خطأ",
            body: Text("البريد الالكتروني او كلمة المرور غير صحيحة"),
          )..show();
        }
      } catch (e) {
        Navigator.of(context).pop(); // close the loading dialog
        AwesomeDialog(
            context: context, title: "خطأ", body: Text("حدث خطأ غير معروف: $e"))
          ..show();
      }
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
        child: Column(
          // mainAxisSize: MainAxisSize.min,
          children: [
            Container(
              height: 321,
              width: double.maxFinite,
              child: Center(
                child: Image.asset("assets/loginn.png"),
              ),
            ),
            Container(
              padding: EdgeInsets.all(20),
              child: AnimatedTextKit(
                animatedTexts: [
                  TyperAnimatedText("كن واحداَ من عائلتنا وشاركنا القراءة",
                      textStyle: ts.textstyle3,
                      speed: Duration(microseconds: 100000))
                ],
              ),
            ),
            Form(
                key: formstat,
                child: Container(
                  padding: EdgeInsets.symmetric(horizontal: 20),
                  margin: EdgeInsets.symmetric(horizontal: 20),
                  child: Column(
                    children: [
                      TextFormField(
                        decoration: InputDecoration(
                            icon: Icon(Icons.email),
                            hintText: "ادخل البريد الالكتروني",
                            labelText: " البريد الالكتروني"),
                        onSaved: (val) {
                          email = val!;
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
                          password = val!;
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
                        height: 20,
                      ),
                      AnimatedButton(
                        color: c.mycolor,
                        text: 'تسجيل الدخول',
                        buttonTextStyle: TextStyle(fontSize: 20),
                        height: 40,
                        pressEvent: () async {
                          UserCredential credential = await signIn();
                          if (credential != null) {
                            Navigator.of(context)
                                .pushReplacementNamed("homePage");
                          }
                        },
                      ),
                      SizedBox(
                        height: 10,
                      ),
                      Center(
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            myinkewell().myinkwelogin,
                            myinkewell().inkwellTextlogin
                          ],
                        ),
                      ),
                      myinkewell().myinkguest
                    ],
                  ),
                ))
          ],
        ),
      ),
    );
  }
}
