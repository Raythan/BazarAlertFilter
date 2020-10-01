import 'package:flutter/material.dart';
import 'package:to_post_application/components/bottom_navigation_bar.dart';
import 'package:to_post_application/components/drop_down_list_expansible.dart';
import 'package:to_post_application/components/scaffold.dart';
import 'package:to_post_application/deletar/teste.dart';

int _selectedIndex = 0;

class Principal extends StatefulWidget {
  @override
  _PrincipalState createState() => _PrincipalState();
}

class _PrincipalState extends State<Principal> {
  String _appBarTitle = "Principal";

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: retornaScaffold(
          _selectedIndex,
          retornaBottomNavigatorAndIcons(_selectedIndex),
          _buildPanelTeste(),
          _appBarTitle),
      debugShowCheckedModeBanner: false,
    );
  }

  void _onItemTapped(int index) {
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
      onTap: _onItemTapped,
    );
  }

  List<DropDownListExpansible> _data = generateItems(18);

  Widget _buildPanelTeste() {
    return ExpansionPanelList(
      expansionCallback: (int index, bool isExpanded) {
        setState(() {
          _data[index].isExpanded = !isExpanded;
        });
      },
      children: _data.map<ExpansionPanel>((DropDownListExpansible item) {
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
                  _data.removeWhere((currentItem) => item == currentItem);
                });
              }),
          isExpanded: item.isExpanded,
        );
      }).toList(),
    );
  }
}
