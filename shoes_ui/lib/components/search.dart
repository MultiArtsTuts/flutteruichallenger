import 'package:flutter/material.dart';
import 'package:shoes_ui/model/shoes_list.dart';
import 'package:shoes_ui/model/shoes_model.dart';

class Search extends StatefulWidget {
  @override
  _SearchState createState() => _SearchState();
}

class _SearchState extends State<Search> with SingleTickerProviderStateMixin {

  List<Shoes> listItems = ShoesList.shoesList;
  var items = List<Shoes>();
  TextEditingController editingController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(left: 12.0, right: 12.0),
      child: Material(
        elevation: 5,
        borderRadius: BorderRadius.circular(30),
        child: TextField(
          onChanged: (value) {
            filterSearchResults(value);
            print('Value: ' + value);
          },
          controller: editingController,
          decoration: InputDecoration(
            border: InputBorder.none,
            prefixIcon: Icon(Icons.search,
              color: Color(0xFFE511E5),
              size: 25.0),
            contentPadding:
            EdgeInsets.only(left: 10.0, top: 12.0),
            hintText: 'Search',
            hintStyle: TextStyle(
              color: Colors.grey,
            )
          ),
        ),
      ),
    );
  }

  void filterSearchResults(String query) {
    List<String> dummySearchList = List<String>();
    dummySearchList.addAll(listItems);
    if (query.isNotEmpty) {
      List<String> dummyListData = List<String>();
      dummySearchList.forEach((item) {
        if (item.contains(query)) {
          dummyListData.add(item);
        }
      });
      setState(() {
        items.clear();
        items.addAll(dummyListData);

      });
      return;
    } else {
      setState(() {
        items.clear();
        items.addAll(listItems);
      });
    }
  } //
}