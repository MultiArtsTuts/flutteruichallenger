import 'package:flutter/material.dart';

class PageIndicator extends StatelessWidget {
  final int currentIndex;
  final int pageCount;
  final PageController controller;
  final ValueChanged<int> onPageSelected;

  PageIndicator({this.currentIndex, this.pageCount, this.controller, this.onPageSelected});

  _indicator(bool isActive, int index) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 4.0),
      child: InkWell(
        onTap: () => onPageSelected(index),
        child: Container(
          width: isActive ? 30 : 20,
          height: isActive ? 9 : 7,
          decoration: BoxDecoration(
            color: isActive ? Colors.deepOrange : Color(0xFF3E4750),
            boxShadow: [
              BoxShadow(
                color: Colors.black12,
                offset: Offset(0.0, 0.0),
                blurRadius: 5.0
              )
            ],
            borderRadius: BorderRadius.circular(5)
          ),
        ),
      ),
    );
  }

  _buildPageIndicators() {
    List<Widget> indicatorList = [];
    for (int i = 0; i < pageCount; i++) {
      indicatorList
          .add(i == currentIndex ? _indicator(true, i) : _indicator(false, i));
    }
    return indicatorList;
  }

  @override
  Widget build(BuildContext context) {
    return new Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: _buildPageIndicators(),
    );
  }
}
