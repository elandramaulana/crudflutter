import 'dart:async';
import 'package:path/path.dart';
import 'package:sqflite/sqflite.dart';

class UserRepo {
  late Database db;

  UserRepo() {
    initDB();
  }

  Future<void> initDB() async{
    try{
      db = await openDatabase(join(await getDatabasesPath(), 'user.db'),
      onCreate: (db, version){
        return db.execute(
          "CREATE TABLE users(id INTEGER PRIMARY KEY AUTOINCREMENT, name TEXT, job TEXT, createdAt TEXT");
      },
      version: 1,
      
      );
    }catch(e){
      print('Error $e');
      throw Exception('Failed init db');
    };
  }
}