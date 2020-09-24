import 'package:flutter/material.dart';

void main() => runApp(Principal());

class Principal extends StatefulWidget {
  @override
  _PrincipalState createState() => _PrincipalState();
}

class _PrincipalState extends State<Principal> {
  int _selectedIndex = 0;
  static const TextStyle optionStyle =
      TextStyle(fontSize: 30, fontWeight: FontWeight.bold);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: retornaScaffoldPrincipal(_selectedIndex),
      debugShowCheckedModeBanner: false,
    );
  }

  Text retornaTextBottomMenuPrincipal() {
    return Text(
      'Index 0: Principal',
      style: optionStyle,
    );
  }

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  Scaffold retornaScaffoldPrincipal(int _selectedIndex) {
    List<Widget> _widgetOptions = <Widget>[
      Column(
        children: <Widget>[
          Text(
            'Index 0: Principal',
            style: optionStyle,
          ),
          _buildPanel(),
        ],
      ),
      Column(
        children: <Widget>[
          Text(
            'Index 1: Contato',
            style: optionStyle,
          ),
        ],
      ),
    ];

    return Scaffold(
      appBar: retornaAppBarPrincipal(),
      body: retornaBodyPrincipal(_widgetOptions, _selectedIndex),
      bottomNavigationBar: retornaBottomNavigatorAndIcons(_selectedIndex),
    );
  }

  BottomNavigationBar retornaBottomNavigatorAndIcons(int _selectedIndex) {
    return BottomNavigationBar(
      items: const <BottomNavigationBarItem>[
        BottomNavigationBarItem(
          icon: Icon(Icons.home),
          title: Text('Principal'),
        ),
        BottomNavigationBarItem(
          icon: Icon(Icons.business),
          title: Text('Contato'),
        ),
        // BottomNavigationBarItem(
        //   icon: Icon(Icons.school),
        //   title: Text('School'),
        // ),
        // BottomNavigationBarItem(
        //   icon: Icon(Icons.access_alarm),
        //   title: Text('Teste'),
        // ),
        // BottomNavigationBarItem(
        //   icon: Icon(Icons.account_box),
        //   title: Text('Teste2'),
        // ),
      ],
      currentIndex: _selectedIndex,
      selectedItemColor: Colors.blue[800],
      unselectedItemColor: Colors.lightBlue,
      onTap: _onItemTapped,
    );
  }

  AppBar retornaAppBarPrincipal() {
    return AppBar(
      title: Text('Principal'),
      //actions: retornaWidgetsAppBarPrincipal(),
    );
  }

  Widget retornaIconAlertAppBarPrincipal() {
    return IconButton(
      icon: const Icon(Icons.add_alert),
      tooltip: 'Show Snackbar',
      onPressed: () {
        //scaffoldKey.currentState.showSnackBar(snackBar);
      },
    );
  }

  Widget retornaIconNextAppBarPrincipal() {
    return IconButton(
      icon: const Icon(Icons.navigate_next),
      tooltip: 'Next page',
      onPressed: () {
        //openPage(context);
      },
    );
  }

  List<Widget> retornaWidgetsAppBarPrincipal() {
    return <Widget>[
      retornaIconAlertAppBarPrincipal(),
      retornaIconNextAppBarPrincipal(),
    ];
  }

  Center retornaBodyPrincipal(List<Widget> _widgetOptions, int _selectedIndex) {
    return Center(
      // child: Column(
      //   children: <Widget>[
      //     _widgetOptions.elementAt(_selectedIndex),
      //     _buildPanel(),
      //   ],
      // ),
      child: new ListView(
        //shrinkWrap: true,
        children: <Widget>[
          _widgetOptions.elementAt(_selectedIndex),
          //_buildPanel(),
        ],
      ),
    );
    //   Center(
    //   // child: Text(
    //   //   'TesteBody',
    //   //   style: TextStyle(fontSize: 24),
    //   // ),
    //   //child: _widgetOptions.elementAt(_selectedIndex),
    //   child: ,
    // );
  }

  List<Item> _data = generateItems(8);

  // @override
  // Widget build(BuildContext context) {
  //   return SingleChildScrollView(
  //     child: Container(
  //       child: _buildPanel(),
  //     ),
  //   );
  // }

  Widget _buildPanel() {
    return ExpansionPanelList(
      expansionCallback: (int index, bool isExpanded) {
        setState(() {
          _data[index].isExpanded = !isExpanded;
        });
      },
      children: _data.map<ExpansionPanel>((Item item) {
        return ExpansionPanel(
          headerBuilder: (BuildContext context, bool isExpanded) {
            return ListTile(
              title: Text(item.headerValue),
            );
          },
          body: ListTile(
              title: Text(item.expandedValue),
              subtitle: Text('To delete this panel, tap the trash can icon'),
              trailing: Icon(Icons.delete),
              onTap: () {
                setState(() {
                  _data.removeWhere((currentItem) => item == currentItem);
                });
              }),
          isExpanded: item.isExpanded,
        );
      }).toList(),
    );
  }
}

List<Item> generateItems(int numberOfItems) {
  return List.generate(numberOfItems, (int index) {
    return Item(
      headerValue: 'Panel $index',
      expandedValue: 'This is item number $index',
    );
  });
}

// stores ExpansionPanel state information
class Item {
  Item({
    this.expandedValue,
    this.headerValue,
    this.isExpanded = false,
  });

  String expandedValue;
  String headerValue;
  bool isExpanded;
}

// Here is a simple example of how to implement ExpansionPanelList.

/// This Widget is the main application widget.
// class MyApp extends StatelessWidget {
//   static const String _title = 'Flutter Code Sample';

//   @override
//   Widget build(BuildContext context) {
//     return MaterialApp(
//       title: _title,
//       home: Scaffold(
//         appBar: AppBar(title: const Text(_title)),
//         body: MyStatefulWidget(),
//       ),
//     );
//   }
// }

// List<Item> generateItems(int numberOfItems) {
//   return List.generate(numberOfItems, (int index) {
//     return Item(
//       headerValue: 'Panel $index',
//       expandedValue: 'This is item number $index',
//     );
//   });
// }

// class MyStatefulWidget extends StatefulWidget {
//   MyStatefulWidget({Key key}) : super(key: key);

//   @override
//   _MyStatefulWidgetState createState() => _MyStatefulWidgetState();
// }

// class _MyStatefulWidgetState extends State<MyStatefulWidget> {
//   List<Item> _data = generateItems(8);

//   @override
//   Widget build(BuildContext context) {
//     return SingleChildScrollView(
//       child: Container(
//         child: _buildPanel(),
//       ),
//     );
//   }

//   Widget _buildPanel() {
//     return ExpansionPanelList(
//       expansionCallback: (int index, bool isExpanded) {
//         setState(() {
//           _data[index].isExpanded = !isExpanded;
//         });
//       },
//       children: _data.map<ExpansionPanel>((Item item) {
//         return ExpansionPanel(
//           headerBuilder: (BuildContext context, bool isExpanded) {
//             return ListTile(
//               title: Text(item.headerValue),
//             );
//           },
//           body: ListTile(
//               title: Text(item.expandedValue),
//               subtitle: Text('To delete this panel, tap the trash can icon'),
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
