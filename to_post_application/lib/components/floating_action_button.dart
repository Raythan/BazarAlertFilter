import 'package:flutter/material.dart';
import 'package:to_post_application/components/drop_down_list_expansible.dart';
import 'package:to_post_application/components/drop_down_itens.dart';
import 'package:to_post_application/entities/character_entity.dart';
import 'package:to_post_application/resources/database_context.dart';
import 'package:to_post_application/resources/processar_request.dart';

String _characterName = "";
TextEditingController _characterNameController = TextEditingController();
String de = " ";
String para = "+";

// Widget retornaFloatingActionButton(List<DropDownListExpansible> data, BuildContext context, DbProvider db) {
Widget retornaFloatingActionButton(Future<List<DropDownListExpansible>> data, BuildContext context, DbProvider db) {
  return Builder(
      builder: (context) => Padding(
            padding: const EdgeInsets.symmetric(vertical: 10.0),
            child: FloatingActionButton(
              onPressed: () {
                //Scaffold.of(context).showSnackBar(SnackBar(content: Text('Seu envio está sendo processado.')));
                showDialog(
                  context: context,
                  builder: (BuildContext context) {
                    // return object of type Dialog
                    return AlertDialog(
                      title: Text("Insira o nome:"),
                      //content: Text("Alert Dialog body"),
                      content: TextFormField(controller: _characterNameController),
                      //content: Text(_characterName),
                      actions: <Widget>[
                        FlatButton(
                          child: Icon(Icons.search),
                          onPressed: () async {
                            //CharacterModel teste2 = CharacterModel.fromJson();
                            var dataFromApi = await getCharacterData(_characterNameController.text.replaceAll(de, para));
                            //Future<String> teste = await getDataString().then((value) => print(value));
                            final CharacterModel character = CharacterModel.fromMapDataApi(dataFromApi);
                            WidgetsFlutterBinding.ensureInitialized();
                            await db.addItem("Character", character);
                            Navigator.of(context).pop();
                          },
                        ),
                        FlatButton(
                          child: Text("Fechar"),
                          onPressed: () {
                            Navigator.of(context).pop();
                          },
                        ),
                        FlatButton(
                          child: Icon(Icons.access_alarm),
                          onPressed: () async {
                            WidgetsFlutterBinding.ensureInitialized();
                            var teste = await db.fetchItems("Character");
                            CharacterModel teste3 = CharacterModel.fromMap(teste.last);
                            //ExpansionPanel teste4 = retornaTeste(teste3);
                            // data.add(retornaTeste(teste3));
                            // data.add(generatedropDownItem(teste3.name, teste3.vocation));
                            data.then((value) => value.add(generatedropDownItem(teste3.name, teste3.vocation)));
                            Navigator.of(context).pop();
                          },
                        ),
                      ],
                    );
                  },
                );
              },
              child: Icon(Icons.add),
            ),
          ));

  // return Builder(
  //     builder: (context) => Padding(
  //           padding: const EdgeInsets.symmetric(vertical: 10.0),
  //           child: FloatingActionButton(
  //             onPressed: () {
  //               Scaffold.of(context).showSnackBar(SnackBar(content: Text('Seu envio está sendo processado.')));
  //             },
  //             child: Icon(Icons.add),
  //           ),
  //         ));

  // return Builder(
  //     builder: (context) => AlertDialog(
  //           title: new Text("Alert Dialog title"),
  //           content: new Text("Alert Dialog body"),
  //           actions: <Widget>[
  //             // usually buttons at the bottom of the dialog
  //             new FlatButton(
  //               child: new Text("Close"),
  //               onPressed: () {
  //                 //Navigator.of(context).pop();
  //               },
  //             ),
  //           ],
  //         ));
}

// ExpansionPanel retornaTeste(CharacterModel model) {
//   List<DropDownListExpansible> _data = generateCharacterList(1, model.name, model.vocation);

//   // return ExpansionPanelList(
//   //   expansionCallback: (int index, bool isExpanded) {
//   //     // setState(() {
//   //     //   _data[index].isExpanded = !isExpanded;
//   //     // });
//   //   },
//   //   children: _data.map<ExpansionPanel>((DropDownListExpansible item) {
//   return ExpansionPanel(
//     headerBuilder: (BuildContext context, bool isExpanded) {
//       return ListTile(
//         //title: Text(item.headerValue),
//         //title: Text(_data[0].headerValue),
//         title: Text(model.name),
//       );
//     },
//     body: ListTile(
//         // title: Text(item.expandedValue),
//         // title: Text(_data[0].expandedValue),
//         title: Text(model.vocation),
//         subtitle: Text('Para deletar pressione a lixeira!'),
//         trailing: Icon(Icons.delete),
//         onTap: () {
//           // setState(() {
//           //   _data.removeWhere((currentItem) => item == currentItem);
//           // });
//         }),
//     //isExpanded: item.isExpanded,
//     // isExpanded: _data[0].isExpanded,
//     isExpanded: true,
//   );
//   // }).toList(),
//   // );
// }
