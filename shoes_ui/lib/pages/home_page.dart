import 'package:curved_navigation_bar/curved_navigation_bar.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:shoes_ui/components/bottom_curved_nav.dart';
import 'package:shoes_ui/pages/cart/cart_page.dart';
import 'package:shoes_ui/pages/products_detail.dart';
import 'package:shoes_ui/pages/profile_page.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  int pageIndex = 0;
  var pages = [ProductDetail(), CartPage(), ProfilePage()];

  Widget _showPage = ProductDetail();

  Widget _pageChoose(int page) {
    switch (page) {
      case 0:
        return pages[0];
        break;
      case 1:
        return pages[1];
        break;
      case 2:
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
    return Scaffold(
      backgroundColor: Colors.grey[200],
      appBar: AppBar(
        centerTitle: true,
        title: Text(
          "Nike Air Max Collection",
          style: TextStyle(
            fontWeight: FontWeight.w300,
            fontSize: 20,
            color: Colors.grey[600]
          ),
        ),
        elevation: 0,
        backgroundColor: Colors.grey[300],
        leading: Icon(Icons.menu, color: Colors.grey[600]),
        actions: <Widget>[
          IconButton(
            icon: Icon(Icons.search, color: Colors.grey[600]),
            onPressed: () {},
          ),
          IconButton(
            icon: Icon(Icons.shopping_basket, color: Colors.grey[600]),
            onPressed: () {},
          ),
        ],
      ),
      body: _showPage,
      
    );
  }
}
