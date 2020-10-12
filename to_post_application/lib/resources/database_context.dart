import 'package:sqflite/sqflite.dart'; //sqflite package
import 'package:path_provider/path_provider.dart'; //path_provider package
import 'package:path/path.dart'; //used to join paths
//import './memo_model.dart'; //import model class
import 'dart:io';
import 'dart:async';

//import 'package:to_post_application/entities/entity_sample.dart';

class DbProvider {
  Future<Database> init() async {
    Directory directory = await getApplicationDocumentsDirectory(); //returns a directory which stores permanent files
    final path = join(directory.path, "localdata.db"); //create path to database

    //open the database or create a database if there isn't any
    return await openDatabase(path, version: 1, onCreate: (Database db, int version) async {
      //await db.execute("""DROP TABLE IF EXISTS Memos""");
      await db.execute("""DROP TABLE IF EXISTS Character""");
      //await db.execute("""CREATE TABLE IF NOT EXISTS Memos(id INTEGER PRIMARY KEY AUTOINCREMENT, title TEXT, content TEXT)""");
      await db.execute(
          """CREATE TABLE Character(id INTEGER PRIMARY KEY AUTOINCREMENT, name TEXT, title TEXT, sex TEXT, vocation TEXT, level INTEGER, achievementPoints INTEGER, world TEXT, residence TEXT, accountStatus TEXT)""");
    });
  }

  //INSERT
  Future<int> addItem(String tableName, dynamic item) async {
    //returns number of items inserted as an integer
    final db = await init(); //open database
    return db.insert(
      tableName,
      item.toMap(), //toMap() function from MemoModel
      conflictAlgorithm: ConflictAlgorithm.ignore, //ignores conflicts due to duplicate entries
    );
  }

  //READ/SELECT
  Future<List<Map>> fetchItems(String tableName) async {
    //returns the memos as a list (array)

    final db = await init();
    final maps = await db.query(tableName); //query all the rows in a table as an array of maps
    // maps.forEach((element) {
    //   print(element);
    // });
    return maps;
    // return List.generate(maps.length, (i) {
    //   //create a list of memos
    //   return MemoModel(
    //     id: maps[i]['id'],
    //     title: maps[i]['title'],
    //     content: maps[i]['content'],
    //   );
    // });
  }

  //DELETE
  Future<int> deleteItem(String tableName, int id) async {
    //returns number of items deleted
    final db = await init();

    int result = await db.delete(tableName, //table name
        where: "id = ?",
        whereArgs: [id] // use whereArgs to avoid SQL injection
        );

    return result;
  }

  //UPDATE
  Future<int> updateItem(String tableName, int id, dynamic item) async {
    // returns the number of rows updated
    final db = await init();

    int result = await db.update(tableName, item.toMap(), where: "id = ?", whereArgs: [id]);
    return result;
  }

  // //READ/SELECT
  // Future<List<MemoModel>> fetchMemos() async {
  //   //returns the memos as a list (array)

  //   final db = await init();
  //   final maps = await db.query("Memos"); //query all the rows in a table as an array of maps

  //   return List.generate(maps.length, (i) {
  //     //create a list of memos
  //     return MemoModel(
  //       id: maps[i]['id'],
  //       title: maps[i]['title'],
  //       content: maps[i]['content'],
  //     );
  //   });
  // }

  // //DELETE
  // Future<int> deleteMemo(int id) async {
  //   //returns number of items deleted
  //   final db = await init();

  //   int result = await db.delete("Memos", //table name
  //       where: "id = ?",
  //       whereArgs: [id] // use whereArgs to avoid SQL injection
  //       );

  //   return result;
  // }

  // //UPDATE
  // Future<int> updateMemo(int id, MemoModel item) async {
  //   // returns the number of rows updated

  //   final db = await init();

  //   int result = await db.update("Memos", item.toMap(), where: "id = ?", whereArgs: [id]);
  //   return result;
  // }
}
