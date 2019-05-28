import 'package:flutter/material.dart';
import 'package:food_restaurant/utils/colors.dart';
import 'package:food_restaurant/widgets/bottom_bar_widget.dart';
import 'package:food_restaurant/widgets/center_widget.dart';
import 'package:food_restaurant/widgets/top_bar_widget.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: primaryColor,
      body: Stack(
        fit: StackFit.expand,
        children: <Widget>[
          TopBarWidget(),
          Positioned(
            top: 80,
            left: 0,
            right: 0,
            child: Container(
              padding: EdgeInsets.all(10),
              width: double.infinity,
              height: MediaQuery.of(context).size.height,
              // color: secondaryColor,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  Text(
                    "Food\nRestaurant",
                    style: TextStyle(
                        color: whiteColor,
                        fontFamily: "Vogue",
                        fontWeight: FontWeight.w500,
                        fontSize: 25,
                        letterSpacing: 2.5),
                  ),
                  SizedBox(
                    height: 15,
                  ),
                  Text(
                    "BURGER & CHIPS",
                    style: TextStyle(
                        color: secondaryColor,
                        fontFamily: "Vogue",
                        fontSize: 15,
                        letterSpacing: 2),
                  ),
                ],
              ),
            ),
          ),
          CenterWidget(),
        ],
      ),
      // bottomNavigationBar: BottomBarWidget(),
    );
  }
}
