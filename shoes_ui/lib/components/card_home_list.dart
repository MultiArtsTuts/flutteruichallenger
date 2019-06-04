import 'package:flutter/material.dart';
import 'package:shoes_ui/model/shoes_list.dart';
import 'package:shoes_ui/model/shoes_model.dart';
import 'package:shoes_ui/pages/shoes_detail.dart';

class CardHomeList extends StatelessWidget {
  final String title, image;
  final double price;
  final Shoes shoes;
  final int cardColor;

  const CardHomeList({Key key, this.title, this.image, this.price, this.shoes, this.cardColor}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: (){
        Navigator.of(context).push(
          MaterialPageRoute(builder: (context) => ShoesDetailPage(shoes: shoes,))
        );
      },
      child: Container(
        // color: Colors.pinkAccent,
        width: 175,
        padding: EdgeInsets.only(top: 0, bottom: 5),
        margin: EdgeInsets.fromLTRB(2, 2, 10, 2),
        child: Stack(
          children: <Widget>[
            Positioned(
              bottom: 0,
              left: 0,
              right: 0,
              child: Container(
                height: 180,
                padding: EdgeInsets.fromLTRB(0,35,14,0),
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.all(
                    Radius.circular(6)
                  ),
                  boxShadow: [
                    BoxShadow(
                      color: Colors.black12,
                      blurRadius: 8
                    )
                  ]
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: <Widget>[
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Text(
                        title,
                        style: TextStyle(
                          fontSize: 18,
                          fontWeight: FontWeight.w600
                        ),
                      ),
                    ),
                    
                    Row(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: <Widget>[
                        IconButton(
                          icon: Icon(Icons.favorite_border),
                          iconSize: 17,
                          onPressed: (){},
                        ),
                        Column(
                          mainAxisAlignment: MainAxisAlignment.spaceAround,
                          children: <Widget>[
                            Text(
                              'R\$199',
                              style: TextStyle(
                                color: Color(0xFFFEB0BA),
                                fontSize: 11,
                                decorationStyle: TextDecorationStyle.wavy
                              ),
                            ),
                            SizedBox(height: 2,),
                            Text(
                              'R\$${price.toStringAsFixed(2)}',
                              style: TextStyle(
                                fontSize: 15
                              ),                              
                            ),
                          ],
                        ),
                        IconButton(
                          icon: Icon(Icons.shopping_cart),
                          iconSize: 15,
                          onPressed: (){},
                        ),
                      ],
                    )
                  ],
                ),
              ),
            ),
            Positioned(
              top: -10,
              left: 0,
              right: 0,
              child: Align(
                alignment: Alignment.topCenter,
                child: Hero(
                  tag: title,
                  child: Image.asset(
                    image,
                    fit: BoxFit.fill,
                    width: 130,
                    height: 100,
                  )
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class ListCard extends StatefulWidget {
  @override
  _ListCardState createState() => _ListCardState();
}

class _ListCardState extends State<ListCard> {
  List<Shoes> listItems = ShoesList.shoesList;
  var items = List<Shoes>();

  @override
  void initState() {
    super.initState();
    items.addAll(listItems);
  }


  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        Padding(
          padding: const EdgeInsets.only(left:8, right: 8),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: <Widget>[
              Text(
                'Destaques da semana.',
                style: TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.w400,
                  color: Colors.grey[700]
                ),
              ),               
            ],
          ),
        ),
        Container(
          height: 250,
          // color: Colors.yellowAccent,
          child:            
          
          ListView.builder(
            scrollDirection: Axis.horizontal,
            itemCount: items.length,
            shrinkWrap: true,
            itemBuilder: (context, index){
              var item = items[index];
              return CardHomeList(
                title: item.title,
                image: item.pictures[0],
                price: item.price,
                shoes: item,
              );
            },
          ), 
        ),
      ],
    );
  }
}