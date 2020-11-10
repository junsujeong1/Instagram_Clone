import 'package:flutter/material.dart';
import 'file:///C:/Users/junsu%20jeongj/AndroidStudioProjects/instagram_clone/lib/screens/feed_screen.dart';
import 'package:instagram_clone/screens/profile_screen.dart';

class home_page extends StatefulWidget {
  home_page({
    Key key,
  }) : super(key: key);

  @override
  _home_pageState createState() => _home_pageState();
}

class _home_pageState extends State<home_page> {

  List<BottomNavigationBarItem> BtmNavBarItems = [
    BottomNavigationBarItem(icon: Icon(Icons.home), label: ""),
    BottomNavigationBarItem(icon: Icon(Icons.search), label: ""),
    BottomNavigationBarItem(icon: Icon(Icons.add), label: ""),
    BottomNavigationBarItem(icon: Icon(Icons.healing), label: ""),
    BottomNavigationBarItem(icon: Icon(Icons.account_circle), label: ""),
  ];

  int _selectedIndex = 0;

  List<Widget> widgetList = <Widget> [
    FeedScreen(),
    Container(color: Colors.amberAccent),
    Container(color: Colors.deepPurple),
    Container(color: Colors.blueAccent),
    profileScreen(),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: widgetList[_selectedIndex],
      bottomNavigationBar: BottomNavigationBar(
        showSelectedLabels: false,
        showUnselectedLabels: false,
        items: BtmNavBarItems,
        selectedItemColor: Colors.black,
        unselectedItemColor: Colors.grey,
        currentIndex: _selectedIndex,
        onTap: _onBtmItemClick,
      ),
    );
  }

  void _onBtmItemClick(int value) {
    setState(() {
      _selectedIndex = value;
    });

  }
}



///
/// starting from 0 in BtmNavBarItems
/// current index
/// onTap : _onBtmItemClick(int index) (when clicking)