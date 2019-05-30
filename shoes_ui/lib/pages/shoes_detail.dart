import 'package:flutter/material.dart';
import 'package:shoes_ui/components/page_indicator.dart';
import 'package:shoes_ui/model/shoes_model.dart';
import 'package:transformer_page_view/transformer_page_view.dart';

class ShoesDetailPage extends StatefulWidget {
  final Shoes shoes;

  const ShoesDetailPage({Key key, this.shoes}) : super(key: key);
  @override
  _ShoesDetailPageState createState() => _ShoesDetailPageState();
}

class _ShoesDetailPageState extends State<ShoesDetailPage> {
  int currentSizeIndex = 0;
  int currentPage = 0;
  // PageController _controller;
  TransformerPageController _pageController;
  static const _kDuration = const Duration(milliseconds: 300);

  static const _kCurve = Curves.ease;

  @override
  void initState() {
    super.initState();
    // _controller = PageController(viewportFraction: 1);
    _pageController = TransformerPageController(viewportFraction: 1, initialPage: currentPage);
  }

  @override
  void dispose() {
    _pageController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomPadding: false,
      
      backgroundColor: Color(0xFF1B2330),
      body: Stack(
        children: <Widget>[
          ClipPath(
            clipper: MyClipper(),
            child: Container(
              padding: EdgeInsets.only(top: 60, left: 20, right: 20),
              alignment: Alignment.center,
              height: 330,
              width: double.infinity,
              decoration: BoxDecoration(
                color: Color(0xFF55647C),
              ),
              child: Image.asset(
                widget.shoes.brandImage,
                color: Color(0xFF515C73),
                width: 300,
              ),
            ),
          ),
          Positioned(
            bottom: -85,
            right: -95,
            child: Image.asset(
                widget.shoes.brandImage,
                color: Color(0xFF515C73).withOpacity(.05),
                width: 400,
                height: 300,
              ),
          ),
          SafeArea(
            child: SingleChildScrollView(
              padding: EdgeInsets.only(top: 50),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  // Background      
                  Container(
                    padding: EdgeInsets.all(8),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: <Widget>[
                        Text(
                          widget.shoes.title,
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 20,
                            fontWeight: FontWeight.w500
                          ),
                        ),
                        Text(
                          "270",
                          style: TextStyle(
                              color: Colors.black87,
                              fontSize: 20,
                              fontWeight: FontWeight.w500
                          ),
                        ),
                      ],
                    ),
                  ),
                  Container(
                  //  color: Colors.yellow.withOpacity(.3),
                    height: 200,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: <Widget>[
                        // Images
                        Container(
                          height: 170,
                          child: _images()
                          /* TransformerPageView(
                            pageController: _pageController,
                            transformer: ZoomOutPageTransformer(),
                            itemCount: widget.shoes.pictures.length,
                            itemBuilder: (context, i){
                              var images = widget.shoes.pictures;
                              return Align(
                                alignment: Alignment.topRight,
                                child: Image.asset(
                                images[i],
                                width: 400,
                                height: 190, 
                                ),
                              );                                             
                            },
                          ), */
                        ),
                        SizedBox(height: 15,),                  
                        PageIndicator(
                          controller: _pageController,
                          currentIndex: currentPage,
                          pageCount: widget.shoes.pictures.length,
                          onPageSelected: (int page){
                            _pageController.animateToPage(
                              page,
                              duration: _kDuration, 
                              curve: _kCurve
                            );
                          },
                        )
                      ],
                    ),
                  ),
                  Container(
//              height: 200,
                    padding: EdgeInsets.only(top: 3, bottom: 3, left: 18, right: 18),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: <Widget>[
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: <Widget>[
                            Container(
                              height: 25,
                              child: Chip(
                                padding: EdgeInsets.only(bottom:5),
                                elevation: 5,
                                label: Text(
                                  'Em estoque',
                                  style: TextStyle(
                                    fontSize: 10,
                                    color: Color(0xFF1B2330),
                                    fontWeight: FontWeight.w700
                                  ),
                                ),
                                backgroundColor: Color(0xFF84ECB9),
                                shadowColor: Color(0xFF84ECB9),
                              ),
                            ),
                            RichText(
                              text: TextSpan(
                                text: 'R\$',
                                style: TextStyle(
                                  fontWeight: FontWeight.w600,
                                  fontSize: 20,
                                  fontFamily: 'Roboto',
                                  color: Colors.blueGrey
                                ),
                                children: <TextSpan>[
                                  TextSpan(
                                    text: '${widget.shoes.price}',
                                    style: TextStyle(
                                color: Colors.white,
                                fontSize: 30,
                                fontWeight: FontWeight.w300,
                              ),
                                  )
                                ]
                              ),
                            ),
                            
                          ],
                        ),
                        SizedBox(height: 10,),
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: <Widget>[
                            Text(
                              widget.shoes.colors,
                              style: TextStyle(
                                color: Colors.white,
                                fontWeight: FontWeight.w500
                              ),
                            ),
                            SizedBox(height: 5,),
                            Text(
                              widget.shoes.description,
                              style: TextStyle(
                                color: Colors.white,
                                fontSize: 12,
                                fontWeight: FontWeight.w300,
                                shadows: [
                                  BoxShadow(
                                    color: Colors.black,
                                    blurRadius: 1,
                                    offset: Offset(1, 2)
                                  )
                                ]
                              ),
                            ),
                            SizedBox(height: 20,),
                            Text(
                              'Size guide'.toUpperCase(),
                              style: TextStyle(
                                color: Colors.white,
                                fontSize: 10
                              ),
                            ),
                            Container(
                              // color: Colors.deepPurple,
                              height: 150,
                              width: double.infinity,
                              child: _sizes()
                            ),
                            SizedBox(height: 30,),
                            Align(
                              alignment: Alignment.bottomRight,
                              child: ClipRRect(
                                borderRadius: BorderRadius.circular(6),
                                child: Container(
                                  width: 130,
                                    padding: EdgeInsets.all(8),
                                    child: Row(
                                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                      children: <Widget>[
                                        Text(
                                          "Add to Bag",
                                          style: TextStyle(
                                            color: Colors.white,
                                            fontWeight: FontWeight.w300
                                          ),
                                        ),Text(
                                          "+",
                                          style: TextStyle(
                                            color: Colors.white,
                                            fontSize: 25,
                                            fontWeight: FontWeight.w200
                                          ),
                                        ),
                                      ],
                                    ),
                                    color: Colors.deepOrange,
                                ),
                              ),
                            )
                          ],
                        )
                      ],
                    ),
                  )
                ],
              ),
            ),
          ),
          // Top
          Positioned(
            top: 15,
            left: 0,
            right: 0,
            child: Container(
              height: 60,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: <Widget>[
                  IconButton(
                    icon: Icon(Icons.arrow_back_ios,
                      color: Colors.blueGrey[100],
                      size: 18,
                    ),
                    onPressed: (){
                      Navigator.of(context).pop(context);
                    }
                  ),
                  Text(
                    '${widget.shoes.title}',
                    style: TextStyle(
                      color: Colors.grey[200],
                      fontSize: 18
                    ),
                  ),
                  IconButton(
                    icon: Icon(Icons.search, color: Colors.blueGrey[100],size: 18,),
                    onPressed: (){}
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _images() {
    var images = widget.shoes.pictures;
    return PageView(
      controller: _pageController,
      children: images.map((img){
        return SizedBox(
          child: Hero(
            tag: widget.shoes.title,
            child: Image.asset(
              img,
              width: 400,
              height: 190,
              fit: BoxFit.contain,
            ),
          ),
        );
      }).toList(),
      onPageChanged: (index){
        setState(() {
          currentPage = index;
        });
        
      },
    );
  }

  Widget _sizes() {
    var sizes = widget.shoes.sizeNumList;

    return GridView(
      // mainAxisSize: MainAxisSize.min,
      children: sizes.map((item){
        var index = sizes.indexOf(item);
        return GestureDetector(
          onTap: (){
            setState(() {
              currentSizeIndex = index;
            });
          },
          child: sizeItem(item, index == currentSizeIndex, context),
        );
      }).toList(),
      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 6,
      ),
      physics: NeverScrollableScrollPhysics(),
    );
  }

  Widget sizeItem(String size, bool isSelected, BuildContext context) {
  return Padding(
    padding: const EdgeInsets.all(8.0),
    child: Container(
      /* width: 40.0,
      height: 40.0, */
      decoration: BoxDecoration(
        color: isSelected ? Colors.lime : Color(0xFF525663),
        borderRadius: BorderRadius.circular(5.0),
        boxShadow: [
          BoxShadow(
            color:
              isSelected ? Colors.black.withOpacity(.5) : Colors.black12,
            offset: Offset(0, 5.0),
            blurRadius: 5.0
          )
        ]
      ),
      child: Center(
        child: Text(
          size,
          style: TextStyle(
            color: isSelected ? Color(0xFF525663) : Colors.white,
            fontWeight: FontWeight.w500
          ),
        ),
      ),
    ),
    );
  }


}

class MyClipper extends CustomClipper<Path> {
  @override
  Path getClip(Size size) {
    var path = Path();

    path.lineTo(0, size.height);
    path.lineTo(size.width, size.height - 130);
    path.lineTo(size.width, 0);
    path.close();
    return path;
  }

  @override
  bool shouldReclip(CustomClipper<Path> oldClipper) {
    return true;
  }

}