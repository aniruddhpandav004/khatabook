// import 'dart:io';
// import 'package:path/path.dart';
// import 'package:path_provider/path_provider.dart';
// import 'package:sqflite/sqflite.dart';
//
// class DbHelper {
//   Database? db;
//
//   Future<Database> check() async {
//     if (db != null) {
//       return db!;
//     } else {
//       return await create();
//     }
//   }
//
//   Future<Database> create() async {
//     Directory folder = await getApplicationDocumentsDirectory();
//     String path = join(folder.path, "Student.db");
//     return openDatabase(path, version: 1, onCreate: (db, version) {
//       String query =
//           "CREATE TABLE khatabook(id INTEGER PRIMARY KEY AUTOINCREMENT,name TEXT,std TEXT,mobile TEXT)";
//       db.execute(query);
//     });
//   }
//
//   void insertData(String n1, String m1, String s1) async {
//     db = await check();
//     db!.insert("khatabook", {"name": n1, "mobile": m1, "std": s1});
//   }
//   Future<List<Map>> readData()async{
//     db = await check();
//     String query = "SELECT * FROM khatabook";
//     List<Map> booklist = await db!.rawQuery(query,null);
//     return booklist;
//   }
//   void deleteData(String id)async{
//     db = await check();
//     db!.delete("khatabook",where: "id = ?",whereArgs:[int.parse(id)]);
//   }
//
//   void updateData(String id,String n1,String s1,String m1)async{
//     db = await check();
//     db!.update("khatabook", {"name":n1,"mobile":m1,"std": s1},where: "id = ?",whereArgs: [int.parse(id)]);
//   }
// }

import 'dart:io';

import 'package:path_provider/path_provider.dart';
import 'package:sqflite/sqflite.dart';
import 'package:path/path.dart';

class DbHelper {
  Database?db;

  Future<Database> check() async {
    if (db != null) {
      return db!;
    }
    else {
      return await createDatabase();
    }
  }

  Future<Database> createDatabase() async {
    Directory folder = await getApplicationDocumentsDirectory();
    String path = join(folder.path, "rnw.db");
    return openDatabase(path, version: 1, onCreate: (db, version) {
      String query =
          "CREATE TABLE khatabook(id INTEGER PRIMARY KEY AUTOINCREMENT,name TEXT,address TEXT,mobile TEXT)";
      String query1 =
          "CREATE TABLE product(id INTEGER PRIMARY KEY AUTOINCREMENT,name TEXT,amount TEXT,date TEXT,time TEXT,client_id INTEGER,payment_status INTEGER)";
      db.execute(query1);
      db.execute(query);
    });
  }
  void insertData(String n1, String m1, String a1) async {
    db = await check();
    db!.insert("khatabook", {'name': n1, 'mobile': m1, 'address': a1});
  }

  Future<List<Map>> readData() async {
    db = await check();
    String query = "SELECT * FROM khatabook";
    List<Map> booklist = await db!.rawQuery(query, null);
    return booklist;
  }
  void deleteData(String id) async {
    db = await check();
    db!.delete('khatabook', where: 'id=?', whereArgs: [int.parse(id)]);
  }

  void updateData(String id, String n1, String a1, String m1) async {
    db = await check();
    db!.update('khatabook', {'name': n1, 'mobile': m1, "address": a1},
        where: 'id=?', whereArgs: [int.parse(id)]);
  }

  void productinsertData(String n1, String a1, String d1,String t1,int clientId,int status) async {
    db = await check();
    db!.insert("product", {"name": n1, "amount":a1, "date": d1, "time": t1,"client_id":clientId,"payment_status":status});
  }

  Future<List<Map>> productreadData(String id) async {
    db = await check();
    String query = "SELECT * FROM product where client_id = $id";
    List<Map> productlist = await db!.rawQuery(query, null);

    return productlist;
  }

  Future<List<Map>> productonlyreadData() async {
    db = await check();
    String query = "SELECT * FROM product";
    List<Map> productlist = await db!.rawQuery(query, null);

    return productlist;
  }

  void productdeleteData(String id) async {
    db = await check();
    db!.delete("product", where: "id = ?", whereArgs: [int.parse(id)]);
  }

  void productupdateData(String id, String n1, String a1, String d1,String t1) async {
    db = await check();
    db!.update("product", { "date": d1, "time": t1,"name": n1, "amount":a1,},
        where: "id = ?", whereArgs: [int.parse(id)]);
  }
}