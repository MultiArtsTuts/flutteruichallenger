import 'package:flutter/material.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:shoes_ui/model/shoes_list.dart';

class Carousel extends StatefulWidget {
   

  // const Carousel({Key key, this.shoesList}) : super(key: key);
  @override
  _CarouselState createState() => _CarouselState();
}

class _CarouselState extends State<Carousel> {
  int _current = 0;
  List shoesList = List<ShoesList>();

  List<T> map<T>(List list, Function handle){
    List<T> result = [];
    for(var i = 0; i < list.length; i++) {
      result.add(handle(i, list[i]));
    }
    return result;
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: <Widget>[
          CarouselSlider(
            height: 200,
            initialPage: 0,
            enlargeCenterPage: true,
            enableInfiniteScroll: false,
            scrollDirection: Axis.horizontal,
            onPageChanged: (index){
              setState(() {
                _current = index;
              });
            },
            items: ShoesList.shoesList.map((imgUrl) {
              return Builder(
                builder: (context){
                  return Container(
                    width: MediaQuery.of(context).size.width,
                    margin: EdgeInsets.symmetric(horizontal: 10),
                    decoration: BoxDecoration(
                      color: Colors.green,
                      borderRadius: BorderRadius.circular(10)
                    ),
                    child: Image.asset(imgUrl.brandImage[0]),
                  );
                },
              );
            }).toList()
          ),
          SizedBox(height: 20,),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: map<Widget>(shoesList, (index, url){
              return Container(
                width: _current == index ? 20 : 10,
                height: _current == index ? 15 : 10,
                margin: EdgeInsets.symmetric(vertical: 10, horizontal: 2),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(6),
                  color: _current == index ? Colors.redAccent : Colors.green
                ),
              );
            }),
          )
        ],
      ),
    );
  }
}