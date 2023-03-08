import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:sanoqreok/appLocale/appLocale.dart';
import 'package:sanoqreok/auth/Login.dart';
import 'package:sanoqreok/auth/Register.dart';
import 'package:sanoqreok/myApp/favorite.dart';
import 'design/customeColor.dart';
import 'package:get/get.dart';
import 'myApp/homePage.dart';
import 'package:flutter_localizations/flutter_localizations.dart';

customeColor_ c = new customeColor_();

bool? islogin;

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  await initialization(null);
  var user = FirebaseAuth.instance.currentUser;
  if (user == null) {
    islogin = false;
  } else {
    islogin = true;
  }
  runApp(const MyApp());
}

Future initialization(BuildContext? context) async {
  await Future.delayed(Duration(milliseconds: 10));
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
        localizationsDelegates: [
          AppLocale.delegate,
          GlobalMaterialLocalizations.delegate,
          GlobalWidgetsLocalizations.delegate,
          GlobalCupertinoLocalizations.delegate,
        ],
        supportedLocales: [Locale("ar", ""), Locale("en", "")],
        localeResolutionCallback: (currentLang, supportLang) {
          if (currentLang != null) {
            for (Locale locale in supportLang) {
              if (locale.languageCode == currentLang.languageCode) {
                return currentLang;
              }
            }
            return supportLang.first;
          }
        },
        debugShowCheckedModeBanner: false,
        theme: ThemeData(
          buttonColor: c.mycolor,
          accentColor: Colors.white,
          buttonTheme: ButtonThemeData(
              textTheme: ButtonTextTheme.accent,
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(15))),
          fontFamily: "22326-alarabiyafont",
          textTheme: TextTheme(
              headline2: TextStyle(
                  color: c.mycolor,
                  fontSize: 25,
                  fontFamily: "22326-alarabiyafont")),
          primarySwatch: c.mycolor,
        ),
        routes: {
          "login": (context) => Login(),
          "Register": (context) => Register(),
          "homePage": (context) => homePage(),
          'favorite': (context) {
            if (islogin == true) {
              return favorite();
            } else {
              return Scaffold(
                body: Center(
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Text('لا يمكنك الدخول الى المفضلة'),
                      Text('يجب عليك تسجيل الدخول أولاً'),
                      ElevatedButton(
                        onPressed: () => Navigator.pop(context),
                        child: Text('تم'),
                      ),
                      ElevatedButton(
                        onPressed: () =>
                            Navigator.of(context).pushNamed("login"),
                        child: Text('تسجيل الدخول'),
                      ),
                    ],
                  ),
                ),
              );
            }
          },
        },
        home: Directionality(
          textDirection: TextDirection.ltr,
          child: islogin == false ? Login() : homePage(),
        ));
  }
}
