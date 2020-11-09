import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_cache_manager/flutter_cache_manager.dart';
import 'widgets/Post.dart';

class FeedScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CupertinoNavigationBar(
        leading: IconButton(
          onPressed: null,
          icon: Icon(
            Icons.camera_alt,
            color: Colors.black87,),
        ),
        middle: Text(
          "instagram",
          style: TextStyle(
              fontFamily: "VeganStyle"
          ),
        ),
        trailing: Row(
          mainAxisSize: MainAxisSize.min,
          children: <Widget> [
            IconButton(
                icon: ImageIcon(AssetImage('assets/images/actionbar_camera.png')),
                onPressed: null,
              color: Colors.black87,
            )
          ],
        ),
      ),
      body: ListView.builder(itemBuilder: feedItemBuilder, itemCount: 5,)
      );
  }

  Widget feedItemBuilder(BuildContext context, int index){
    return Post(index);
  }
}


