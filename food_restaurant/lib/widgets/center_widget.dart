import 'package:flutter/material.dart';
import 'package:food_restaurant/blocs/bloc_provider.dart';
import 'package:food_restaurant/blocs/counter_bloc.dart';
import 'package:food_restaurant/model/cart_model.dart';
import 'package:food_restaurant/pages/cart_page.dart';
import 'package:food_restaurant/utils/colors.dart';

class CenterWidget extends StatefulWidget {
  @override
  _CenterWidgetState createState() => _CenterWidgetState();
}

class _CenterWidgetState extends State<CenterWidget> {
  CartModel cartModel;
  
  @override
  Widget build(BuildContext context) {
    final CounterBloc counterBloc = BlocProvider.of<CounterBloc>(context);

    return Positioned(
      top: 200,
      left: 0,
      right: 0,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          GestureDetector(
            onTap: () {
              Navigator.of(context)
                  .push(MaterialPageRoute(builder: (context) => CartPage()));
            },
            child: Material(
              elevation: 6,
              shadowColor: secondaryColor,
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(100)),
              child: Container(
                height: 200,
                width: 200,
                padding: EdgeInsets.all(5),
                decoration: BoxDecoration(
                  color: secondaryColor,
                  borderRadius: BorderRadius.circular(100),
                ),
                child: CircleAvatar(
                  backgroundImage: AssetImage("assets/images/dish05.jpg"),
                ),
              ),
            ),
          ),
          SizedBox(
            height: 10,
          ),
          Text(
            "R\$5,00",
            style: TextStyle(
                fontFamily: "Vogue",
                color: whiteColor,
                fontSize: 35,
                letterSpacing: 2),
          ),
          SizedBox(
            height: 5,
          ),
          Text(
            "Unidade",
            style: TextStyle(color: whiteColor, fontSize: 13),
          ),
          SizedBox(
            height: 10,
          ),
          Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Container(
                width: 25,
                height: 25,
                decoration: BoxDecoration(
                    color: secondaryColor,
                    borderRadius: BorderRadius.circular(20)),
                child: IconButton(
                  onPressed: (){
                    
                  },
                  icon: Icon(
                    Icons.remove,
                    color: whiteColor,
                    size: 16,
                  ),
                  color: secondaryColor,
                ),
              ),
              SizedBox(
                width: 10,
              ),
              Text(
                "2",
                style: TextStyle(color: whiteColor),
              )  ,
              SizedBox(
                width: 10,
              ),
              GestureDetector(
                onTap: () {

                },
                child: Container(
                  width: 25,
                  height: 25,
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
          SizedBox(
            height: 15,
          ),
          ButtonTheme(
            buttonColor: secondaryColor,
            height: 30,
            minWidth: 150,
            child: RaisedButton(
              onPressed: () {},
              elevation: 10,
              textColor: whiteColor.withOpacity(.6),
              child: Text("COMPRAR"),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(30)
              ),
            ),
          )
        ],
      ),
    );
  }
}