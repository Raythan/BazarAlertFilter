import 'package:flutter/material.dart';
import 'package:to_post_application/components/drop_down_itens.dart';
import 'package:to_post_application/components/drop_down_list_expansible.dart';
import 'package:to_post_application/entities/character_entity.dart';
import 'package:to_post_application/resources/database_context.dart';
import 'package:to_post_application/resources/processar_request.dart';

TextEditingController _characterNameController = TextEditingController();
String de = " ";
String para = "+";

PreferredSize retornaAppBar(_appBarTitle) {
  return PreferredSize(
    preferredSize: Size.fromHeight(70.0), // here the desired height
    child: AppBar(
      title: Text(_appBarTitle),
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.vertical(
          bottom: Radius.circular(10),
        ),
      ),
      //centerTitle: true,
    ),
  );
}

// PreferredSize retornaAppBarComAdicaoAtualizacao(_appBarTitle, List<DropDownListExpansible> data, BuildContext context, DbProvider db) {
//   return PreferredSize(
//     preferredSize: Size.fromHeight(70.0), // here the desired height
//     child: AppBar(
//       title: Text(_appBarTitle),
//       actions: <Widget>[
//         IconButton(
//           icon: Icon(
//             Icons.settings,
//             color: Colors.white,
//           ),
//           onPressed: () async {
//             getCharacterData(_characterNameController.text.replaceAll(de, para)).then((value) {
//               var dataFromApi = value;
//               CharacterModel character = new CharacterModel();
//               character = character.fromMapDataApi(dataFromApi);
//               db.addItem("Character", character).then((value2) {
//                 Navigator.of(context).pop();
//               });
//             });
//           },
//         )
//       ],
//       shape: RoundedRectangleBorder(
//         borderRadius: BorderRadius.vertical(
//           bottom: Radius.circular(10),
//         ),
//       ),
//       //centerTitle: true,
//     ),
//   );
// }

PreferredSize retornaAppBarComAdicaoAtualizacao(_appBarTitle, List<DropDownListExpansible> data, BuildContext context, DbProvider db) {
  return PreferredSize(
    preferredSize: Size.fromHeight(70.0),
    child: Builder(
      builder: (context) => AppBar(
        title: Text(_appBarTitle),
        actions: <Widget>[
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: IconButton(
              icon: Icon(Icons.add_circle_outline, color: Colors.white, size: 40.0),
              onPressed: () {
                showDialog(
                  context: context,
                  builder: (BuildContext context) {
                    return AlertDialog(
                      title: Text("Insira o nome:"),
                      content: TextFormField(controller: _characterNameController),
                      actions: <Widget>[
                        FlatButton(
                          child: Icon(Icons.search),
                          onPressed: () async {
                            getCharacterData(_characterNameController.text.replaceAll(de, para)).then((value) {
                              var dataFromApi = value;
                              CharacterModel character = new CharacterModel();
                              character = character.fromMapDataApi(dataFromApi);
                              db.addItem("Character", character).then((value2) {
                                Navigator.of(context).pop();
                              });
                            });
                          },
                        ),
                        FlatButton(
                          // child: Text("Fechar"),
                          child: Icon(Icons.close),
                          onPressed: () {
                            Navigator.of(context).pop();
                          },
                        ),
                      ],
                    );
                  },
                );
              },
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: IconButton(
              icon: Icon(Icons.refresh, color: Colors.white, size: 40.0),
              onPressed: () {
                showDialog(
                  context: context,
                  builder: (BuildContext context) {
                    return AlertDialog(
                      title: Text("Insira o nome:"),
                      content: TextFormField(controller: _characterNameController),
                      actions: <Widget>[
                        FlatButton(
                          child: Icon(Icons.search),
                          onPressed: () async {
                            getCharacterData(_characterNameController.text.replaceAll(de, para)).then((value) {
                              var dataFromApi = value;
                              CharacterModel character = new CharacterModel();
                              character = character.fromMapDataApi(dataFromApi);
                              db.fetchItemsByName("Character", dataFromApi['characters']['data']['name']).then((value2) {
                                int idChar = CharacterModel.fromMap(value2).id;
                                // db.updateItem("Character", character2.id, character).then((value2) {
                                character.id = idChar;
                                character.level = 26;
                                db.updateItem("Character", idChar, character).then((value3) {
                                  Navigator.of(context).pop();
                                });
                              });
                            });
                          },
                        ),
                        FlatButton(
                          // child: Text("Fechar"),
                          child: Icon(Icons.close),
                          onPressed: () {
                            Navigator.of(context).pop();
                          },
                        ),
                      ],
                    );
                  },
                );
              },
            ),
          )
        ],
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.vertical(
            bottom: Radius.circular(10),
          ),
        ),
      ),
    ),
  );
}
