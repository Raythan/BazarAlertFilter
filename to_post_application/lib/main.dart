import 'package:flutter/material.dart';
import 'package:to_post_application/entities/character_entity.dart';
import 'package:to_post_application/entities/entity_sample.dart';
import 'package:to_post_application/resources/database_context.dart';
import 'package:to_post_application/telas/principal.dart';

void main() => runApp(Principal());

// void main() async {
//   WidgetsFlutterBinding.ensureInitialized();
//   MemoDbProvider memoDb = MemoDbProvider();

//   // final memo = MemoModel(title: 'Title 1', content: 'Note 1');
//   // await memoDb.addItem("Memos", memo);
//   // final memo2 = MemoModel(title: 'Title 2', content: 'Note 2');
//   // await memoDb.addItem("Memos", memo2);
//   // final memo3 = MemoModel(title: 'Title 3', content: 'Note 3');
//   // await memoDb.addItem(memo3);
//   // final memo4 = MemoModel(title: 'Title 4', content: 'Note 4');
//   // await memoDb.addItem(memo4);

//   var memos = await memoDb.fetchItems("Memos");
//   //print(memos[0].title); //Title 1

//   // void forEach(void f(var element)) {
//   //   for (var element in memos) f(element);
//   // }

//   List<MemoModel> teste2 = List();

//   memos.forEach((element) {
//     teste2.add(MemoModel.fromMap(element));
//   });

//   for (var element in memos) {
//     print(element["id"]);
//   }

//   final newmemo = MemoModel(
//     id: memos[0][""].id,
//     title: 'Title 1 changed',
//     content: memos[0][""].content,
//   );

//   await memoDb.updateItem("Mesmos", memos[0][""].id, newmemo);
//   var updatedmemos = await memoDb.fetchItems("Memos");
//   print(updatedmemos[0][""].title); //Title 1 changed

//   for (var element in memos) {
//     print("Deletando: " + element[""].title);
//     await memoDb.deleteItem("Memos", element[""].id);
//   }

//   print(await memoDb.fetchItems("Memos")); //[]
// }

// void main() async {
//   WidgetsFlutterBinding.ensureInitialized();
//   DbProvider db = DbProvider();
//   //db.init();

//   final character = CharacterModel(
//       //id: 1,
//       accountStatus: "Free Account",
//       achievementPoints: 2,
//       level: 200,
//       name: "Aegda Anden",
//       residence: "Venore",
//       sex: "Male",
//       title: "No Titles",
//       vocation: "Knight",
//       world: "Celebra");
//   await db.addItem("Character", character);

//   // final memo2 = MemoModel(title: 'Title 2', content: 'Note 2');
//   // await memoDb.addItem("Memos", memo2);
//   // final memo3 = MemoModel(title: 'Title 3', content: 'Note 3');
//   // await memoDb.addItem(memo3);
//   // final memo4 = MemoModel(title: 'Title 4', content: 'Note 4');
//   // await memoDb.addItem(memo4);

//   var characterRow = await db.fetchItems("Character");
//   //print(memos[0].title); //Title 1

//   // void forEach(void f(var element)) {
//   //   for (var element in memos) f(element);
//   // }

//   List<CharacterModel> rowList = List();

//   characterRow.forEach((i) {
//     rowList.add(CharacterModel.fromMap(i));
//   });

//   for (var element in characterRow) {
//     print(element);
//   }

//   final newmemo = CharacterModel(
//     id: characterRow[0]["id"],
//     title: 'Title 1 changed',
//     accountStatus: "Account Status Changed",
//   );

//   await db.updateItem("Character", characterRow[0]["id"], newmemo);
//   var updatedmemos = await db.fetchItems("Character");
//   print(updatedmemos); //Title 1 changed

//   for (var element in characterRow) {
//     //print("Deletando: " + element["0"] + " " + element["1"]);
//     print(element);
//     await db.deleteItem("Character", element["id"]);
//   }

//   print(await db.fetchItems("Character")); //[]
// }
