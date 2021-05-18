import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:no_faces/pages/Favorites.dart';
import 'package:no_faces/pages/ProfileScreen.dart';
import 'package:no_faces/pages/Today.dart';

class HomeScreen extends StatefulWidget {
  final List<Widget> _children = [Today(), Favorites(), ProfileScreen()];

  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  int _selectedIndex = 0;

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    const curveHeight = 55.0;

    return Scaffold(
      appBar: _selectedIndex != 2
          ? AppBar(
              toolbarHeight: 40,
              flexibleSpace: Container(
                child: Align(
                  alignment: Alignment(0, 2),
                  child: Text(
                    "No Faces",
                    style: TextStyle(
                        color: Colors.white,
                        letterSpacing: 1.3,
                        wordSpacing: -2,
                        fontWeight: FontWeight.w500,
                        fontSize: 28.0),
                  ),
                ),
                decoration: new ShapeDecoration(
                  shape: const MyShapeBorder(curveHeight),
                  color: _selectedIndex == 0
                      ? Color.fromRGBO(117, 121, 255, 1)
                      : Color.fromRGBO(178, 36, 239, 1),
                  // gradient: LinearGradient(
                  //   begin: Alignment.centerLeft,
                  //   end: Alignment.centerRight,
                  //   colors: <Color>[
                  //     Color.fromRGBO(178, 36, 239, 1),
                  //     Color.fromRGBO(117, 121, 255, 1)
                  //   ],
                  // ),
                ),
              ),
            )
          : null,
      bottomNavigationBar: BottomNavigationBar(
        backgroundColor: Color.fromRGBO(20, 20, 20, 1),
        unselectedItemColor: Color.fromRGBO(100, 100, 100, 1),
        selectedItemColor: Colors.white,
        items: [
          BottomNavigationBarItem(icon: Icon(Icons.chat), label: "Today"),
          BottomNavigationBarItem(
              icon: Icon(
                Icons.favorite,
              ),
              label: "Favorites"),
          BottomNavigationBarItem(icon: Icon(Icons.person), label: "Profile")
        ],
        currentIndex: _selectedIndex,
        onTap: _onItemTapped,
      ),
      body: widget._children[_selectedIndex],
    );
  }
}

class MyShapeBorder extends ContinuousRectangleBorder {
  const MyShapeBorder(this.curveHeight);
  final double curveHeight;

  @override
  Path getOuterPath(Rect rect, {TextDirection textDirection}) => Path()
    ..lineTo(0, rect.size.height)
    ..quadraticBezierTo(
      rect.size.width / 2,
      rect.size.height + curveHeight * 2,
      rect.size.width,
      rect.size.height,
    )
    ..lineTo(rect.size.width, 0)
    ..close();
}
