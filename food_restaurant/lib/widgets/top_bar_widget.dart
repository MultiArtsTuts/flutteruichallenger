import 'package:flutter/material.dart';
import 'package:food_restaurant/utils/colors.dart';

class TopBarWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) => Positioned(
            top: 30,
            left: 0,
            right: 0,
            child: Container(
              width: double.infinity,
              height: 40,
              // color: Colors.deepOrangeAccent,
              padding: EdgeInsets.symmetric(horizontal: 10),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: <Widget>[
                  GestureDetector(
                    onTap: (){
                      Navigator.of(context).pop(context);
                    },
                    child: Icon(
                      Icons.arrow_back,
                      color: secondaryColor,
                    ),
                  ),
                  Icon(
                    Icons.format_align_right,
                    color: secondaryColor,
                  )
                ],
              ),
            ),
          );
}