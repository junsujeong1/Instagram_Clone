import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:instagram_clone/constants/common_numbers.dart';

class AvartarIcon extends StatelessWidget {
  final double size;

  AvartarIcon({
    Key key, this.size=avatar_Size
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ClipOval(
      child: CachedNetworkImage(
        imageUrl: 'https://picsum.photos/100',
        width: size,
        height: size,
      ),
    );
  }
}