import 'package:flutter/material.dart';
import 'package:to_post_application/components/bottom_navigation_bar.dart';
import 'package:to_post_application/components/drop_down_list_expansible.dart';
import 'package:to_post_application/components/scaffold.dart';
import 'package:to_post_application/components/drop_down_itens.dart';
import 'package:to_post_application/resources/database_context.dart';

int _selectedIndex = 0;

class Principal extends StatefulWidget {
  @override
  _PrincipalState createState() => _PrincipalState();
}

class _PrincipalState extends State<Principal> {
  String _appBarTitle = "Principal";
  BuildContext context;
  MaterialApp material;
  DbProvider db = DbProvider();
  Future<List<DropDownListExpansible>> _data;
  Future<ExpansionPanelList> _expansionPanelListLocal;

  @override
  Widget build(context) {
    _data = generateFetchStartAsync(db).then((value) => value);
    _expansionPanelListLocal = _buildPanelTeste().then((value) => value);
    this.material = MaterialApp(
      home: retornaScaffold(
          _selectedIndex, retornaBottomNavigatorAndIcons(_selectedIndex), _data, _expansionPanelListLocal, _appBarTitle, context, db),
      debugShowCheckedModeBanner: false,
    );
    return this.material;
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

  Future<ExpansionPanelList> _buildPanelTeste() async {
    return ExpansionPanelList(
        expansionCallback: (int index, bool isExpanded) {
          setState(() {
            // _data[index].isExpanded = !isExpanded;
            _data.then((value) => value.elementAt(index).isExpanded = !isExpanded);
          });
        },
        // children: _data.map<ExpansionPanel>((DropDownListExpansible item) {
        children: await _data.then(
          (value) => value
              .map<ExpansionPanel>((DropDownListExpansible item) => ExpansionPanel(
                    headerBuilder: (BuildContext context, bool isExpanded) {
                      return ListTile(
                        title: Text(item.headerValue),
                      );
                    },
                    body: ListTile(
                        title: Text(item.expandedValue),
                        subtitle: Text('Para deletar pressione a lixeira!'),
                        trailing: Icon(Icons.delete),
                        onTap: () {
                          setState(() {
                            // _data.removeWhere((currentItem) => item == currentItem);
                            _data.then((value) => value.removeWhere((currentItem) => item == currentItem));
                          });
                        }),
                    isExpanded: item.isExpanded,
                  ))
              .toList(),
        ));
  }

// ExpansionPanelList _buildPanelTeste() async {
//     return ExpansionPanelList(
//       expansionCallback: (int index, bool isExpanded) {
//         setState(() {
//           // _data[index].isExpanded = !isExpanded;
//           _data.then((value) => value.elementAt(index).isExpanded = !isExpanded);
//         });
//       },
//       // children: _data.map<ExpansionPanel>((DropDownListExpansible item) {
//       children: await _data.then((value) => value.map<ExpansionPanel>((DropDownListExpansible item) =>
//           ExpansionPanel(
//           headerBuilder: (BuildContext context, bool isExpanded) {
//             return ListTile(
//               title: Text(item.headerValue),
//             );
//           },
//           body: ListTile(
//               title: Text(item.expandedValue),
//               subtitle: Text('Para deletar pressione a lixeira!'),
//               trailing: Icon(Icons.delete),
//               onTap: () {
//                 setState(() {
//                   // _data.removeWhere((currentItem) => item == currentItem);
//                   _data.then((value) => value.removeWhere((currentItem) => item == currentItem));
//                 });
//               }),
//           isExpanded: item.isExpanded,
//         )
//       ).toList(),
//     ));
//   }

}
