import 'dart:ui';

import 'package:flutter/material.dart';

class SideBarScreen extends StatefulWidget {
  @override
  _SideBarScreenState createState() => _SideBarScreenState();
}

class _SideBarScreenState extends State<SideBarScreen> {

  final List<String> menuItems = ['Home','Blogger', 'Add New Post', 'Settings'];
  final List<String> menuIcons = ['home','person', 'logout', 'settings'];

  bool sideBarOpen = false;

  double yOffset = 0;
  double xOffset = 60;
  double pageScale = 1;

  void setSideBarState () {
    setState(() {
      xOffset = sideBarOpen ? 265 : 60;
      yOffset = sideBarOpen ? 70 : 0;
      pageScale = sideBarOpen ? 0.8 : 1;
    });
  }

  int _seletedIndex = 0;
  String pageTitle = 'Homepage';

  void setPageTitle() {
    switch(_seletedIndex){
      case 0:
        pageTitle = 'Homepage';
        break;
      case 1:
        pageTitle = 'Blogger';
        break;
      case 2:
        pageTitle = 'Add New Post';
        break;
      case 3:
        pageTitle = 'Settings';
        break;
    }
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.blue,
      child: Stack(
        children: [
          Container(
            width: double.infinity,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              mainAxisSize: MainAxisSize.max,
              children: [
                Container(
                  margin : EdgeInsets.only(top : 24),
                  color: Colors.blue,
                  child: Container(
                    child: ListTile(
                      leading: Icon(
                        Icons.search,
                        color: Colors.white,
                      ),
                      title: TextField(
                        maxLines: 1,
                        decoration: InputDecoration(
                                border : InputBorder.none,
                                contentPadding: EdgeInsets.all(20),
                                hintText: 'Search here',
                                hintStyle: TextStyle(
                                  color : Colors.white
                              )
                            ),
                      ),
                    ),
                  ),
                ),
                Container(
                  child: Expanded(
                    child: ListView.builder(
                        itemCount: menuItems.length,
                        itemBuilder: (context, index) {
                          return GestureDetector(
                            onTap: () {
                              sideBarOpen = false;
                              _seletedIndex = index;
                              setPageTitle();
                              setSideBarState();
                            },
                            child: MenuItem(
                              itemText: menuItems[index],
                              selected: _seletedIndex,
                              position: index,
                            ),
                          );
                        })
                  ),
                ),
                Container(
                  margin: EdgeInsets.only(bottom: MediaQuery.of(context).size.height * 0.07),
                  child: MenuItem(
                    itemText: "Logout",
                    selected: _seletedIndex,
                    position: menuItems.length + 1,
                  ),
                ),
              ],
            ),
          ),
          GestureDetector(
            onTap: () {
              sideBarOpen = !sideBarOpen;
              setSideBarState();
            },
            child: AnimatedContainer(
              curve: Curves.easeInOut,
              duration: Duration(milliseconds: 200),
              transform: Matrix4.translationValues(xOffset, yOffset, 1.0)..scale(pageScale),
              width: double.infinity,
              height: double.infinity,
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: sideBarOpen ? BorderRadius.circular(20) : BorderRadius.circular(0)
              ),
              child: Column(
                  children: [
                    Container(
                      margin: EdgeInsets.only(top: 24),
                      height : 60,
                      child: Row(
                        children: [
                          GestureDetector(
                            onTap: () {
                              sideBarOpen = !sideBarOpen;
                              setSideBarState();
                            },
                            child: Container(
                                color: Colors.white,
                                padding: EdgeInsets.all(20),
                                child: Icon(Icons.menu)
                            ),
                          ),
                          Container(
                            padding: EdgeInsets.only(top: 20, bottom: 20),
                            child: Text(
                              pageTitle,
                              style: TextStyle(
                                fontSize: 18
                              ),
                            ),
                          )
                        ],
                      ),
                    ),
                  ]
              ),
            ),
          )
        ],
      ),
    );
  }
}

class MenuItem extends StatelessWidget {
  final String itemText;
  final String itemIcon;
  final int selected;
  final int position;

  const MenuItem({
    Key key, this.itemText, this.itemIcon, this.selected, this.position,
  }) : super(key: key);


  @override
  Widget build(BuildContext context) {
    return Container(
      color: selected == position ? Colors.black : Colors.blue,
      child: ListTile(
        leading: Icon(
          Icons.home,
          color: Colors.white,
        ),
        title: Text(itemText,
          style: TextStyle(
            color: Colors.white,
            fontSize: 16
          ),
        ),
      ),
    );
  }
}
