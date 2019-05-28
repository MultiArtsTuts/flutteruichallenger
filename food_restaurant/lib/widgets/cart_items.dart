import 'package:flutter/material.dart';
import 'package:food_restaurant/utils/colors.dart';

class CartItems extends StatelessWidget {

  final int id; String title; String description; int quantity; double price;
  CartItems({this.id, this.title, this.description, this.quantity, this.price});

  @override
  Widget build(BuildContext context) {
    return ListTile(
      title: Card(
        elevation: 2,
        color: primaryColor,
        margin: EdgeInsets.only(bottom: 1),
        child: Container(
            height: 80,
            // margin: EdgeInsets.only(top: 5, bottom: 5),
            padding: EdgeInsets.all(8),
            color: primaryColor,
            child: Row(
              children: <Widget>[
                Expanded(
                  flex: 4,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                      crossAxisAlignment: CrossAxisAlignment.start,
                        children: <Widget>[
                          Text(
                            title,
                            style: TextStyle(
                                color: whiteColor,
                                fontSize: 16,
                                fontWeight: FontWeight.w600
                            ),
                          ),
                          Text(
                            "Unid: ${price.toStringAsFixed(2)}",
                            style: TextStyle(
                                color: whiteColor,
                                fontSize: 12,
                                fontWeight: FontWeight.w300,
                                fontStyle: FontStyle.italic
                            ),
                          )
                        ],
                      ),
                      Container(
                        margin: EdgeInsets.only(top: 5),
                        height: 1,
                        color: Colors.grey.withOpacity(.09),
                      ),
                      SizedBox(
                        height: 5,
                      ),
                      Text(
                          description,
                          style: TextStyle(
                              color: whiteColor,
                              fontSize: 13,
                              fontWeight: FontWeight.w100
                          )
                      )
                    ],
                  ),
                ),
                SizedBox(width: 15),
                Expanded(
                  flex: 2,
                  child: Column(
                    children: <Widget>[
                      Text(
                          "R\$${price * quantity}",
                          style: TextStyle(color: whiteColor, fontSize: 16)
                      ),
                      Container(
                        margin: EdgeInsets.only(top: 5),
                        height: 1,
                        color: Colors.grey.withOpacity(.09),
                      ),
                      SizedBox(height: 15),
                      Row(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: <Widget>[
                          InkWell(
                            onTap: () {},
                            borderRadius: BorderRadius.circular(20),
                            child: Container(
                              width: 20,
                              height: 20,
                              decoration: BoxDecoration(
                                  color: secondaryColor,
                                  borderRadius: BorderRadius.circular(20)
                              ),
                              child: Icon(
                                Icons.remove,
                                color: whiteColor,
                                size: 16,
                              ),
                            ),
                          ),
                          SizedBox(width: 10),
                          Text(
                            "${quantity.toString()}",
                            style: TextStyle(color: whiteColor),
                          ),
                          SizedBox(width: 10),
                          InkWell(
                            onTap: () {},
                            borderRadius: BorderRadius.circular(20),
                            child: Container(
                              width: 20,
                              height: 20,
                              decoration: BoxDecoration(
                                  color: secondaryColor,
                                  borderRadius: BorderRadius.circular(20)),
                              child: Icon(
                                Icons.add,
                                color: whiteColor,
                                size: 16,
                              ),
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                )
              ],
            )
        ),
      ),
    );
  }
}
