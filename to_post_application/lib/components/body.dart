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

List<Widget> retornaWidgetsBody(Widget _buildPanelTeste, BuildContext context) {
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
        retornaBodyContato(context),
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

Widget retornaBodyContato(BuildContext context) {
  final _formKey = GlobalKey<FormState>();
  BuildContext _context = context;
  return Form(
    key: _formKey,
    child: Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        TextFormField(
          validator: (value) {
            if (value.isEmpty) {
              return 'Please enter some text';
            }
            return null;
          },
        ),
        Padding(
          padding: const EdgeInsets.symmetric(vertical: 16.0),
          child: RaisedButton(
            onPressed: () {
              // Validate returns true if the form is valid, or false
              // otherwise.
              if (_formKey.currentState.validate()) {
                // If the form is valid, display a Snackbar.
                Scaffold.of(_context)
                    .showSnackBar(SnackBar(content: Text('Processing Data')));
              }
            },
            child: Text('Submit'),
          ),
        ),
      ],
    ),
  );
}

// // Create a Form widget.
// class MyCustomForm extends StatefulWidget {
//   @override
//   MyCustomFormState createState() {
//     return MyCustomFormState();
//   }
// }

// // Create a corresponding State class.
// // This class holds data related to the form.
// class MyCustomFormState extends State<MyCustomForm> {
//   // Create a global key that uniquely identifies the Form widget
//   // and allows validation of the form.
//   //
//   // Note: This is a GlobalKey<FormState>,
//   // not a GlobalKey<MyCustomFormState>.
//   final _formKey = GlobalKey<FormState>();

//   @override
//   Widget build(BuildContext context) {
//     // Build a Form widget using the _formKey created above.
//     return Form(
//       key: _formKey,
//       child: Column(
//         crossAxisAlignment: CrossAxisAlignment.start,
//         children: <Widget>[
//           TextFormField(
//             validator: (value) {
//               if (value.isEmpty) {
//                 return 'Please enter some text';
//               }
//               return null;
//             },
//           ),
//           Padding(
//             padding: const EdgeInsets.symmetric(vertical: 16.0),
//             child: RaisedButton(
//               onPressed: () {
//                 // Validate returns true if the form is valid, or false
//                 // otherwise.
//                 if (_formKey.currentState.validate()) {
//                   // If the form is valid, display a Snackbar.
//                   Scaffold.of(context)
//                       .showSnackBar(SnackBar(content: Text('Processing Data')));
//                 }
//               },
//               child: Text('Submit'),
//             ),
//           ),
//         ],
//       ),
//     );
//   }
// }
