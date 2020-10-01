import 'package:flutter/material.dart';
import 'package:to_post_application/components/app_bar.dart';
import 'body.dart';

Scaffold retornaScaffold(
    int _selectedIndex,
    BottomNavigationBar _bottomNavigationBar,
    Widget _buildPanelTeste,
    String _appBarTitle) {
  return Scaffold(
    // appBar: AppBar(title: Text('Aplicação Beta!')),
    // appBar: AppBar(title: Text(_appBarTitle)),
    appBar: retornaAppBar(_appBarTitle),
    body: retornaBody(retornaWidgetsBody(_buildPanelTeste), _selectedIndex),
    bottomNavigationBar: _bottomNavigationBar,
  );
}
