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

  void setSideBarState () {
    setState(() {
      xOffset = sideBarOpen ? 265 : 60;
    });
  }

  int _seletedIndex = 0;

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
                  child: ListTile(
                    leading: Icon(
                      Icons.search,
                      color: Colors.white,
                    ),
                    title: TextField(
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
                Container(
                  child: Expanded(
                    child: ListView.builder(
                        itemCount: menuItems.length,
                        itemBuilder: (context, index) {
                          return GestureDetector(
                            onTap: () {
                              sideBarOpen = false;
                              _seletedIndex = index;
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
              transform: Matrix4.translationValues(xOffset, yOffset, 1.0),
              width: double.infinity,
              height: double.infinity,
              color : Colors.white,
              child: Column(
                  children: [
                    GestureDetector(
                      onTap: () {
                        sideBarOpen = !sideBarOpen;
                        setSideBarState();
                      },
                      child: Container(
                        margin: EdgeInsets.only(top: 24),
                        height: 60,
                        child: Row(
                          children: [
                            Container(
                                padding: EdgeInsets.all(20),
                                child: Icon(Icons.menu)
                            )
                          ],
                        ),
                      ),
                    )
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
