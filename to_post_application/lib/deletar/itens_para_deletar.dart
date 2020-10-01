// import 'package:flutter/material.dart';
// import 'package:to_post_application/components/drop_down_list_expansible.dart';
// import 'package:to_post_application/components/scaffold.dart';

// int _selectedIndex = 0;
// // const TextStyle _optionStyle =
// //     TextStyle(fontSize: 30, fontWeight: FontWeight.bold);

// class Principal extends StatefulWidget {
//   @override
//   _PrincipalState createState() => _PrincipalState();
// }

// class _PrincipalState extends State<Principal> {
//   @override
//   Widget build(BuildContext context) {
//     return MaterialApp(
//       home: retornaScaffoldPrincipal(_selectedIndex,
//           retornaBottomNavigatorAndIcons(_selectedIndex), _buildPanelTeste()),
//       debugShowCheckedModeBanner: false,
//     );
//   }

//   void _onItemTapped(int index) {
//     setState(() {
//       _selectedIndex = index;
//     });
//   }

//   // Scaffold retornaScaffoldPrincipal(int _selectedIndex) {
//   //   List<Widget> _widgetOptions = <Widget>[
//   //     Column(
//   //       children: <Widget>[
//   //         retornaTextBodyMenuPrincipal(),
//   //         //Método utilizado na construção de testes.
//   //         _buildPanelTeste(),
//   //       ],
//   //     ),
//   //     Column(
//   //       children: <Widget>[
//   //         retornaTextBodyMenuContato(),
//   //       ],
//   //     ),
//   //   ];

//   //   return Scaffold(
//   //     appBar: retornaAppBarPrincipal(),
//   //     body: retornaBodyPrincipal(_widgetOptions, _selectedIndex),
//   //     bottomNavigationBar: retornaBottomNavigatorAndIcons(_selectedIndex),
//   //   );
//   // }

//   BottomNavigationBar retornaBottomNavigatorAndIcons(int _selectedIndex) {
//     return BottomNavigationBar(
//       items: const <BottomNavigationBarItem>[
//         BottomNavigationBarItem(
//           icon: Icon(Icons.home),
//           title: Text('Principal'),
//         ),
//         BottomNavigationBarItem(
//           icon: Icon(Icons.business),
//           title: Text('Contato'),
//         ),
//         // BottomNavigationBarItem(
//         //   icon: Icon(Icons.school),
//         //   title: Text('School'),
//         // ),
//         // BottomNavigationBarItem(
//         //   icon: Icon(Icons.access_alarm),
//         //   title: Text('Teste'),
//         // ),
//         // BottomNavigationBarItem(
//         //   icon: Icon(Icons.account_box),
//         //   title: Text('Teste2'),
//         // ),
//       ],
//       currentIndex: _selectedIndex,
//       selectedItemColor: Colors.blue[800],
//       unselectedItemColor: Colors.lightBlue,
//       onTap: _onItemTapped,
//     );
//   }

//   // AppBar retornaAppBarPrincipal() {
//   //   return AppBar(
//   //     title: Text('Principal'),
//   //     //actions: retornaWidgetsAppBarPrincipal(),
//   //   );
//   // }

//   // Widget retornaIconAlertAppBarPrincipal() {
//   //   return IconButton(
//   //     icon: const Icon(Icons.add_alert),
//   //     tooltip: 'Show Snackbar',
//   //     onPressed: () {
//   //       //scaffoldKey.currentState.showSnackBar(snackBar);
//   //     },
//   //   );
//   // }

//   // Widget retornaIconNextAppBarPrincipal() {
//   //   return IconButton(
//   //     icon: const Icon(Icons.navigate_next),
//   //     tooltip: 'Next page',
//   //     onPressed: () {
//   //       //openPage(context);
//   //     },
//   //   );
//   // }

//   // List<Widget> retornaWidgetsAppBarPrincipal() {
//   //   return <Widget>[
//   //     retornaIconAlertAppBarPrincipal(),
//   //     retornaIconNextAppBarPrincipal(),
//   //   ];
//   // }

//   // Center retornaBodyPrincipal(List<Widget> _widgetOptions, int _selectedIndex) {
//   //   return Center(
//   //     // child: Column(
//   //     //   children: <Widget>[
//   //     //     _widgetOptions.elementAt(_selectedIndex),
//   //     //     _buildPanel(),
//   //     //   ],
//   //     // ),
//   //     child: new ListView(
//   //       //shrinkWrap: true,
//   //       children: <Widget>[
//   //         _widgetOptions.elementAt(_selectedIndex),
//   //         //_buildPanel(),
//   //       ],
//   //     ),
//   //   );
//   //   //   Center(
//   //   //   // child: Text(
//   //   //   //   'TesteBody',
//   //   //   //   style: TextStyle(fontSize: 24),
//   //   //   // ),
//   //   //   //child: _widgetOptions.elementAt(_selectedIndex),
//   //   //   child: ,
//   //   // );
//   // }

//   List<DropDownListExpansible> _data = generateItems(18);

//   // @override
//   // Widget build(BuildContext context) {
//   //   return SingleChildScrollView(
//   //     child: Container(
//   //       child: _buildPanel(),
//   //     ),
//   //   );
//   // }

//   Widget _buildPanelTeste() {
//     return ExpansionPanelList(
//       expansionCallback: (int index, bool isExpanded) {
//         setState(() {
//           _data[index].isExpanded = !isExpanded;
//         });
//       },
//       children: _data.map<ExpansionPanel>((DropDownListExpansible item) {
//         return ExpansionPanel(
//           headerBuilder: (BuildContext context, bool isExpanded) {
//             return ListTile(
//               title: Text(item.headerValue),
//             );
//           },
//           body: ListTile(
//               title: Text(item.expandedValue),
//               // subtitle: Text('To delete this panel, tap the trash can icon'),
//               subtitle: Text('Para deletar presisone a lixeira!'),
//               trailing: Icon(Icons.delete),
//               onTap: () {
//                 setState(() {
//                   _data.removeWhere((currentItem) => item == currentItem);
//                 });
//               }),
//           isExpanded: item.isExpanded,
//         );
//       }).toList(),
//     );
//   }
// }

// // Método que gera os itens para análise
// List<DropDownListExpansible> generateItems(int numberOfItems) {
//   return List.generate(numberOfItems, (int index) {
//     return DropDownListExpansible(
//       // headerValue: 'Panel $index',
//       headerValue: 'Testando $index',
//       // expandedValue: 'This is item number $index',
//       expandedValue: 'Este é o dropdown expansível $index!',
//     );
//   });
// }
