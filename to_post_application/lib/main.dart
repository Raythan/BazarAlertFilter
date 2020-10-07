import 'package:flutter/material.dart';
import 'package:to_post_application/entities/entity_sample.dart';
import 'package:to_post_application/resources/database_context.dart';
//import 'package:to_post_application/telas/principal.dart';

//oid main() => runApp(Principal());

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  MemoDbProvider memoDb = MemoDbProvider();

  final memo = MemoModel(
    id: 1,
    title: 'Title 1',
    content: 'Note 1',
  );

  await memoDb.addItem(memo);
  var memos = await memoDb.fetchMemos();
  print(memos[0].title); //Title 1

// void forEach(void f(var element)) {
//   for (var element in memos) f(element);
// }

  for (var element in memos) {
    print(element.title);
  }

  final newmemo = MemoModel(
    id: memo.id,
    title: 'Title 1 changed',
    content: memo.content,
  );

  await memoDb.updateMemo(memo.id, newmemo);
  var updatedmemos = await memoDb.fetchMemos();
  print(updatedmemos[0].title); //Title 1 changed

  await memoDb.deleteMemo(memo.id);
  print(await memoDb.fetchMemos()); //[]
}
