import 'package:to_post_application/components/drop_down_list_expansible.dart';
import 'package:to_post_application/entities/character_entity.dart';
import 'package:to_post_application/resources/database_context.dart';

Future<List<DropDownListExpansible>> generateFetchStartAsync(DbProvider _db) async {
  List<DropDownListExpansible> objRet;

  var teste = await _db.fetchItems("Character");

  for (Map i in teste) {
    CharacterModel teste3 = CharacterModel.fromMap(i);

    objRet.add(DropDownListExpansible(
      headerValue: '${teste3.name}',
      expandedValue: 'Lv: ${teste3.level}, ${teste3.title}',
      id: teste3.id,
    ));
  }

  return objRet;
}

// List<DropDownListExpansible> generateItems(int numberOfItems) {
//   return List.generate(numberOfItems, (int index) {
//     return DropDownListExpansible(
//       headerValue: 'Testando $index',
//       expandedValue: 'Este é o dropdown expansível $index!',
//     );
//   });
// }

List<DropDownListExpansible> generateDropDownItemList(int numberOfItems, String headerValue, String expandedValue) {
  return List.generate(numberOfItems, (int index) {
    return DropDownListExpansible(headerValue: headerValue, expandedValue: expandedValue);
  });
}

DropDownListExpansible generatedropDownItem(String headerValue, String expandedValue) {
  return DropDownListExpansible(headerValue: headerValue, expandedValue: expandedValue);
}
