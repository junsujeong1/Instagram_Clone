import 'package:flutter/material.dart';
import 'package:instagram_clone/screens/auth_screen.dart';
import 'package:instagram_clone/widgets/sign_in_widget.dart';

class ProfileSideMenu extends StatelessWidget {
  final double menuWidth;

  const ProfileSideMenu(this.menuWidth, {Key key,}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: SizedBox(
        width: menuWidth,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            ListTile(
              title: Text("Settings", style: TextStyle(fontWeight: FontWeight.bold),)
            ),
            ListTile(
              leading: Icon(Icons.exit_to_app),
              title: Text("Sign out"),
              onTap: () {
                Navigator.of(context).pushReplacement(
                  MaterialPageRoute(builder: (context) => AuthScreen())
                );
              }
            )
          ],
        ),
      ),
    );
  }
}
