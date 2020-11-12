import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:instagram_clone/constants/common_numbers.dart';
import 'package:instagram_clone/constants/screen_size.dart';
import 'package:instagram_clone/widgets/avartar_icon.dart';

class ProfileWidget extends StatefulWidget {
  @override
  _ProfileWidgetState createState() => _ProfileWidgetState();
}

class _ProfileWidgetState extends State<ProfileWidget> {
  SelectedTab _selectedTab = SelectedTab.left;
  double _leftMarginSize = 0;
  double _righMarginSize = size.width;

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Column(
        children: <Widget>[
          _appBar(),
          Expanded(
            child: CustomScrollView(
              slivers: <Widget>[
                SliverList(
                    delegate: SliverChildListDelegate([
                  _profile(),
                  _username(),
                  _userDescription(),
                  _editProfileBtn(),
                  _imageTab(),
                  _selectedTabIndicator()
                ])),
                _photoGridViewer()
              ],
            ),
          ),
        ],
      ),
    );
  }

  Row _appBar() {
    return Row(
      children: <Widget>[
        SizedBox(
          width: 55,
        ),
        Expanded(
            child: Text(
          'This is my own instagram project',
          textAlign: TextAlign.center,
        )),
        IconButton(
          icon: Icon(Icons.menu),
          onPressed: () {},
        )
      ],
    );
  }

  SliverToBoxAdapter _photoGridViewer() {
    return SliverToBoxAdapter(
        child: Stack(
      children: [
        AnimatedContainer(
            duration: Duration(milliseconds: 300),
            transform: Matrix4.translationValues(_leftMarginSize, 0, 0),
            curve: Curves.fastOutSlowIn,
            child: GridView.count(
                crossAxisCount: 3,
                shrinkWrap: true,
                childAspectRatio: 1,
                physics: NeverScrollableScrollPhysics(),
                children: List.generate(
                    21,
                    (index) => CachedNetworkImage(
                          imageUrl: "https://picsum.photos/id/$index/100/100",
                          fit: BoxFit.cover,
                        )))),
        AnimatedContainer(
            duration: Duration(milliseconds: 300),
            transform: Matrix4.translationValues(_righMarginSize, 0, 0),
            curve: Curves.fastOutSlowIn,
            child: GridView.count(
                crossAxisCount: 3,
                shrinkWrap: true,
                childAspectRatio: 1,
                physics: NeverScrollableScrollPhysics(),
                children: List.generate(
                    21,
                    (index) => CachedNetworkImage(
                          imageUrl: "https://picsum.photos/id/" +
                              (index + 21).toString() +
                              "/100/100",
                          fit: BoxFit.cover,
                        )))),
      ],
    ));
  }

  Widget _profile() {
    return Padding(
      padding: const EdgeInsets.all(common_padding),
      child: Row(
        children: <Widget>[
          AvartarIcon(size: 80),
          SizedBox(width: 12, height: 12),
          Expanded(
              child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              Column(children: [
                Text("9"),
                Text(
                  "Posts",
                  style: TextStyle(color: Colors.black87),
                )
              ]),
              Column(children: [
                Text("9"),
                Text(
                  "Followers",
                  style: TextStyle(color: Colors.black87),
                )
              ]),
              Column(children: [
                Text("9"),
                Text(
                  "Following",
                  style: TextStyle(color: Colors.black87),
                )
              ]),
            ],
          ))
        ],
      ),
    );
  }

  Widget _username() {
    return Padding(
      padding: const EdgeInsets.symmetric(
          horizontal: common_padding, vertical: common_xxs_padding),
      child: Row(crossAxisAlignment: CrossAxisAlignment.start, children: [
        Text("UserName", style: TextStyle(fontWeight: FontWeight.bold)),
      ]),
    );
  }

  Widget _userDescription() {
    return Padding(
      padding: const EdgeInsets.symmetric(
          horizontal: common_padding, vertical: common_xxs_padding),
      child: Row(crossAxisAlignment: CrossAxisAlignment.start, children: [
        Text(
          'Text1'
          '\nText2',
          maxLines: 20,
        ),
      ]),
    );
  }

  Widget _imageTab() {
    return Padding(
      padding: const EdgeInsets.symmetric(
          horizontal: common_padding, vertical: common_xxs_padding),
      child: Row(
        children: <Widget>[
          Expanded(
              child: IconButton(
                  icon: ImageIcon(
                    AssetImage('assets/images/grid.png'),
                    color: _selectedTab == SelectedTab.left
                        ? Colors.black87
                        : Colors.black26,
                  ),
                  onPressed: () {
                    setState(() {
                      _selectedTab = SelectedTab.left;
                      _leftMarginSize = 0;
                      _righMarginSize = size.width;
                    });
                  })),
          Expanded(
              child: IconButton(
                  icon: ImageIcon(
                    AssetImage('assets/images/saved.png'),
                    color: _selectedTab == SelectedTab.left
                        ? Colors.black26
                        : Colors.black87,
                  ),
                  onPressed: () {
                    setState(() {
                      _selectedTab = SelectedTab.right;
                      _leftMarginSize = -size.width;
                      _righMarginSize = 0;
                    });
                  })),
        ],
      ),
    );
  }

  Widget _editProfileBtn() {
    return Padding(
      padding: const EdgeInsets.symmetric(
          horizontal: common_padding, vertical: common_xxs_padding),
      child: SizedBox(
        height: 24,
        child: OutlineButton(
          onPressed: () {},
          child: Text('Edit Profile'),
          textColor: Colors.black87,
          borderSide: BorderSide(color: Colors.black87),
          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(6)),
        ),
      ),
    );
  }

  Widget _selectedTabIndicator() {
    return AnimatedContainer(
      alignment: _selectedTab == SelectedTab.left
          ? Alignment.centerLeft
          : Alignment.centerRight,
      duration: Duration(milliseconds: 500),
      child: Container(
        height: 3,
        width: size.width / 2,
        color: Colors.black87,
      ),
      curve: Curves.elasticInOut,
    );
  }
}

enum SelectedTab { left, right }
