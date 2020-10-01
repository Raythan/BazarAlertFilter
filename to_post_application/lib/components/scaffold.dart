import 'package:flutter/material.dart';
import 'package:to_post_application/components/app_bar.dart';
import 'body.dart';

Scaffold retornaScaffold(
    int _selectedIndex,
    BottomNavigationBar _bottomNavigationBar,
    Widget _buildPanelTeste,
    String _appBarTitle,
    BuildContext context) {
  return Scaffold(
    // appBar: AppBar(title: Text('Aplicação Beta!')),
    // appBar: AppBar(title: Text(_appBarTitle)),
    appBar: retornaAppBar(_appBarTitle),
    body: Builder(
      builder: (context) => retornaBody(
          retornaWidgetsBody(_buildPanelTeste, context), _selectedIndex),
      //     Center(
      //     child: RaisedButton(
      //     color: Colors.pink,
      //     textColor: Colors.white,
      //     onPressed: () => _displaySnackBar(context),
      //     child: Text('Display SnackBar'),
      //     ),
      // ),
    ),
    // body: retornaBody(
    //     retornaWidgetsBody(_buildPanelTeste, context), _selectedIndex),
    bottomNavigationBar: _bottomNavigationBar,
  );
}
