import 'package:flutter/material.dart';
import 'package:to_post_application/components/app_bar.dart';
import 'package:to_post_application/resources/database_context.dart';
import 'body.dart';
import 'package:to_post_application/components/drop_down_list_expansible.dart';

Scaffold retornaScaffold(int selectedIndex, BottomNavigationBar bottomNavigationBar, List<DropDownListExpansible> data,
    Widget expansionPanelListLocal, String appBarTitle, BuildContext context, DbProvider db) {
  return Scaffold(
    // appBar: AppBar(title: Text('Aplicação Beta!')),
    // appBar: AppBar(title: Text(_appBarTitle)),
    // appBar: retornaAppBar(appBarTitle),
    appBar: selectedIndex == 0 ? retornaAppBarComAdicaoAtualizacao(appBarTitle, data, context, db) : retornaAppBar(appBarTitle),
    body: FutureBuilder(
      builder: (context, snapshot) => retornaBody(retornaWidgetsBody(expansionPanelListLocal, context), selectedIndex),
    ),
    // body: Builder(
    //   builder: (context) => retornaBody(retornaWidgetsBody(expansionPanelListLocal, context), selectedIndex),
    // ),
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
    bottomNavigationBar: bottomNavigationBar,
    // floatingActionButtonLocation: FloatingActionButtonLocation.endFloat,
    // floatingActionButton: selectedIndex == 0 ? retornaFloatingActionButton(data, context, db) : null,
  );
}

// Scaffold retornaScaffoldAsync(int selectedIndex, BottomNavigationBar bottomNavigationBar, Future<List<DropDownListExpansible>> data,
//     Widget expansionPanelListLocal, String appBarTitle, BuildContext context, DbProvider db, PrincipalState teste) {
//   return Scaffold(
//     // appBar: AppBar(title: Text('Aplicação Beta!')),
//     // appBar: AppBar(title: Text(_appBarTitle)),
//     appBar: retornaAppBar(appBarTitle),
//     body: FutureBuilder(
//       builder: (context, snapshot) => retornaBody(retornaWidgetsBody(expansionPanelListLocal, context), selectedIndex),
//     ),
//     // body: Builder(
//     //   builder: (context) => retornaBody(retornaWidgetsBody(expansionPanelListLocal, context), selectedIndex),
//     // ),
//     //     Center(
//     //     child: RaisedButton(
//     //     color: Colors.pink,
//     //     textColor: Colors.white,
//     //     onPressed: () => _displaySnackBar(context),
//     //     child: Text('Display SnackBar'),
//     //     ),
//     // ),
//     //),
//     // body: retornaBody(
//     //     retornaWidgetsBody(_buildPanelTeste, context), _selectedIndex),
// bottomNavigationBar: bottomNavigationBar,
// floatingActionButtonLocation: FloatingActionButtonLocation.endFloat,
// floatingActionButton: selectedIndex == 0 ? retornaFloatingActionButton(data, context, db) : null,
//   );
// }
