import 'package:flutter/material.dart';
import 'package:instagram_clone/constants/common_numbers.dart';

class SignInWidget extends StatefulWidget {
  @override
  _SignInWidgetState createState() => _SignInWidgetState();
}

class _SignInWidgetState extends State<SignInWidget> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: common_padding),
      child: Column(
        children: [
          Container(
            color: Colors.orangeAccent,
            height: 200.0,
            alignment: Alignment.center,
            child: Text(
              "INSTAGRAM",
              style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontFamily: "VeganStyle",
                  color: Colors.black87),
            ),
          ),
          TextFormField(
            decoration: InputDecoration(
              labelText: 'User Name',
            ),
          ),
          TextFormField(
            decoration: InputDecoration(
              labelText: 'Password',
            ),
          ),
          FlatButton(
            onPressed: () {},
            child: Text('Log in'),
            textColor: Colors.black87,
            shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(6)),
          ),
        ],
      ),
    );
  }
}
