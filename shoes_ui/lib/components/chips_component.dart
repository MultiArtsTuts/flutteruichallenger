import 'package:flutter/material.dart';
import 'package:shoes_ui/model/shoes_list.dart';

class ChipsComponent extends StatefulWidget {
  @override
  _ChipsComponentState createState() => _ChipsComponentState();
}

class _ChipsComponentState extends State<ChipsComponent> {
  int _selectedIndex = 0;
  ShoesList shoesList;

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
                'As melhores marcas estão aqui.',
                style: TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.w300,
                  color: Colors.black
                ),
              ),
              Text(
                "ver todas",
                style: TextStyle(fontSize: 12, color: Colors.grey[800]),
              ),                
            ],
          ),
        ),
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
                    ),
                  ),
                ),
              );
            },
          ),
        ),
      ],
    );
  }
}