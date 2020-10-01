import 'package:flutter/material.dart';

// const TextStyle _textBodyStyle =
//     TextStyle(fontSize: 30, fontWeight: FontWeight.bold);

Center retornaBody(List<Widget> _widgetOptions, int _selectedIndex) {
  return Center(
    child: new ListView(
      children: <Widget>[
        _widgetOptions.elementAt(_selectedIndex),
      ],
    ),
  );
}

List<Widget> retornaWidgetsBody(_buildPanelTeste) {
  return <Widget>[
    Column(
      children: <Widget>[
        //retornaTextBodyMenuPrincipal(),
        _buildPanelTeste,
      ],
    ),
    Column(
      children: <Widget>[
        //retornaTextBodyMenuContato(),
      ],
    ),
  ];
}

// Text retornaTextBodyMenuPrincipal() {
//   return Text(
//     //'Index 0: Principal',
//     'Principal',
//     style: _textBodyStyle,
//   );
// }

// Text retornaTextBodyMenuContato() {
//   return Text(
//     //'Index 1: Contato',
//     'Contato',
//     style: _textBodyStyle,
//   );
// }
