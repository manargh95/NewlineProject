import 'package:flutter/material.dart';
import 'package:sanoqreok/design/appBar.dart';
import '../design/quetosTamplate.dart';
import '../sqflite/db.dart';

class quotes extends StatefulWidget {
  const quotes({Key? key}) : super(key: key);

  @override
  State<quotes> createState() => _quotesState();
}

class _quotesState extends State<quotes> {
  List quetos = [];
  sqlDB mydb = sqlDB();
  bool isloading = true;

  Future readData() async {
    // mydb.insert("quetos",{
    //   "queto":
    //   "إنّ أقرب الناس للعقل والحكمة هو من يدرك نواقص نفسه وعدم خلوه من عيوب التفكير السليم",
    //   "bookname": "نظرية الفستق"
    // }    );
    // mydb.insert("quetos", {
    //   "queto":
    //   "إعلم أن الحب الحقيقي؛ هو أن تكون سعادة الطرف الأخر أكثر أهمية من سعادتك الشخصية.",
    //   "bookname": "مميز بالأصفر"
    // });
    // mydb.insert("quetos", {
    //   "queto":
    //   "اذا اردت ان تعيش فلابد ان تعتاد الالم ،الالم لا يقتل اليأس يفعل ذلك",
    //   "bookname": "اخلع حذاءك"
    // });
    // mydb.insert("quetos", {
    //   "queto":
    //   "ابتسم وأظهر للعالم مدى جمالك . كن مراعياً مشاعر الآخرين من حولك وتذكر تأثيرك عليهم",
    //   "bookname": "ابق قوياَ 365 يوم في السنة"
    // });
    // mydb.insert("quetos", {
    //   "queto":
    //   "الموت موجع يا وعد ...ولكن الاكثر وجعا هم أولئك الذين يموتون فينا وهم احياء ! ما ابشع ان يصبح قلب المرء قبرا لشخص ما زال يمشي علي الأرض !",
    //   "bookname": "ليطمئن قلبي"
    // });
    // mydb.insert("quetos", {
    //   "queto":
    //   "عندما نحلم بشئ ، فإن الكون بأسره يطاوعنا على تحقيق حلمنا.",
    //   "bookname": "الخيميائي"
    // });
    // mydb.insert("quetos", {
    //   "queto":
    //   " أن أسير بحجابي الفضفاض مستورة كاللؤلؤة المكنون. لا تهمني نظرات إعجاب فقدتها بغطائي. لأن نظرة رضا من الله عني تغنيني و تكفيني.",
    //   "bookname": "كوني صحابية"
    // });
    // mydb.insert("quetos", {
    //   "queto":
    //   "ان كنت تعتقد انك جزء صغير من هذا العالم تذكر ان ظهورك في العالم كان حدثا استثنائيا نادرا..  ",
    //   "bookname": "نظرية الفستق2"
    // });
    List<Map> response = await mydb.readData("SELECT * FROM quetos");
    quetos.addAll(response);
    isloading = false;
    if (this.mounted) {
      setState(() {});
    }
  }

  @override
  void initState() {
    readData();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: simpleappBar("اقتباسات"),
        body:
    
            ListView.builder(
                shrinkWrap: true,
                itemCount: quetos.length,
                itemBuilder: (context, i) {
                  return Card(
                    child: ListTile(
                      title: tamplate(
                          "${quetos[i]['queto']}", "${quetos[i]['bookname']}"),
                    ),
                  );
                }));
  }
}
