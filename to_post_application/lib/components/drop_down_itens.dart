import 'package:to_post_application/components/drop_down_list_expansible.dart';
import 'package:to_post_application/entities/character_entity.dart';
import 'package:to_post_application/resources/database_context.dart';

// List<DropDownListExpansible> generateFetchStartAsync(DbProvider _db) {
//   List<DropDownListExpansible> objRet;
//   var teste = _db.fetchItems("Character").then((result) => result).whenComplete(() {
//     for (Map resultMap in result) {
//       CharacterModel character = CharacterModel.fromMap(resultMap);

//       objRet.add(DropDownListExpansible(
//         headerValue: '${character.name}',
//         expandedValue: 'Lv: ${character.level}, ${character.title}',
//         id: character.id,
//       ));
//     }
//   });

//   // for (Map i in teste) {
//   //   CharacterModel teste3 = CharacterModel.fromMap(i);

//   //   objRet.add(DropDownListExpansible(
//   //     headerValue: '${teste3.name}',
//   //     expandedValue: 'Lv: ${teste3.level}, ${teste3.title}',
//   //     id: teste3.id,
//   //   ));
//   // }

//   return objRet;
// }

Future<List<DropDownListExpansible>> generateFetchStartAsync(DbProvider _db) async {
  List<DropDownListExpansible> objRet = List<DropDownListExpansible>();
  // await _db.initDb();
  var result = await _db.fetchItems("Character");

  for (Map resultMap in result) {
    CharacterModel character = CharacterModel.fromMap(resultMap);
    objRet.add(DropDownListExpansible(
        headerValue: '${character.name} - ${character.level}',
        expandedValue: '${character.accountStatus} - Residence: ${character.residence}',
        id: character.id,
        subTitleValue: '${character.title} - Achv Pts:${character.achievementPoints}'));
  }

  return objRet;
}

Future deleteCharacterById(DbProvider _db, int id) async {
  int qt = await _db.deleteItem("Character", id);
}

List<DropDownListExpansible> generateItemsTeste(int numberOfItems) {
  return List.generate(numberOfItems, (int index) {
    return DropDownListExpansible(
      headerValue: 'Testando $index',
      expandedValue: 'Este é o dropdown expansível $index!',
    );
  });
}

List<DropDownListExpansible> generateDropDownItemList(int numberOfItems, String headerValue, String expandedValue) {
  return List.generate(numberOfItems, (int index) {
    return DropDownListExpansible(headerValue: headerValue, expandedValue: expandedValue);
  });
}

DropDownListExpansible generatedropDownItem(String headerValue, String expandedValue) {
  return DropDownListExpansible(headerValue: headerValue, expandedValue: expandedValue);
}
