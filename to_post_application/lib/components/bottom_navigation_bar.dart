import 'package:flutter/material.dart';

List<String> titles = ['Principal', 'Bazar', 'Contato'];

List<BottomNavigationBarItem> retornaBottomNavigationBarItens() {
  return <BottomNavigationBarItem>[
    BottomNavigationBarItem(
      icon: Icon(Icons.home),
      // title: Text('Principal'),
      title: Text(titles[0]),
    ),
    BottomNavigationBarItem(
      //icon: Icon(Icons.business),
      icon: Icon(Icons.adb),
      title: Text(titles[1]),
    ),
    BottomNavigationBarItem(
      //icon: Icon(Icons.business),
      icon: Icon(Icons.contact_mail),
      title: Text(titles[2]),
    ),
  ];
}
