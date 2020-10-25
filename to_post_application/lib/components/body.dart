import 'package:flutter/material.dart';
import 'package:to_post_application/components/button_form_body.dart';

import 'text_form_body.dart';

// const TextStyle _textBodyStyle =
//     TextStyle(fontSize: 30, fontWeight: FontWeight.bold);

Center retornaBody(List<Widget> _widgetOptions, int _selectedIndex) {
  return Center(
    child: new ListView(
      children: <Widget>[_widgetOptions.elementAt(_selectedIndex)],
    ),
  );
}

List<Widget> retornaWidgetsBody(Future<ExpansionPanelList> _expansionPanelListLocal, BuildContext context) {
  return <Widget>[
    Column(
      children: <ExpansionPanelList>[
        //retornaTextBodyMenuPrincipal(),
        //_expansionPanelListLocal.then((value) => value),
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

// Future<ExpansionPanelList> teste(Future<ExpansionPanelList> _expansionPanelListLocal) async {
//   return _expansionPanelListLocal;
// }

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
  TextEditingController nomeController = new TextEditingController();
  TextEditingController emailController = new TextEditingController();
  TextEditingController sugestaoController = new TextEditingController();

  final _formKey = GlobalKey<FormState>();
  BuildContext _context = context;
  return Form(
    key: _formKey,
    child: Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: <Widget>[
        retornaTextFormNome(nomeController),
        retornaTextFormEmail(emailController),
        retornaTextFormSugestao(sugestaoController),
        retornaButtonFormBody(_formKey, nomeController, emailController, sugestaoController, _context),
        // Padding(
        //   padding: const EdgeInsets.symmetric(vertical: 10.0),
        //   child: RaisedButton(
        //     onPressed: () {
        //       if (_formKey.currentState.validate()) {
        //         // Scaffold.of(_context).showSnackBar(SnackBar(
        //         //     content: Text(
        //         //         'Obrigado pelo apoio.\r\nSeu envio está sendo processado.')));
        //         enviarEmail(nomeController.text, emailController.text,
        //             sugestaoController.text, context);
        //       }
        //     },
        //     child: Text('Enviar!'),
        //   ),
        // ),
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
