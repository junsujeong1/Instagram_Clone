import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:instagram_clone/constants/common_numbers.dart';
import 'package:instagram_clone/widgets/Avartar_Icon.dart';
import 'package:instagram_clone/widgets/custom_progress_indicator.dart';

class Post extends StatelessWidget {
  final int index;
  Size size;
  Post(this.index, {
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {

    if (size==null)
      size = MediaQuery.of(context).size;

    return Column(
      children: <Widget>[
        _postHeader(),
        _PostImage()
      ]
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

  CachedNetworkImage _PostImage() {
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

