import 'package:to_post_application/components/drop_down_list_expansible.dart';

List<DropDownListExpansible> generateItems(int numberOfItems) {
  return List.generate(numberOfItems, (int index) {
    return DropDownListExpansible(
      headerValue: 'Testando $index',
      expandedValue: 'Este é o dropdown expansível $index!',
    );
  });
}
