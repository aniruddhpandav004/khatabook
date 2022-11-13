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

  Future<Database> Check() async {
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
      db.execute(query);
    });
  }
  void insertData(String n1, String m1, String a1) async {
    db = await Check();
    db!.insert("khatabook", {'name': n1, 'mobile': m1, 'address': a1});
  }

  Future<List<Map>> readData() async {
    db = await Check();
    String query = "SELECT * FROM khatabook";
    List<Map> booklist = await db!.rawQuery(query, null);
    return booklist;
  }
  void deleteData(String id) async {
    db = await Check();
    db!.delete('khatabook', where: 'id=?', whereArgs: [int.parse(id)]);
  }

  void updateData(String id, String n1, String a1, String m1) async {
    db = await Check();
    db!.update('khatabook', {'name': n1, 'mobile': m1, "address": a1},
        where: 'id=?', whereArgs: [int.parse(id)]);
  }
}