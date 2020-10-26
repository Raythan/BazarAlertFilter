import 'package:flutter/material.dart';
import 'package:to_post_application/components/bottom_navigation_bar.dart';
import 'package:to_post_application/components/drop_down_list_expansible.dart';
import 'package:to_post_application/components/scaffold.dart';
import 'package:to_post_application/components/drop_down_itens.dart';
import 'package:to_post_application/resources/database_context.dart';

int _selectedIndex = 0;
int counter = 1;

class Principal extends StatefulWidget {
  @override
  _PrincipalState createState() => _PrincipalState();
}

class _PrincipalState extends State<Principal> {
  String _appBarTitle = "Principal";
  BuildContext context;
  MaterialApp material;
  DbProvider db = DbProvider();
  List<DropDownListExpansible> data = generateItemsTeste(counter);
  ExpansionPanelList expansionPanelListLocal = _buildPanelTeste();
  BottomNavigationBar _bottomNaviBarLocal;

  @override
  Widget build(context) {
    // data = data ?? generateItemsTeste(2);
    //data = generateItemsTeste(counter);
    counter++;
    //expansionPanelListLocal = expansionPanelListLocal ?? _buildPanelTeste();
    _bottomNaviBarLocal = _bottomNaviBarLocal ?? retornaBottomNavigatorAndIcons(_selectedIndex);
    this.material = MaterialApp(
      //home: retornaScaffold(_selectedIndex, _bottomNaviBarLocal, data, expansionPanelListLocal, _appBarTitle, context, db),
      home: retornaScaffold(
          _selectedIndex, retornaBottomNavigatorAndIcons(_selectedIndex), data, _buildPanelTeste(), _appBarTitle, context, db),
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

  ExpansionPanelList _buildPanelTeste() {
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
              subtitle: Text('Para deletar pressione a lixeira!'),
              trailing: Icon(Icons.delete),
              onTap: () {
                setState(() {
                  data.removeWhere((currentItem) => item == currentItem);
                });
              }),
          isExpanded: item.isExpanded,
        );
      }).toList(),
    );
  }
}
