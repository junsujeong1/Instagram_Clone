import 'package:flutter/material.dart';
import 'package:instagram_clone/constants/common_numbers.dart';
import 'package:instagram_clone/widgets/avartar_icon.dart';
import 'package:instagram_clone/widgets/profile_widget.dart';

class profileScreen extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[50],
      body: ProfileWidget(),
    );
  }
}
