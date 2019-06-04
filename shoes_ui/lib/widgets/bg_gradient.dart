import 'package:flutter/material.dart';

class BgGradient extends StatelessWidget {
  final Color color1;
  final Color color2;
  final AlignmentGeometry begin = Alignment.topCenter;
  final AlignmentGeometry end = Alignment.bottomCenter;

  const BgGradient({Key key, this.color1, this.color2}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        gradient: LinearGradient(
          colors: [
            // Color(0xFF1B2330),
           /*  Colors.grey[300],
            Colors.amber[200], */
            color1,
            color2
          ],
          begin: begin,
          end: end,
          tileMode: TileMode.clamp
          /* begin: Alignment.topLeft,
          end: Alignment.center,
          stops: [.7,0] */
        )
      ), 
    );
  }
}