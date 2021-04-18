import 'package:flutter/material.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  List<BottomNavigationBarItem> btmNavItems = [
    BottomNavigationBarItem(icon:Icon(Icons.home), label : ''),
    BottomNavigationBarItem(icon:Icon(Icons.search), label : ''),
    BottomNavigationBarItem(icon:Icon(Icons.add), label : ''),
    BottomNavigationBarItem(icon:Icon(Icons.healing), label : ''),
    BottomNavigationBarItem(icon:Icon(Icons.account_circle), label : '')
  ];

  int _selectedIndex = 0;
  GlobalKey<ScaffoldState> _key = GlobalKey<ScaffoldState>();

  static List<Widget> _screens = <Widget>[
    Container(color: Colors.yellowAccent,),
    Container(color: Colors.blueAccent,),
    Container(color: Colors.greenAccent,),
    Container(color: Colors.deepPurpleAccent,),
    Container(color: Colors.deepOrangeAccent,),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: _key,
      body: IndexedStack(
          index: _selectedIndex,
          children : _screens
      ),
      bottomNavigationBar: Container(
        child: BottomNavigationBar(
          showSelectedLabels: false,
          showUnselectedLabels: false,
          unselectedItemColor: Colors.grey,
          selectedItemColor: Colors.black87,
          currentIndex: _selectedIndex,
          items : btmNavItems,
          onTap: (int index) {
            switch(index) {
              default:
                setState(() { _selectedIndex = index; });
            }
          },
        ),
      ),
    );
  }
}
