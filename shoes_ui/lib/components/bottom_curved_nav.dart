import 'package:curved_navigation_bar/curved_navigation_bar.dart';
import 'package:flutter/material.dart';
import 'package:shoes_ui/pages/cart/cart_page.dart';
import 'package:shoes_ui/pages/home_page.dart';
import 'package:shoes_ui/pages/products_detail.dart';
import 'package:shoes_ui/pages/profile_page.dart';

class BottomCurvedNav extends StatefulWidget {
  @override
  _BottomCurvedNavState createState() => _BottomCurvedNavState();
}

class _BottomCurvedNavState extends State<BottomCurvedNav> {
  int pageIndex = 0;
  var pages = [HomePage(), ProfilePage(), CartPage()];

  Widget _showPage = ProductDetail();

  Widget _pageChoose(int page) {
    switch (page) {
      case 0:
        return pages[0];
        break;
      case 1:
        return pages[1];
        break;
      case 1:
        return pages[2];
        break;
      default:
        return Container(
          color: Colors.white,
          child: Text("Página não encontrada", style: TextStyle(fontSize: 30)),
        );
    }
  }

  @override
  Widget build(BuildContext context) {
    return CurvedNavigationBar(
      index: pageIndex,
      backgroundColor: Colors.amber[300],
      animationCurve: Curves.easeInOut,
      animationDuration: Duration(milliseconds: 300),
      color: Colors.grey[100],
      height: 50,
      items: <Widget>[
        Icon(Icons.home, size: 30),
        Icon(Icons.list, size: 30),
        Icon(Icons.shopping_basket, size: 30),
        Icon(Icons.person_outline, size: 30),
      ],
      onTap: (index) {
        setState(() {
          _showPage = _pageChoose(index);
        });
         
      },
    );
  }
}
