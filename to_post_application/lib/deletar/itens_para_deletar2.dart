// import 'package:flutter/material.dart';
// import 'package:to_post_application/components/text_body.dart';

// import 'app_bars.dart';

// Scaffold retornaScaffoldPrincipal(int _selectedIndex,
//     BottomNavigationBar _bottomNavigationBar, Widget _buildPanelTeste) {
//   List<Widget> _widgetOptions = <Widget>[
//     Column(
//       children: <Widget>[
//         retornaTextBodyMenuPrincipal(),
//         //Método utilizado na construção de testes.
//         //_buildPanelTeste(),
//         _buildPanelTeste,
//       ],
//     ),
//     Column(
//       children: <Widget>[
//         retornaTextBodyMenuContato(),
//       ],
//     ),
//   ];

//   return Scaffold(
//     appBar: retornaAppBarPrincipal(),
//     body: retornaBodyPrincipal(_widgetOptions, _selectedIndex),
//     bottomNavigationBar: _bottomNavigationBar,
//   );
// }

// // Widget retornaIconAlertAppBarPrincipal() {
// //   return IconButton(
// //     icon: const Icon(Icons.add_alert),
// //     tooltip: 'Show Snackbar',
// //     onPressed: () {
// //       //scaffoldKey.currentState.showSnackBar(snackBar);
// //     },
// //   );
// // }

// // Widget retornaIconNextAppBarPrincipal() {
// //   return IconButton(
// //     icon: const Icon(Icons.navigate_next),
// //     tooltip: 'Next page',
// //     onPressed: () {
// //       //openPage(context);
// //     },
// //   );
// // }

// // List<Widget> retornaWidgetsAppBarPrincipal() {
// //   return <Widget>[
// //     retornaIconAlertAppBarPrincipal(),
// //     retornaIconNextAppBarPrincipal(),
// //   ];
// // }

// Center retornaBodyPrincipal(List<Widget> _widgetOptions, int _selectedIndex) {
//   return Center(
//     // child: Column(
//     //   children: <Widget>[
//     //     _widgetOptions.elementAt(_selectedIndex),
//     //     _buildPanel(),
//     //   ],
//     // ),
//     child: new ListView(
//       //shrinkWrap: true,
//       children: <Widget>[
//         _widgetOptions.elementAt(_selectedIndex),
//         //_buildPanel(),
//       ],
//     ),
//   );
//   //   Center(
//   //   // child: Text(
//   //   //   'TesteBody',
//   //   //   style: TextStyle(fontSize: 24),
//   //   // ),
//   //   //child: _widgetOptions.elementAt(_selectedIndex),
//   //   child: ,
//   // );
// }

// // Widget _buildPanelTeste(_data) {
// //     return ExpansionPanelList(
// //       expansionCallback: (int index, bool isExpanded) {
// //         setState(() {
// //           _data[index].isExpanded = !isExpanded;
// //         });
// //       },
// //       children: _data.map<ExpansionPanel>((DropDownListExpansible item) {
// //         return ExpansionPanel(
// //           headerBuilder: (BuildContext context, bool isExpanded) {
// //             return ListTile(
// //               title: Text(item.headerValue),
// //             );
// //           },
// //           body: ListTile(
// //               title: Text(item.expandedValue),
// //               subtitle: Text('To delete this panel, tap the trash can icon'),
// //               trailing: Icon(Icons.delete),
// //               onTap: () {
// //                 setState(() {
// //                   _data.removeWhere((currentItem) => item == currentItem);
// //                 });
// //               }),
// //           isExpanded: item.isExpanded,
// //         );
// //       }).toList(),
// //     );
// //   }
