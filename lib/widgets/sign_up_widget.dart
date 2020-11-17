import 'package:flutter/material.dart';
import 'package:instagram_clone/constants/common_numbers.dart';
import 'package:instagram_clone/home_page.dart';

class SignUpWidget extends StatefulWidget {
  @override
  _SignUpWidgetState createState() => _SignUpWidgetState();
}

class _SignUpWidgetState extends State<SignUpWidget> {
  GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  TextEditingController _emailController = TextEditingController();
  TextEditingController _passwordController = TextEditingController();
  TextEditingController _confirmPasswordController = TextEditingController();
  bool _showPassword = true;
  bool _showConfirmPassword = true;

  @override
  void dispose() {
    _emailController.dispose();
    _passwordController.dispose();
    _confirmPasswordController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      //pin the bottom app bar permanently
      resizeToAvoidBottomInset: true,
      body: GestureDetector(
        onTap: () {
          FocusScope.of(context).requestFocus(new FocusNode());
        },
        child: Form(
          key: _formKey,
          child: Padding(
            padding: const EdgeInsets.all(common_padding),
            child: ListView(children: [
              SizedBox(
                height: common_logo_gap,
              ),
              Image.asset('assets/images/insta_text_logo.png'),
              Padding(
                padding: const EdgeInsets.all(common_xxs_padding),
                child: TextFormField(
                  controller: _emailController,
                  decoration: InputDecoration(
                      enabledBorder: OutlineInputBorder(
                        borderSide: BorderSide(color: Colors.grey[300]),
                        borderRadius: BorderRadius.circular(8),
                      ),
                      filled: true,
                      hintStyle: new TextStyle(color: Colors.grey[300]),
                      hintText: "Email",
                      fillColor: Colors.grey[100]),
                  validator: (text) {
                    if (isEmail(text) && text.isNotEmpty) {
                      return null;
                      // ignore: missing_return
                    } else {
                      return ("asdfasdf");
                    }
                  },
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(common_xxs_padding),
                child: TextFormField(
                  controller: _passwordController,
                  obscureText: _showPassword,
                  decoration: InputDecoration(
                    enabledBorder: OutlineInputBorder(
                      borderSide: BorderSide(color: Colors.grey[300]),
                      borderRadius: BorderRadius.circular(8),
                    ),
                    filled: true,
                    hintStyle: new TextStyle(color: Colors.grey[300]),
                    hintText: "Password",
                    fillColor: Colors.grey[100],
                    suffixIcon: GestureDetector(
                      onTap: () {
                        _togglePasswordVisibility();
                      },
                      child: Icon(
                        _showPassword ? Icons.visibility_off : Icons.visibility,
                        color: Colors.grey[800],
                      ),
                    ),
                  ),
                  validator: (text) {
                    if (text.length >= 8 && text.isNotEmpty) {
                      return null;
                      // ignore: missing_return
                    } else {
                      return ("asdfasdf");
                    }
                  },
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(common_xxs_padding),
                child: TextFormField(
                  controller: _confirmPasswordController,
                  obscureText: _showConfirmPassword,
                  decoration: InputDecoration(
                    enabledBorder: OutlineInputBorder(
                      borderSide: BorderSide(color: Colors.grey[300]),
                      borderRadius: BorderRadius.circular(8),
                    ),
                    filled: true,
                    hintStyle: new TextStyle(color: Colors.grey[300]),
                    hintText: "Confirm Password",
                    fillColor: Colors.grey[100],
                    suffixIcon: GestureDetector(
                      onTap: () {
                        _toggleVisibility();
                      },
                      child: Icon(
                        _showConfirmPassword
                            ? Icons.visibility_off
                            : Icons.visibility,
                        color: Colors.grey[800],
                      ),
                    ),
                  ),
                  validator: (text) {
                    if (text.isNotEmpty && text == _passwordController.text) {
                      return null;
                      // ignore: missing_return
                    } else {
                      return ("asdfasdf");
                    }
                  },
                ),
              ),
              SizedBox(
                child: FlatButton(
                  onPressed: () {
                    if (_formKey.currentState.validate()) {
                      print('asdfa');
                      Navigator.of(context).pushReplacement(
                          MaterialPageRoute(builder: (context) => HomePage()));
                    }
                  },
                  child: Text(
                    'Join',
                  ),
                  textColor: Colors.white,
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(12.0),
                      side: BorderSide(color: Colors.lightBlueAccent)),
                  color: Colors.lightBlueAccent,
                ),
              ),
              Row(
                children: [
                  Divider(
                    color: Colors.grey[300],
                    thickness: 5,
                    height: 5,
                  ),
                  Text(
                    "OR",
                    style: TextStyle(
                        color: Colors.grey, fontWeight: FontWeight.bold),
                  ),
                  Divider(
                    color: Colors.grey[300],
                    thickness: 5,
                    height: 5,
                  ),
                ],
              )
            ]),
          ),
        ),
      ),
    );
  }

  bool isEmail(String em) {
    String p =
        r'^(([^<>()[\]\\.,;:\s@\"]+(\.[^<>()[\]\\.,;:\s@\"]+)*)|(\".+\"))@((\[[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\])|(([a-zA-Z\-0-9]+\.)+[a-zA-Z]{2,}))$';
    RegExp regExp = new RegExp(p);
    return regExp.hasMatch(em);
  }

  void _toggleVisibility() {
    setState(() {
      _showConfirmPassword = !_showConfirmPassword;
    });
  }

  void _togglePasswordVisibility() {
    setState(() {
      _showPassword = !_showPassword;
    });
  }
}
