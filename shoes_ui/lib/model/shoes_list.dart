import 'package:shoes_ui/model/shoes_model.dart';

class ShoesList {
  static List<Shoes> shoesList = [
    Shoes(
      brandTitle: 'NIKE',
      brandImage: "assets/images/brand/nike-logo.png",
      title: "Nike Air Max",
      description: "Be Bold with Nike Air Max 270",
      colors: "White / Orange",
      price: 150,
      active: false,
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
      brandTitle: 'Mizuno',
      brandImage: "assets/images/brand/mizuno.png",
      title: "Nike Free Nike Air Max Sneakers Shoe",
      description: "Be Bold with Nike Air Max 270, featured fresh new materials, head turning colourrways, and Nike\'s tallest Air units ever",
      colors: "Aqua/Eletric Blue",
      price: 170,
      active: true,
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
      brandTitle: 'Reebok',
      brandImage: "assets/images/brand/reebok-icon.png",
      title: "Nike Air Max Sneakers Shoe Air Jordan",
      description: "Be Bold with Nike Air Max 270, featured fresh new materials, head turning colourrways, and Nike\'s tallest Air units ever",
      colors: "Red/White",
      price: 170,
      active: false,
      sizeNumList: [
        "28","32","36","47","42","38","40"
      ],
      pictures: [
        "assets/images/nike-free.png",
        "assets/images/nike.png",
        "assets/images/nike-jordan.png",
      ]
    ),
    Shoes(
      brandTitle: 'Puma',
      brandImage: "assets/images/brand/puma.png",
      title: "Nike Air Max Sneakers Shoe Air Jordans",
      description: "Be Bold with Nike Air Max 270, featured fresh new materials, head turning colourrways, and Nike\'s tallest Air units ever",
      colors: "Red/White",
      price: 170,
      active: false,
      sizeNumList: [
        "28","32","36","47","42","38","40"
      ],
      pictures: [
        "assets/images/nike-free.png",
        "assets/images/nike.png",
        "assets/images/nike-jordan.png",
      ]
    ),
    Shoes(
      brandTitle: 'Adidas',
      brandImage: "assets/images/brand/adidas-icon.png",
      title: "Adidas Energy Boost 3",
      description: "Be Bold with Adidas didas 270, featured fresh new materials, head turning colourrways, and Nike\'s tallest Air units ever",
      colors: "Laranja/Rosa/Vermelhos",
      price: 170,
      active: true,
      sizeNumList: [
        "28","32","36","47","42","38","40"
      ],
      pictures: [
        "assets/images/products/adidas/1.png",
        "assets/images/products/adidas/2.png",
        "assets/images/nike.png",
        "assets/images/nike-jordan.png",
      ]
    ),
  ];

  static Shoes getShoesByTitle(active){
    return shoesList.where((p) => p.active == true).first;
  }
}

// naty_smith17
// _dayasilva6
// _maariiaeduaarda
// estherr16_
// mah_tavaress_ 
// lovattelyjacke