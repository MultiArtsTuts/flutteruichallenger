import 'package:flutter/material.dart';
import 'package:food_restaurant/pages/cart_page.dart';
import 'package:food_restaurant/pages/home_page.dart';
import 'package:curved_navigation_bar/curved_navigation_bar.dart';
import 'package:food_restaurant/pages/list_page.dart';
import 'package:food_restaurant/pages/profile_page.dart';
import 'package:food_restaurant/utils/colors.dart';

class BottomBarPage extends StatefulWidget {
  @override
  _BottomBarPageState createState() => _BottomBarPageState();
}

class _BottomBarPageState extends State<BottomBarPage> {
  int _page = 0;

  final _pageOption = [
    HomePage(),
    ListPage(),
    CartPage(),
    ProfilePage()
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: CurvedNavigationBar(
        index: 0,
        items: <Widget>[
          Icon(Icons.home, size: 25, color: whiteColor,),
          Icon(Icons.book, size: 25, color: whiteColor,),
          Icon(Icons.shopping_cart, size: 25, color: whiteColor,),
          Icon(Icons.person, size: 25, color: whiteColor,),
        ],
        color: thirdColor,
        buttonBackgroundColor: thirdColor,
        height: 56,
        backgroundColor: primaryColor,
        animationCurve: Curves.easeInOut,
        animationDuration: Duration(milliseconds: 600),
        onTap: (index){
          setState(() {
            _page = index;
          });
        },
      ),
      body: _pageOption[_page],
    );
  }
}