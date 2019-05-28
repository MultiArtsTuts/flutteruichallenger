import 'package:flutter/material.dart';
import 'package:shoes_ui/model/shoes_list.dart';
import 'package:shoes_ui/pages/shoes_detail.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "Nike Air Max Collection",
          style: TextStyle(
            fontWeight: FontWeight.w300,
            fontSize: 18
          ),
        ),
        elevation: 0,
        leading: Icon(Icons.menu),
        actions: <Widget>[
          Icon(Icons.search)
        ],
      ),
      body: ProductDetail(),
    );
  }
}

class ProductDetail extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => _ProductDetailState();
}

class _ProductDetailState extends State<ProductDetail> {

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        gradient: LinearGradient(
            colors: [
              Color(0xFF515C73),
              Color(0xFF1B2330)
            ],
          begin: Alignment.topLeft,
          end: Alignment.center,
          stops: [.7,0]
        )
      ),
      child: ListView.builder(
        itemCount: ShoesList.shoesList.length,
        itemBuilder: (context, i){
          var shoes = ShoesList.shoesList[i];
          return GestureDetector(
            onTap: (){
              Navigator.of(context).push(
                MaterialPageRoute(builder: (context) => ShoesDetailPage(shoes: shoes,))
              );
            },
            child: Card(
              elevation: 5,
              child: Container(
                padding: EdgeInsets.all(5),
                child: Row(
                  children: <Widget>[
                    CircleAvatar(
                      radius: 25,
                      child: Image.asset(shoes.pictures[0]),
                    ),
                    SizedBox(width: 15,),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: <Widget>[
                        Text(
                            shoes.title
                        ),
                        Text(
                          "R\$${shoes.price}",
                          style: TextStyle(
                            fontSize: 13,
                            fontWeight: FontWeight.w600
                          ),
                        ),
                      ],
                    )

                  ],
                ),
              ),
            ),
          );
        }
      ),
    );
  }
}
