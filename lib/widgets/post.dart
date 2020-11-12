import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:instagram_clone/constants/common_numbers.dart';
import 'package:instagram_clone/constants/screen_size.dart';
import 'package:instagram_clone/widgets/avartar_icon.dart';
import 'package:instagram_clone/widgets/comment.dart';
import 'package:instagram_clone/widgets/custom_progress_indicator.dart';

class Post extends StatelessWidget {
  final int index;

  Post(this.index, {
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        _postHeader(),
        _postImage(),
        _postAction(),
        _postLikes(),
        _postCaption()
      ]
    );
  }

  Widget _postCaption() {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: common_padding, vertical: common_xxs_padding,),
      child: comment(userName: "Im_Jun_Jeong", comments: "I am hella programmer", timeStamp: new DateTime.now(),),
    );
  }

  Padding _postLikes() {
    return Padding(
        padding: const EdgeInsets.all(common_padding),
        child: Text(
          '15000 likes',
          style: TextStyle(
            fontWeight: FontWeight.bold,
          ),
        ),
      );
  }

  Widget _postHeader() {
    return Row(
      children: <Widget>[
        Padding(
          padding: const EdgeInsets.all(avatar_padding),
          child: AvartarIcon(),
        ),
                 
        Expanded(child: Text("UserName")),
        IconButton(
          icon: Icon(Icons.more_horiz),
          onPressed: null)
      ]
    );
  }

  CachedNetworkImage _postImage() {
    return CachedNetworkImage(
    imageUrl: 'https://picsum.photos/id/$index/3000/3000',
    placeholder: (BuildContext context, String url){
      return CustomProgressIndicator();
    },
    imageBuilder: (context, imageProvider) => AspectRatio(
      aspectRatio: 1,
      child: Container (
        decoration: BoxDecoration(
          image:
            DecorationImage(image: imageProvider, fit: BoxFit.cover)
        ),
      ),
    ),
  );
  }
}

  Row _postAction() {
    return Row(
      children: <Widget> [
        IconButton(icon: ImageIcon(AssetImage('assets/images/bookmark.png')), onPressed: null, color: Colors.black87),
        IconButton(icon: ImageIcon(AssetImage('assets/images/comment.png')), onPressed: null, color: Colors.black87),
        IconButton(icon: ImageIcon(AssetImage('assets/images/direct_message.png')), onPressed: null, color: Colors.black87),
        Spacer(),
        IconButton(icon: ImageIcon(AssetImage('assets/images/heart.png')), onPressed: null, color: Colors.black87),
      ]
    );
  }


