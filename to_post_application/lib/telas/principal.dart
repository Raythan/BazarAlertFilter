import 'package:flutter/material.dart';
import 'package:to_post_application/components/bottom_navigation_bar.dart';
import 'package:to_post_application/components/drop_down_list_expansible.dart';
import 'package:to_post_application/components/material_loading.dart';
import 'package:to_post_application/components/scaffold.dart';
import 'package:to_post_application/components/drop_down_itens.dart';
import 'package:to_post_application/resources/database_context.dart';

int _selectedIndex = 0;
int counter = 1;

class Principal extends StatefulWidget {
  @override
  PrincipalState createState() => PrincipalState();
}

class PrincipalState extends State<Principal> {
  String _appBarTitle = "Principal";
  BuildContext context;
  MaterialApp material = retornaCarregando();

  DbProvider db = DbProvider();
  // List<DropDownListExpansible> data = generateItemsTeste(counter);
  // Future<List<DropDownListExpansible>> data;
  //ExpansionPanelList expansionPanelListLocal = _buildPanelTeste();
  List<DropDownListExpansible> data;
  ExpansionPanelList expansionPanelListLocal;
  BottomNavigationBar _bottomNaviBarLocal;

  @override
  Widget build(context) {
    generateFetchStartAsync(db).then((value) => setState(() {
          // if (data == null) {
          // data = data == null ? value : data;
          if (data == null) data = value;

          if (data != null && value != null && data.length < value.length)
            data = value;
          else
            data = data;

          expansionPanelListLocal = _buildCharacterPanel(); // data = data ?? generateItemsTeste(counter);
          //data = generateItemsTeste(counter);
          //data = generateFetchStartAsync(db);
          //expansionPanelListLocal = expansionPanelListLocal == null ? _buildPanelTeste() : expansionPanelListLocal;
          _bottomNaviBarLocal = retornaBottomNavigatorAndIcons(_selectedIndex);
          material = MaterialApp(
            //home: retornaScaffold(_selectedIndex, _bottomNaviBarLocal, data, expansionPanelListLocal, _appBarTitle, context, db),
            home: retornaScaffold(
                // _selectedIndex, retornaBottomNavigatorAndIcons(_selectedIndex), data, _buildPanelTeste(), _appBarTitle, context, db),
                _selectedIndex,
                _bottomNaviBarLocal,
                data,
                // _buildPanelTeste(),
                expansionPanelListLocal,
                _appBarTitle,
                context,
                db),
            // home: retornaScaffoldAsync(_selectedIndex, _bottomNaviBarLocal, data, _buildPanelTeste(), _appBarTitle, context, db, this),
            debugShowCheckedModeBanner: false,
          );
          return material;
          //}
        }));
    return material;
  }

  void onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
      _appBarTitle = titles[_selectedIndex];
    });
  }

  BottomNavigationBar retornaBottomNavigatorAndIcons(int _selectedIndex) {
    return BottomNavigationBar(
      items: retornaBottomNavigationBarItens(),
      currentIndex: _selectedIndex,
      selectedItemColor: Colors.blue[800],
      unselectedItemColor: Colors.lightBlue,
      onTap: onItemTapped,
    );
  }

  ExpansionPanelList _buildCharacterPanel() {
    return ExpansionPanelList(
      expansionCallback: (int index, bool isExpanded) {
        setState(() {
          data[index].isExpanded = !isExpanded;
        });
      },
      children: data.map<ExpansionPanel>((DropDownListExpansible item) {
        return ExpansionPanel(
          headerBuilder: (BuildContext context, bool isExpanded) {
            return ListTile(
              title: Text(item.headerValue),
            );
          },
          body: ListTile(
              title: Text(item.expandedValue),
              subtitle: Text(item.subTitleValue),
              trailing: Icon(Icons.delete),
              onTap: () {
                // setState(() {
                //   deleteCharacterById(db, item.id).then((value) => null);
                //   data.removeWhere((currentItem) => item == currentItem);
                // });
                deleteCharacterById(db, item.id).then((value) => (setState(() {
                      data.removeWhere((currentItem) => item == currentItem);
                    })));
              }),
          isExpanded: item.isExpanded,
        );
      }).toList(),
    );
  }

  // ExpansionPanelList _buildPanelTeste() {
  //   return ExpansionPanelList(
  //     expansionCallback: (int index, bool isExpanded) {
  //       setState(() {
  //         data[index].isExpanded = !isExpanded;
  //       });
  //     },
  //     children: data.map<ExpansionPanel>((DropDownListExpansible item) {
  //       return ExpansionPanel(
  //         headerBuilder: (BuildContext context, bool isExpanded) {
  //           return ListTile(
  //             title: Text(item.headerValue),
  //           );
  //         },
  //         body: ListTile(
  //             title: Text(item.expandedValue),
  //             subtitle: Text('Para deletar pressione a lixeira!'),
  //             trailing: Icon(Icons.delete),
  //             onTap: () {
  //               setState(() {
  //                 data.removeWhere((currentItem) => item == currentItem);
  //               });
  //             }),
  //         isExpanded: item.isExpanded,
  //       );
  //     }).toList(),
  //   );
  // }
}
