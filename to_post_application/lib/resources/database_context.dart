import 'package:sqflite/sqflite.dart'; //sqflite package
import 'package:path_provider/path_provider.dart'; //path_provider package
import 'package:path/path.dart'; //used to join paths
//import './memo_model.dart'; //import model class
import 'dart:io';
import 'dart:async';

//import 'package:to_post_application/entities/entity_sample.dart';

class DbProvider {
  Database _db;

  Future<Database> get db async {
    if (_db != null) {
      return _db;
    } else {
      _db = await initDb();
      return _db;
    }
  }

  Future<Database> initDb() async {
    Directory directory = await getApplicationDocumentsDirectory(); //returns a directory which stores permanent files
    final path = join(directory.path, "localdata.db"); //create path to database

    //open the database or create a database if there isn't any
    return await openDatabase(
      path,
      version: 1,
      onCreate: (Database db, int version) async {
        //await db.execute("""DROP TABLE IF EXISTS Memos""");
        //await db.execute("DROP TABLE IF EXISTS Character");
        //await db.execute("""CREATE TABLE IF NOT EXISTS Memos(id INTEGER PRIMARY KEY AUTOINCREMENT, title TEXT, content TEXT)""");
        await db.execute(
            "CREATE TABLE Character(id INTEGER PRIMARY KEY AUTOINCREMENT, name TEXT, title TEXT, sex TEXT, vocation TEXT, level INTEGER, achievementPoints INTEGER, world TEXT, residence TEXT, accountStatus TEXT)");
      },
      onOpen: (db) => {
        db.execute(
            "CREATE TABLE IF NOT EXISTS Character(id INTEGER PRIMARY KEY AUTOINCREMENT, name TEXT, title TEXT, sex TEXT, vocation TEXT, level INTEGER, achievementPoints INTEGER, world TEXT, residence TEXT, accountStatus TEXT)")
      },
    );
  }

  //INSERT
  Future<int> addItem(String tableName, dynamic item) async {
    final db = await initDb();
    return db.insert(
      tableName,
      item.toMap(),
      conflictAlgorithm: ConflictAlgorithm.ignore,
    );
  }

  //READ/SELECT
  Future<List<Map>> fetchItems(String tableName) async {
    final db = await initDb();
    final maps = await db.query(tableName);

    return maps;
  }

  //READ/SELECT
  Future<Map> fetchItemsByName(String tableName, String name) async {
    final db = await initDb();
    final maps = await db.query(tableName, where: "name = ?", whereArgs: [name]);

    return maps.firstWhere((element) => element.length > 0);
  }

  //DELETE
  Future<int> deleteItem(String tableName, int id) async {
    final db = await initDb();
    int result = await db.delete(tableName, where: "id = ?", whereArgs: [id]);

    return result;
  }

  //UPDATE
  Future<int> updateItem(String tableName, int id, dynamic item) async {
    final db = await initDb();

    int result = await db.update(tableName, item.toMap(), where: "id = ?", whereArgs: [id]);
    return result;
  }

  //CLOSE
  Future close() async {
    Database dbClose = await db;
    dbClose.close();
  }
}
