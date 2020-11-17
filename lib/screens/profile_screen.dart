import 'package:flutter/material.dart';
import 'package:instagram_clone/constants/screen_size.dart';
import 'package:instagram_clone/widgets/profile_side_menu.dart';
import 'package:instagram_clone/widgets/profile_widget.dart';

class profileScreen extends StatefulWidget {
  @override
  _profileScreenState createState() => _profileScreenState();
}

class _profileScreenState extends State<profileScreen> {
  final duration = Duration(milliseconds: 300);

  final double screenWidth = size.width;
  final double menuWidth = size.width/2;

  double bodyXPos= 0;

  double menuXPos = size.width;

  MenuStatus _menuStatus = MenuStatus.closed;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[50],
      body: Stack(
        children: [
          AnimatedContainer(
            child: ProfileWidget(onMenuChanged:() {
              setState((){
                _menuStatus = (_menuStatus==MenuStatus.opened)? MenuStatus.closed : MenuStatus.opened;

                switch(_menuStatus){
                  case MenuStatus.opened:
                    bodyXPos = -menuWidth;
                    menuXPos = menuWidth;
                    break;
                  case MenuStatus.closed:
                    bodyXPos = 0;
                    menuXPos = screenWidth;
                    break;
                }
              });
            },),
            duration: duration,
            transform: Matrix4.translationValues(bodyXPos, 0, 0),),
          AnimatedContainer(
            duration: duration,
            transform: Matrix4.translationValues(menuXPos, 0, 0),
            child: Positioned(top: 0, bottom: 0,
                child: ProfileSideMenu(menuWidth))),
        ],
      ),
    );
  }
}

enum MenuStatus { opened, closed }
