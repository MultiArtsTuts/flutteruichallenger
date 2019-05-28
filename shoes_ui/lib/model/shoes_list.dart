import 'package:shoes_ui/model/shoes_model.dart';

class ShoesList {
  static List<Shoes> shoesList = [
    Shoes(
      title: "Nike Air Max",
      description: "Be Bold with Nike Air Max 270",
      colors: "White / Orange",
      price: 150,
      sizeNumList: [
        "36","38","40","42","44"
      ],
      pictures: [
        "assets/images/nike.png",
        "assets/images/nike-free.png",
        "assets/images/nike-jordan.png",
      ]
    ),
    Shoes(
        title: "Nike Free Nike Air Max Sneakers Shoe",
        description: "Be Bold with Nike Air Max 270, featured fresh new materials, head turning colourrways, and Nike\'s tallest Air units ever",
        colors: "Aqua/Eletric Blue",
        price: 170,
        sizeNumList: [
          "47","42","38","40"
        ],
        pictures: [
          "assets/images/nike.png",
          "assets/images/nike-free.png",
          "assets/images/nike-jordan.png",
        ]
    ),
    Shoes(
        title: "Nike Air Max Sneakers Shoe Air Jordan",
        description: "Be Bold with Nike Air Max 270, featured fresh new materials, head turning colourrways, and Nike\'s tallest Air units ever",
        colors: "Red/White",
        price: 170,
        sizeNumList: [
          "28","32","36","47","42","38","40"
        ],
        pictures: [
          "assets/images/nike-jordan.png",
          "assets/images/nike-free.png",
          "assets/images/nike.png",
          "assets/images/nike-jordan.png",
        ]
    ),
  ];

  static Shoes getShoesByTitle(title){
    return shoesList.where((p) => p.title == title).first;
  }
}

// naty_smith17
// _dayasilva6
// _maariiaeduaarda