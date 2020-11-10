import 'package:flutter/material.dart';
import 'package:instagram_clone/constants/common_numbers.dart';
import 'package:instagram_clone/widgets/avartar_icon.dart';

class profileScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[50],
      body: SafeArea(
        child: Column(
          children: <Widget>[
            _appBar(),
            _username(),
            _description(),
          ],
        ),
      ),
    );
  }

  Widget _username() {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: common_padding, vertical: common_xxs_padding),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [Text("UserName", style: TextStyle(fontWeight: FontWeight.bold)),]
      ),
    );
  }

  Row _appBar() {
    return Row(
            children: <Widget>[
              SizedBox(width: 55,),
              Expanded(child: Text('aasdfasdfasdf', textAlign: TextAlign.center,)),
              IconButton(
                icon: Icon(Icons.menu),
                onPressed: () {},
              )e9x gear
            ],
          );
  }

  Widget _description() {
    return Padding(
    padding: const EdgeInsets.symmetric(horizontal: common_padding, vertical: common_xxs_padding),
    child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [Text('Text1'
                          '\nText2',maxLines: 20,),]
    ),
  );}
}
