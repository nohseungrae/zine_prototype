import 'dart:math';

import 'package:flutter/material.dart';

class HomeScreen extends StatefulWidget {
  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {

  double value = 0;

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Container(
          color: Colors.blue,
          child: SafeArea(
            child: Container(
              width: 200,
              padding: EdgeInsets.all(8.0),
              child: Column(
                children: [
                  DrawerHeader(
                      child: Column(
                        children: [
                          CircleAvatar(
                            radius: 50.0,
                            backgroundImage: NetworkImage(
                              "https://picsum.photos/id/1/100/100",
                            ),
                          ),
                          SizedBox(height: 10),
                          Text('nolec',
                            style: TextStyle(
                              color: Colors.white,
                              fontSize: 20
                            ),
                          ),
                        ],
                      )
                  ),
                  Expanded(
                      child: ListView(
                        children: [
                          ListTile(
                            leading: Icon(
                              Icons.home,
                              color: Colors.white,
                            ),
                            title : Text('Home', style : TextStyle(color: Colors.white)),
                            onTap: (){},
                          ),
                          ListTile(
                            leading: Icon(
                              Icons.person,
                              color: Colors.white,
                            ),
                            title : Text('Profile', style : TextStyle(color: Colors.white)),
                            onTap: (){},
                          ),
                          ListTile(
                            leading: Icon(
                              Icons.settings,
                              color: Colors.white,
                            ),
                            title : Text('Setting', style : TextStyle(color: Colors.white)),
                            onTap: (){},
                          ),
                          ListTile(
                            leading: Icon(
                              Icons.logout,
                              color: Colors.white,
                            ),
                            title : Text('Log Out', style : TextStyle(color: Colors.white)),
                            onTap: (){},
                          ),
                        ],
                      )
                  )
                ],
              ),
            )
          ),
        ),
        TweenAnimationBuilder(
          tween: Tween<double>(begin: 0, end: value),
          duration: Duration(milliseconds: 500),
          builder: (_, double val, __) {
            return (
              Transform(
                alignment: Alignment.center,
                transform: Matrix4.identity()
                  ..setEntry(3, 2, 0.001)
                    ..setEntry(0, 3, 200 * val)
                      ..rotateY(pi/6 * val),
                child: Scaffold(
                  appBar: AppBar(
                    title : Text('3D 드로우 메뉴')
                  ),
                  body: Center(
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text('Swipe right to open the menu 👉'),
                        ElevatedButton(onPressed: () {}, child: Text('Drag me to right'))
                      ],
                    ),
                  ),
                ),
              )
            );
          },
        ),

        GestureDetector(
          onHorizontalDragUpdate: (e) {
            if(e.delta.dx > 0){
              setState(() {
                value = 1;
              });
            } else {
              setState(() {
                value = 0;
              });
            }
          },
          // onTap: () {
          //   setState(() {
          //     value == 0 ? value = 1 : value = 0;
          //   });
          // },
        )
      ],
    );
  }
}
