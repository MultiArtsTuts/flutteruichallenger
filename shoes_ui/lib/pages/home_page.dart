import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:shoes_ui/model/shoes_list.dart';
import 'package:shoes_ui/model/shoes_model.dart';
import 'package:shoes_ui/pages/shoes_detail.dart';
import 'package:shoes_ui/utils/transformers.dart';
import 'package:transformer_page_view/transformer_page_view.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[200],
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
  int _selectedIndex = 0;
  ShoesList shoesList;
  PageController _pageController;

  @override
  void initState() {
    super.initState();
    SystemChrome.setEnabledSystemUIOverlays([]);
    _pageController = PageController(viewportFraction: .95);
  }

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: <Widget>[
        Container(
          decoration: BoxDecoration(
            gradient: LinearGradient(
              colors: [
                Color(0xFF1B2330),
                Color(0xFFFFFFFF)
              ],
              begin: Alignment.topLeft,
              end: Alignment.center,
              stops: [.7,0]
            )
          ), 
        ),
        SafeArea(
          child: SingleChildScrollView(
            child: Column(
              children: <Widget>[
                Container(
                  width: double.infinity,
                  height: 150,
                  color: Colors.grey[200],
                  margin: EdgeInsets.only(bottom: 20),
                ),
                Padding(
                  padding: const EdgeInsets.only(left:8, right: 8),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: <Widget>[
                      Text(
                        'As melhores marcas estão aqui.',
                        style: TextStyle(
                          fontSize: 18,
                          fontWeight: FontWeight.w300,
                          color: Colors.grey[600]
                        ),
                      ),
                      Text(
                        "ver todas",
                        style: TextStyle(fontSize: 12, color: Colors.grey[500]),
                      ),                
                    ],
                  ),
                ),
                
                // Chips
                Container(
                  width: MediaQuery.of(context).size.width,
                  height: 50,
                  child: ListView.builder(
                    padding: EdgeInsets.symmetric(horizontal: 8),
                    shrinkWrap: true,
                    scrollDirection: Axis.horizontal,
                    itemCount: ShoesList.shoesList.length,
                    itemBuilder: (context, i){
                      var brand = ShoesList.shoesList[i];
                      return Padding(
                        padding: EdgeInsets.only(left: 3, right: 6),
                        child: GestureDetector(
                          onTap: (){
                            _selectedIndex = i;
                            setState((){});
                          },
                          child: Chip(
                            backgroundColor: _selectedIndex == i ? Colors.yellowAccent : Colors.grey[200],
                            padding: EdgeInsets.only(left: 8, right: 8),
                            label: Text(
                              brand.brandTitle,
                              style: TextStyle(
                                color: _selectedIndex == i ? Colors.grey[200] : Colors.grey[500]
                              ),
                            ),
                            elevation: 6,
                            avatar: Image.asset(
                              brand.brandImage,
                              fit: BoxFit.fitWidth,
                              color: Colors.grey[600],
                              width: 20,
                              height:20
                            ),
                          ),
                        ),
                      );
                    },
                  ),
                ),
                Container(
                  height: 250,
                  // color: Colors.yellowAccent,
                  child: 
                  /* TransformerPageView(
                    transformer: ZoomOutPageTransformer(),
                    itemCount: ShoesList.shoesList.length,
                    itemBuilder: (context, i){
                      var item = ShoesList.shoesList[i];
                      return CardList(
                        title: item.title,
                        image: item.pictures[0],
                        price: item.price,
                        shoes: item,
                      );                                           
                    },
                  ), */              
                  
                  ListView.builder(
                    scrollDirection: Axis.horizontal,
                    itemCount: ShoesList.shoesList.length,
                    shrinkWrap: true,
                    itemBuilder: (context, index){
                      var item = ShoesList.shoesList[index];
                      return CardList(
                        title: item.title,
                        image: item.pictures[0],
                        price: item.price,
                        shoes: item,
                      );
                    },
                  ), 
                ),
              ],
            ),
          ),
        ),
      ],
    );
  }
}

class CardList extends StatelessWidget {
  final String title, image;
  final double price;
  final Shoes shoes;

  const CardList({Key key, this.title, this.image, this.price, this.shoes}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: (){
        Navigator.of(context).push(
          MaterialPageRoute(builder: (context) => ShoesDetailPage(shoes: shoes,))
        );
      },
      child: Container(
        // color: Colors.pink,
        width: 180,
        padding: EdgeInsets.only(top: 25),
        margin: EdgeInsets.fromLTRB(10, 5, 10, 5),
        child: Stack(
          children: <Widget>[
            Align(
              alignment: Alignment.centerLeft,
              child: Container(
                height: 180,
                padding: EdgeInsets.fromLTRB(24,30,24,10),
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.all(
                    Radius.circular(16)
                  ),
                  boxShadow: [
                    BoxShadow(
                      color: Colors.black12,
                      blurRadius: 15
                    )
                  ]
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: <Widget>[
                    Text(title,
                      style: TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.w600
                      ),
                    ),
                    
                    Align(
                      alignment: Alignment.bottomRight,
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: <Widget>[
                            Text("R\$${price.toStringAsFixed(2)}",
                            style: TextStyle(
                              color: Colors.grey
                            ),
                          ),
                            Icon(Icons.arrow_forward_ios, color: Colors.grey,),
                          ],
                        ),
                    )
                  ],
                ),
              ),
            ),
            Positioned(
              top: -17,
              left: 0,
              right: 0,
              child: Align(
                alignment: Alignment.topCenter,
                child: Image.asset(image, fit: BoxFit.fill,width: 120,),
              ),
            ),
          ],
        ),
      ),
    );
  }
}