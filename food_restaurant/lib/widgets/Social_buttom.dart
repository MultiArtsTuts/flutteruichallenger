import 'dart:async';

import 'package:flutter/material.dart';
import 'package:food_restaurant/utils/colors.dart';
import 'package:food_restaurant/utils/my_flutter_app_icons.dart';

class SocialButtom extends StatefulWidget {
  @override
  _SocialButtomState createState() => _SocialButtomState();
}

class _SocialButtomState extends State<SocialButtom> {
  @override
  Widget build(BuildContext context) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.center,
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: <Widget>[
        Buttons(CustomIcons.facebook, facebook, whiteColor),
        Buttons(CustomIcons.twitter, twitter, whiteColor),
        Buttons(CustomIcons.github_circled, github, whiteColor),
        Buttons(CustomIcons.youtube, youtube, whiteColor),
        Buttons(CustomIcons.medium, medium, whiteColor),
      ],
    );
  }
}

class Buttons extends StatefulWidget {
  final icon;
  final colorTrue;
  final colorFalse;

  Buttons(this.icon, this.colorTrue, this.colorFalse);

  @override
  _ButtonsState createState() => _ButtonsState();
}

class _ButtonsState extends State<Buttons> {
  final StreamController<bool> _streamController = StreamController<bool>();
  // bool _isSelected = false;

  @override
  void dispose() {
    _streamController.close();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return StreamBuilder<bool>(
      stream: _streamController.stream,
      initialData: false,
      builder: (context, snapshot) {
        bool isSelected = snapshot.data??false;
        return GestureDetector(
          onTap: (){_streamController.sink.add(!isSelected);},
          child: Container(
            height: 45,
            width: 45,
            padding: EdgeInsets.all(5),
            child: Icon(
              widget.icon,
              color: !isSelected ? widget.colorFalse: widget.colorTrue,
            ),
            decoration: BoxDecoration(
                color: !isSelected ? widget.colorTrue : widget.colorFalse, borderRadius: BorderRadius.circular(25)),
          ),
        );
      }
    );
  }
}