import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:instagram_clone/constants/common_numbers.dart';
import 'avartar_icon.dart';

class comment extends StatelessWidget {
  final String userName;
  final String comments;
  final DateTime timeStamp;
  final bool showImage;

  const comment({
    Key key, @required this.userName, @required this.comments, this.showImage=true, @required this.timeStamp,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      children: <Widget>[
        if (showImage)
          AvartarIcon(size: 24),
        if (showImage)
          SizedBox(
            width: common_padding,
          ),
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            RichText(
              text: TextSpan(
                children: <TextSpan>[
                  TextSpan(
                    style: TextStyle(fontWeight: FontWeight.bold, color: Colors.black87),
                    text: userName,),
                  TextSpan(text: "    "),
                  TextSpan(text: comments, style: TextStyle(color: Colors.black87),)
                ],
              ),
            ),
            Text(
              timeStamp.toString(),
              style: TextStyle(color: Colors.grey[400], fontSize:10),
            )
          ],
        ),
      ],
    );
  }
}