import 'package:flutter/material.dart';
import 'package:to_post_application/resources/processar_request.dart';

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
                            var teste = getData();
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
