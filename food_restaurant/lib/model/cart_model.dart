import 'package:flutter/material.dart';

class CartModel {
  final String title, description;
  final double price;
  final int id, quantity;

  CartModel(
      {@required this.id,
      @required this.title,
      this.description,
      this.price,
      this.quantity});
}
