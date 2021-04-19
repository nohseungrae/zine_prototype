import 'package:curved_navigation_bar/curved_navigation_bar.dart';
import 'package:flutter/material.dart';
import 'package:zine_prototype/screens/custom_screen.dart';
import 'package:zine_prototype/screens/home_screen.dart';
import 'package:zine_prototype/screens/side_bar_screen.dart';
import 'package:zine_prototype/widgets/bounce_tab_bar.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {


  int _selectedIndex = 0;
  GlobalKey<ScaffoldState> _key = GlobalKey<ScaffoldState>();

  static List<Widget> _screens = <Widget>[
    HomeScreen(),
    CustomScreen(),
    SideBarScreen(),
    Container(color: Colors.deepOrangeAccent,),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: _key,
      extendBody: true,
      body: IndexedStack(
          index: _selectedIndex,
          children : _screens
      ),
      bottomNavigationBar: BounceTabBar(
        onTabChanged: (index) {
          setState(() {
            _selectedIndex = index;
          });
        },
        backgroundColor: Colors.blue,
        items: [
          Icon(Icons.person_outline, color: Colors.white,),
          Icon(Icons.print, color: Colors.white,),
          Icon(Icons.signal_cellular_no_sim, color: Colors.white,),
          Icon(Icons.speaker_notes, color: Colors.white, ),
        ],
      ),

      // bottomNavigationBar: CurvedNavigationBar(
      //   backgroundColor: Colors.blue,
      //   height: 50,
      //   items :[
      //         Icon(Icons.person_outline, color: Colors.blue,),
      //         Icon(Icons.print, color: Colors.blue,),
      //         Icon(Icons.signal_cellular_no_sim, color: Colors.blue,),
      //         Icon(Icons.speaker_notes, color: Colors.blue, ),
      //   ],
      //   onTap: (index) {
      //     setState(() {
      //       _selectedIndex = index;
      //     });
      //   },
      // ),
    );
  }
}
