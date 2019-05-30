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
      /* appBar: AppBar(
        title: Text(
          "Nike Air Max Collection",
          style: TextStyle(
            fontWeight: FontWeight.w300,
            fontSize: 18
          ),
        ),
        elevation: 0,
        backgroundColor: Colors.transparent,
        toolbarOpacity: .5,
        leading: Icon(Icons.menu),
        actions: <Widget>[
          Icon(Icons.search)
        ],
      ), */
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
                // Color(0xFF1B2330),
                Colors.grey[300],
                Colors.orangeAccent[100],
              ],
              begin: Alignment.topCenter,
              end: Alignment.bottomCenter,
              tileMode: TileMode.clamp
              /* begin: Alignment.topLeft,
              end: Alignment.center,
              stops: [.7,0] */
            )
          ), 
        ),
        SafeArea(
          child: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                Container(
                  width: double.infinity,
                  height: 150,
                  margin: EdgeInsets.only(bottom: 20),
                  child: Image.asset('assets/images/nike.png', fit: BoxFit.fitHeight,),
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
                            backgroundColor: _selectedIndex == i ? Colors.grey[300] : Colors.grey[50],
                            padding: EdgeInsets.only(left: 8, right: 8),
                            label: Text(
                              brand.brandTitle,
                              style: TextStyle(
                                color: _selectedIndex == i ? Colors.grey[600] : Colors.grey[500]
                              ),
                            ),
                            elevation: 4,
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
                SizedBox(height: 10,),
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
                  height: 270,
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
        Positioned(
          top: 0,
          left: 0,
          right: 0,
          child: Container(
            height: 60,
            width: double.infinity,
            padding: EdgeInsets.symmetric(horizontal: 8),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: <Widget>[
                Icon(Icons.menu, color: Colors.grey[600]),
                Container(
                  // color: Colors.orangeAccent,
                  width: MediaQuery.of(context).size.width * .2,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    crossAxisAlignment: CrossAxisAlignment.end,
                    children: <Widget>[
                      Icon(Icons.shopping_basket, color: Colors.grey[600],),
                      Icon(Icons.search, color: Colors.grey[600]),
                    ],
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
  final int cardColor;

  const CardList({Key key, this.title, this.image, this.price, this.shoes, this.cardColor}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: (){
        Navigator.of(context).push(
          MaterialPageRoute(builder: (context) => ShoesDetailPage(shoes: shoes,))
        );
      },
      child: Container(
        // color: Colors.pink,
        width: 200,
        padding: EdgeInsets.only(top: 0, bottom: 5),
        margin: EdgeInsets.fromLTRB(10, 5, 10, 5),
        child: Stack(
          children: <Widget>[
            Positioned(
              bottom: 0,
              left: 0,
              right: 0,
              child: Container(
                height: 200,
                padding: EdgeInsets.fromLTRB(10,35,14,3),
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.all(
                    Radius.circular(10)
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
                    Text(
                      title,
                      style: TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.w600
                      ),
                    ),
                    
                    Align(
                      alignment: Alignment.bottomCenter,
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: <Widget>[
                          IconButton(
                            icon: Icon(Icons.favorite_border),
                            iconSize: 20,
                            onPressed: (){},
                          ),
                          Column(
                            mainAxisAlignment: MainAxisAlignment.spaceAround,
                            children: <Widget>[
                              Text(
                                'R\$199',
                                style: TextStyle(
                                  color: Color(0xFFFEB0BA),
                                  fontSize: 12,
                                  decorationStyle: TextDecorationStyle.wavy
                                ),
                              ),
                              SizedBox(height: 2,),
                              Text(
                                'R\$${price.toStringAsFixed(2)}',
                                style: TextStyle(
                                  fontSize: 18
                                ),                              
                              ),
                            ],
                          ),
                          IconButton(
                            icon: Icon(Icons.shopping_cart),
                            iconSize: 20,
                            onPressed: (){},
                          ),
                        ],
                      ),
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