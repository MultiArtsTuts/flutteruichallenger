class Shoes {
  final String title;
  final String description;
  final String colors;
  final String brandTitle;
  final String brandImage;
  final double price;
  final bool active;
  final List<String> sizeNumList;
  final List<String> pictures;

  // Map<int, String> map = pictures.asMap();

  const Shoes(
      {this.title,
      this.description,
      this.colors,
      this.brandTitle,
      this.brandImage,
      this.price,
      this.active,
      this.sizeNumList,
      this.pictures})
      : assert(price != null);

  Shoes copyWith(
      {String title,
      String description,
      String colors,
      String brandTitle,
      String brandImage,
      double price,
      bool active,
      List sizeNumList,
      List pictures}) {
    return Shoes(
      title: title ?? this.title,
      description: description ?? this.description,
      colors: colors ?? this.colors,
      brandTitle: brandTitle ?? this.brandTitle,
      brandImage: brandImage ?? this.brandImage,
      price: price ?? this.price,
      active: active ?? this.active,
      sizeNumList: sizeNumList ?? this.sizeNumList,
      pictures: pictures ?? this.pictures,
    );
  }
}
