import 'dart:ui';
import 'package:flutter/material.dart';
import 'package:food_restaurant/utils/colors.dart';
import 'package:food_restaurant/widgets/Social_buttom.dart';

class ProfilePage extends StatefulWidget {
  @override
  _ProfilePageState createState() => _ProfilePageState();
}

class _ProfilePageState extends State<ProfilePage> {
  @override
  Widget build(BuildContext context) {
    Size screenSize = MediaQuery.of(context).size;

    return Scaffold(
      resizeToAvoidBottomPadding: true,
      backgroundColor: primaryColor,
      body: Stack(
        children: <Widget>[
          _buildCoverImage(screenSize),
          SafeArea(
            child: SingleChildScrollView(
              child: Column(
                children: <Widget>[
                  SizedBox(height: screenSize.height / 4.4),
                  _buildProfileImage(),
                  Stack(
                    children: <Widget>[Positioned(child: _buildUserDetail())],
                  )
                ],
              ),
            ),
          )
        ],
      ),
    );
  }

  Widget _buildUserDetail() {
    return Container(
      padding: EdgeInsets.symmetric(vertical: 20, horizontal: 5),
      margin: EdgeInsets.only(left: 20, right: 20),
      height: 370,
      decoration: BoxDecoration(
          color: thirdColor,
          borderRadius: BorderRadius.circular(12),
          boxShadow: [
            BoxShadow(color: thirdColor, blurRadius: 16, offset: Offset(0, 10))
          ]),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.start,
        children: <Widget>[
          SizedBox(
            height: 50,
          ),
          Text(
            "João Mello",
            style: TextStyle(
                color: whiteColor,
                fontWeight: FontWeight.w300,
                fontSize: 30,
                letterSpacing: 1.5),
            textAlign: TextAlign.center,
          ),
          SizedBox(
            height: 10,
          ),
          Text(
            "@JMelloDev",
            style: TextStyle(
                color: Colors.amber[200],
                fontWeight: FontWeight.w300,
                fontSize: 14),
          ),
          SizedBox(
            height: 10,
          ),
          Text(
            "Flutter Developer",
            style: TextStyle(
                color: Colors.amber, fontWeight: FontWeight.w300, fontSize: 14),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              FlatButton.icon(
                icon: Icon(
                  Icons.location_on,
                  color: secondaryColor,
                ),
                label: Text(
                  "Salvador/Ba",
                  style: TextStyle(
                      color: whiteColor,
                      fontWeight: FontWeight.w300,
                      fontSize: 14,
                      letterSpacing: 1.5),
                ),
                onPressed: () {},
                splashColor: Colors.transparent,
              ),
              FlatButton.icon(
                icon: Icon(
                  Icons.phone,
                  color: secondaryColor,
                ),
                label: Text(
                  "+55 (71) 99150-1649",
                  style: TextStyle(
                      color: whiteColor,
                      fontWeight: FontWeight.w300,
                      fontSize: 14,
                      letterSpacing: 1.5),
                ),
                onPressed: () {},
                splashColor: Colors.transparent,
              ),
            ],
          ),
          SizedBox(
            height: 15,
          ),
          SocialButtom()
        ],
      ),
    );
  }

  Widget _buildCoverImage(Size screenSize) {
    return ClipPath(
      clipper: MyClipper(),
      child: Container(
        height: screenSize.height / 2.6,
        decoration: BoxDecoration(
          image: DecorationImage(
            image: AssetImage('assets/images/dish05.jpg'),
            fit: BoxFit.cover,
          ),
        ),
        child: BackdropFilter(
          filter: ImageFilter.blur(
            sigmaX: 6,
            sigmaY: 6
          ),
          child: Container(
            color: Colors.black.withOpacity(.2),
          ),
        ),
      ),
    );
  }

  Widget _buildProfileImage() {
    return Center(
      child: Container(
        padding: EdgeInsets.all(10),
        width: 160,
        height: 160,
        decoration: BoxDecoration(
          gradient: LinearGradient(
            colors: [
              primaryColor,
              primaryColor,
            ],
            begin: Alignment.center,
            end: Alignment.bottomCenter,
            stops: [0.25, 0]),
          shape: BoxShape.circle),
        child: Container(
          width: 160,
          height: 160,
          decoration: BoxDecoration(
            image: DecorationImage(
              image: AssetImage('assets/images/eu.jpg'),
              fit: BoxFit.cover,
              colorFilter:  ColorFilter.mode(Colors.grey.shade400, BlendMode.multiply),
            ),
            borderRadius: BorderRadius.circular(80.0),
            /* border: Border.all(
              color: Colors.white,
              width: 10.0,
            ), */
          ),
        ),
      ),
    );
  }
}

class MyClipper extends CustomClipper<Path> {
  @override
  Path getClip(Size size) {
    var height = size.height;
    var width = size.width;
    var path = Path();

    path.lineTo(0.0, height - 20);

    var firstControlPoint = Offset(width / 4, height);
    var firstEndPoint = Offset(width / 2.25, height - 30.0);
    path.quadraticBezierTo(firstControlPoint.dx, firstControlPoint.dy,
        firstEndPoint.dx, firstEndPoint.dy);

    var secondControlPoint = Offset(width - (width / 3.25), height - 65);
    var secondEndPoint = Offset(width, height - 40);
    path.quadraticBezierTo(secondControlPoint.dx, secondControlPoint.dy,
        secondEndPoint.dx, secondEndPoint.dy);

    path.lineTo(width, height - 40);
    path.lineTo(width, 0.0);
    path.close();

    return path;
  }

  @override
  bool shouldReclip(CustomClipper<Path> oldClipper) => false;
}
