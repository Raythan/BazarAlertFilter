import 'package:flutter/material.dart';
import 'package:to_post_application/components/app_bar.dart';
import 'body.dart';

Scaffold retornaScaffold(
    int _selectedIndex, BottomNavigationBar _bottomNavigationBar, Widget _buildPanelTeste, String _appBarTitle, BuildContext context) {
  return Scaffold(
    // appBar: AppBar(title: Text('Aplicação Beta!')),
    // appBar: AppBar(title: Text(_appBarTitle)),
    appBar: retornaAppBar(_appBarTitle),
    body: Builder(builder: (context) => retornaBody(retornaWidgetsBody(_buildPanelTeste, context), _selectedIndex)),
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
    floatingActionButton: _selectedIndex == 0 ? retornaFloatingActionButton(context) : null,
  );
}

Widget retornaFloatingActionButton(BuildContext context) {
  return Builder(
      builder: (context) => Padding(
            padding: const EdgeInsets.symmetric(vertical: 10.0),
            child: FloatingActionButton(
              onPressed: () {
                //Scaffold.of(context).showSnackBar(SnackBar(content: Text('Seu envio está sendo processado.')));
                showDialog(
                  context: context,
                  builder: (BuildContext context) {
                    // return object of type Dialog
                    return AlertDialog(
                      title: Text("Insira o nome:"),
                      //content: Text("Alert Dialog body"),
                      content: TextFormField(),
                      actions: <Widget>[
                        FlatButton(
                          child: Icon(Icons.search),
                          onPressed: () {
                            Navigator.of(context).pop();
                          },
                        ),
                        FlatButton(
                          child: Text("Fechar"),
                          onPressed: () {
                            Navigator.of(context).pop();
                          },
                        ),
                      ],
                    );
                  },
                );
              },
              child: Icon(Icons.add),
            ),
          ));

  // return Builder(
  //     builder: (context) => Padding(
  //           padding: const EdgeInsets.symmetric(vertical: 10.0),
  //           child: FloatingActionButton(
  //             onPressed: () {
  //               Scaffold.of(context).showSnackBar(SnackBar(content: Text('Seu envio está sendo processado.')));
  //             },
  //             child: Icon(Icons.add),
  //           ),
  //         ));

  // return Builder(
  //     builder: (context) => AlertDialog(
  //           title: new Text("Alert Dialog title"),
  //           content: new Text("Alert Dialog body"),
  //           actions: <Widget>[
  //             // usually buttons at the bottom of the dialog
  //             new FlatButton(
  //               child: new Text("Close"),
  //               onPressed: () {
  //                 //Navigator.of(context).pop();
  //               },
  //             ),
  //           ],
  //         ));
}
