import 'package:path/path.dart';
import 'package:sqflite/sqflite.dart';

class sqlDB {
  static Database? _db;

  //بدي اتاكد انو انعمل انشاء للداتابيس وازا انعمللها انشاء ما تنتشئ مرة تانية
  Future<Database?> get db async {
    if (_db == null) {
      _db = await initialDB();
      return _db;
    } else {
      return _db;
    }
  }

//local data base

  initialDB() async {
//path to save data base
    String DBpath = await getDatabasesPath(); //مسار افتراضي
    //اسم الداتابيس
    String path = join(DBpath, "DB_Name.db");
    //to open data base :
    Database db = await openDatabase(path,
        onCreate: _onCreate, version: 1, onUpgrade: _onUpgrade);
    return db;
  }

  //هادي الميثود عشان لو بدنا نعدل عالداتا بيس وما نرجع ننشئها تاني لانو حيعطينا خطأ فالحل في الابقريد
  _onUpgrade(Database db, int oldVersion, int newVersion) async {
    await db.execute("");

    print("onUpgrade");
  }

  //هادي الميثود من نوع فيوتشر وتقبل متغيرين
  _onCreate(Database db, int version) async {
    //لو بدي اعمل اكتر من جدول

    Batch batch = db.batch();

    batch.execute('''
    CREATE TABLE "quetos" (
      "id" INTEGER NOT NULL PRIMARY KEY AUTOINCREMENT,
      "queto" TEXT NOT NULL ,
      "bookname" TEXT NOT NULL      
    
      )
        ''');
    await batch.commit();

    print("created DB and table ===========");
  }

  //the function will deal with select
  readData(String sql) async {
    //SELECT
    Database? mydb = await db; //db here to sea is it initialized or not
    //response >> بنخزن فيها القيمة الجاية من الداتا بيس
    List<Map> response = await mydb!.rawQuery(sql);
    return response;
  }

  //the function will deal with insert
  insertData(String sql) async {
    //INSERT
    Database? mydb = await db; //db here to sea is it initialized or not
    //response >> بنخزن فيها القيمة الجاية من الداتا بيس
    int response = await mydb!.rawInsert(sql);
    return response;
  }

  //the function will deal with update
  updateData(String sql) async {
    //UPDATE
    Database? mydb = await db; //db here to sea is it initialized or not
    //response >> بنخزن فيها القيمة الجاية من الداتا بيس
    int response = await mydb!.rawUpdate(sql);
    return response;
  }

  //the function will deal with delete
  deleteData(String sql) async {
    //DELETE
    Database? mydb = await db; //db here to sea is it initialized or not
    //response >> بنخزن فيها القيمة الجاية من الداتا بيس
    int response = await mydb!.rawDelete(sql);
    return response;
  }

  //delete DB

  deleteDB() async {
    String DBpath = await getDatabasesPath(); //مسار افتراضي
    String path = join(DBpath, "DB_Name.db");
    await deleteDatabase(path);
  }

//==========================================================
  //sqflite>> عملت مجموعة من الفنكشن الجاهزة لتسهيل العمليات على قاعدة البيانات مثل الاضافة او التعديل او الحذف

  read(String table) async {
    //SELECT
    Database? mydb = await db; //db here to sea is it initialized or not
    //response >> بنخزن فيها القيمة الجاية من الداتا بيس
    List<Map> response = await mydb!.query(table);
    return response;
  }

  //the function will deal with insert
  insert(String table, Map<String, Object?> values) async {
    //INSERT
    Database? mydb = await db; //db here to sea is it initialized or not
    //response >> بنخزن فيها القيمة الجاية من الداتا بيس
    int response = await mydb!.insert(table, values);

    return response;
  }

  //the function will deal with update
  update(String table, Map<String, Object?> values, String? mywhere) async {
    //UPDATE
    Database? mydb = await db; //db here to sea is it initialized or not
    //response >> بنخزن فيها القيمة الجاية من الداتا بيس
    int response = await mydb!.update(table, values, where: mywhere);
    return response;
  }

  //the function will deal with delete
  delete(String table, String? mywhere) async {
    //DELETE
    Database? mydb = await db; //db here to sea is it initialized or not
    //response >> بنخزن فيها القيمة الجاية من الداتا بيس
    int response = await mydb!.delete(table, where: mywhere);
    return response;
  }
}
