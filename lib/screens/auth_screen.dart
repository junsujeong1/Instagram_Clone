import 'package:flutter/material.dart';
import 'package:instagram_clone/widgets/sign_in_widget.dart';
import 'package:instagram_clone/widgets/sign_up_widget.dart';

class AuthScreen extends StatefulWidget {
  @override
  _AuthScreenState createState() => _AuthScreenState();
}

class _AuthScreenState extends State<AuthScreen> {
  List<Widget> widgets = [SignInWidget(), SignUpWidget()];
  int _currentWidget = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      body: SafeArea(
        child: Stack(children: [
          IndexedStack(
            children: widgets,
            index: _currentWidget,
          ),
          Positioned(
            left: 0,
            right: 0,
            bottom: 0,
            height: 30,
            child: Container(
              color: Colors.white,
              child: FlatButton(
                shape: Border(top: BorderSide(color: Colors.grey)),
                child: RichText(
                  text: TextSpan(
                      text: (_currentWidget == 1)
                          ? "Already have an account? "
                          : "Don't have an account? ",
                      style: TextStyle(color: Colors.grey),
                      children: [
                        TextSpan(
                            text:
                                (_currentWidget == 1) ? "Sign In " : "Sing Up",
                            style: TextStyle(
                                color: Colors.blue,
                                fontWeight: FontWeight.bold)),
                      ]),
                ),
                onPressed: () {
                  setState(() {
                    _currentWidget == 0
                        ? _currentWidget = 1
                        : _currentWidget = 0;
                  });
                },
              ),
            ),
          )
        ]),
      ),
    );
  }
}
