import 'package:flutter/material.dart';
import 'package:shoes_ui/components/card_home_list.dart';
import 'package:shoes_ui/components/chips_component.dart';
import 'package:shoes_ui/widgets/bg_gradient.dart';

class ProductDetail extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => _ProductDetailState();
}

class _ProductDetailState extends State<ProductDetail> {
  // PageController _pageController;

  @override
  void initState() {
    super.initState();
    // SystemChrome.setEnabledSystemUIOverlays([]);
    // _pageController = PageController(viewportFraction: .95);
  }

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: <Widget>[
        BgGradient(
          color1: Color(0xFFE0E0E0),
          color2: Colors.amber[300],
        ),
        SafeArea(
          child: SingleChildScrollView(
            // padding: EdgeInsets.only(top: 18),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                Container(
                  width: double.infinity,
                  height: 150,
                  margin: EdgeInsets.only(bottom: 20),
                  child: Image.asset('assets/images/nike.png', fit: BoxFit.fitHeight,),
                ),
                // Chips
                ChipsComponent(),
                SizedBox(height: 10,),                
                ListCard(),
                Padding(
                  padding: const EdgeInsets.all(10),
                  child: Container(
                    width: double.infinity,
                    height: 250,
                    color: Colors.amberAccent,
                  ),
                )
              ],
            ),
          ),
        ),
      
      ],
    );
  }
}
