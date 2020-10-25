import 'package:flutter/material.dart';
import 'package:to_post_application/components/app_bar.dart';
import 'package:to_post_application/resources/database_context.dart';
import 'body.dart';
import 'floating_action_button.dart';
import 'package:to_post_application/components/drop_down_list_expansible.dart';

Scaffold retornaScaffold(int _selectedIndex, BottomNavigationBar _bottomNavigationBar, Future<List<DropDownListExpansible>> _data,
    Future<ExpansionPanelList> _expansionPanelListLocal, String _appBarTitle, BuildContext context, DbProvider db) {
  return Scaffold(
    // appBar: AppBar(title: Text('Aplicação Beta!')),
    // appBar: AppBar(title: Text(_appBarTitle)),
    appBar: retornaAppBar(_appBarTitle),
    body: Builder(
      builder: (context) => retornaBody(retornaWidgetsBody(_expansionPanelListLocal, context), _selectedIndex),
    ),
    //     Center(
    //     child: RaisedButton(
    //     color: Colors.pink,
    //     textColor: Colors.white,
    //     onPressed: () => _displaySnackBar(context),
    //     child: Text('Display SnackBar'),
    //     ),
    // ),
    //),
    // body: retornaBody(
    //     retornaWidgetsBody(_buildPanelTeste, context), _selectedIndex),
    bottomNavigationBar: _bottomNavigationBar,
    floatingActionButtonLocation: FloatingActionButtonLocation.endFloat,
    floatingActionButton: _selectedIndex == 0 ? retornaFloatingActionButton(_data, context, db) : null,
  );
}
