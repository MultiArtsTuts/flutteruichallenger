import 'package:flutter/material.dart';
import 'package:food_restaurant/utils/colors.dart';

class BottomBarWidget extends StatelessWidget {
  int _selectedIndex = 1;
  void _onItemTapped(int index) {
    _selectedIndex = index;
  }

  @override
  Widget build(BuildContext context) => Theme(
        data: Theme.of(context).copyWith(canvasColor: thirdColor),
        isMaterialAppTheme: false,
        child: BottomNavigationBar(
          items: [
            BottomNavigationBarItem(
                icon: Icon(
                  Icons.home,
                  color: whiteColor,
                ),
                title: Text(""),
                backgroundColor: secondaryColor),
            BottomNavigationBarItem(
                icon: Icon(
                  Icons.book,
                  color: whiteColor,
                ),
                title: Text(""),
                activeIcon: Icon(Icons.book)),
            BottomNavigationBarItem(
                icon: Icon(
                  Icons.shopping_cart,
                  color: whiteColor,
                ),
                title: Text("")),
            BottomNavigationBarItem(
                icon: Icon(
                  Icons.person,
                  color: whiteColor,
                ),
                title: Text("")),
          ],
          currentIndex: _selectedIndex,
          fixedColor: secondaryColor,
          onTap: _onItemTapped,
          type: BottomNavigationBarType.fixed,
        ),
      );
}
