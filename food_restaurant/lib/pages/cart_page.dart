import 'package:flutter/material.dart';
import 'package:food_restaurant/model/cart_model.dart';
import 'package:food_restaurant/data/cart_data.dart';
import 'package:food_restaurant/utils/colors.dart';
import 'package:food_restaurant/widgets/bottom_bar_widget.dart';
import 'package:food_restaurant/widgets/cart_items.dart';
import 'package:food_restaurant/widgets/top_bar_widget.dart';
import 'package:animated_card/animated_card.dart';

class CartPage extends StatefulWidget {
  @override
  _CartPageState createState() => _CartPageState();
}

class _CartPageState extends State<CartPage> {
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: primaryColor,
        body: CustomPaint(
          painter: PrimaryPainter(),
          child: Stack(
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
                      Align(
                        alignment: Alignment.centerRight,
                        child: ButtonTheme(
                          buttonColor: secondaryColor,
                          height: 35,
                          minWidth: 110,
                          child: RaisedButton.icon(
                            onPressed: () {},
                            icon: Icon(
                              Icons.shopping_cart,
                              color: whiteColor,
                              size: 16,
                            ),
                            label: Text(
                              "3 Items",
                              style: TextStyle(color: whiteColor),
                            ),
                            color: secondaryColor,
                            shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(20)),
                          ),
                        ),
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
              Positioned(
                top: 200,
                left: 0,
                right: 0,
                child: Container(
                  width: double.infinity,
                  height: MediaQuery.of(context).size.height - 240,
                  child: ListProducts()
                ),
              ),
              // BottomBarWidget()
            ],
          ),
        ),
        // bottomNavigationBar: BottomBarWidget()
      );
  }
}

class ListProducts extends StatelessWidget {
  final List<CartModel> _products = products;
  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: _products.length,
      itemBuilder: (BuildContext context, int index) {
        return AnimatedCard(
          direction: AnimatedCardDirection.right, //Initial animation direction
          initDelay: Duration(milliseconds: 0), //Delay to initial animation
          duration: Duration(milliseconds: 500), //Initial animation duration
         onRemove: () => _products.removeAt(index), //Implement this action to active dismiss
          child: CartItems(
            id: _products[index].id,
            title: _products[index].title,
            description: _products[index].description,
            price: _products[index].price,
            quantity: _products[index].quantity,
          )
        );
      },
      shrinkWrap: true,
      physics: ClampingScrollPhysics(),
//      padding: EdgeInsets.symmetric(horizontal: 15),
    );
  }
}

class PrimaryPainter extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    final height = size.height;
    final width = size.width;
    Paint paint = Paint();

    Path mainBackground = Path();
    mainBackground.addRect(Rect.fromLTRB(0, 0, width, height));
    paint.color = thirdColor;
    canvas.drawPath(mainBackground, paint);

    Path ovalPath = Path();
    // Start paint from 2% height to the left
    ovalPath.moveTo(0, height * 0.2);
    // paint a curve from current position to middle of the ecreen
    ovalPath.quadraticBezierTo(width * 0.45, height * 0.25, width * 0.51, height * 0.5);
    // paint a curve from current position to middle of the ecreen at widht * 0.1
    ovalPath.quadraticBezierTo(width * 0.58, height * 0.8, width * 0.1, height);
    // draw remaining line to bottom left side
    ovalPath.lineTo(0, height);
    // Close line to reset it back
    ovalPath.close();

    paint.color = primaryColor;
    canvas.drawPath(ovalPath, paint);


    Path ovalPath2 = Path();
    // Start paint from 2% height to the left
    ovalPath2.moveTo(width * 2, height);
    // paint a curve from current position to middle of the ecreen
    ovalPath2.quadraticBezierTo(width * 5, height * 2, width * 5, height * 5);
    // paint a curve from current position to middle of the ecreen at widht * 0.1
    ovalPath2.quadraticBezierTo(width * 5, height * 8, width * 1, height);
    // draw remaining line to bottom left side
    ovalPath2.lineTo(0, height);
    // Close line to reset it back
    ovalPath2.close();

    paint.color = secondaryColor;
    canvas.drawPath(ovalPath2, paint);
  }

  @override
  bool shouldRepaint(CustomPainter oldDelegate) {
    return oldDelegate != this;
  }

}