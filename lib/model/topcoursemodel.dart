class Topcourse {
  String title;
  String thumbnail;
  String price;
  Topcourse({
    required this.title,
    required this.price,
    required this.thumbnail,
  });

  factory Topcourse.fromJson(Map<String, dynamic> responce) => Topcourse(
        title: responce["title"],
        price: responce["price"],
        thumbnail: responce["thumbnail"],
      );
}
