import 'package:to_post_application/components/drop_down_list_expansible.dart';
import 'package:to_post_application/entities/character_entity.dart';
import 'package:to_post_application/resources/database_context.dart';

List<DropDownListExpansible> generateFetchStartAsync(DbProvider _db) {
  List<DropDownListExpansible> objRet;

  Future<List<Map>> teste = _db.fetchItems("Character").then((value) => value);

  // for (Map i in teste) {
  //   CharacterModel teste3 = CharacterModel.fromMap(i);

  //   objRet.add(DropDownListExpansible(
  //     headerValue: '${teste3.name}',
  //     expandedValue: 'Lv: ${teste3.level}, ${teste3.title}',
  //     id: teste3.id,
  //   ));
  // }

  return objRet;
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
