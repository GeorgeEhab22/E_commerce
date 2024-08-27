class Products {
  final String title;
  final String description;
  final String price;
  final String rating;
  final String thumbnail;
//https://cdn.dummyjson.com/products/images/beauty/Essence%20Mascara%20Lash%20Princess/thumbnail.png
  Products(
      {required this.description,
      required this.price,
      required this.rating,
      required this.thumbnail,
      required this.title});
  factory Products.fromjson(json) {
    return Products(
        description: json['description'] ?? 'no description here',
        price: json['price'].toString(),
        rating: json['rating'].toString(),
        thumbnail: json['thumbnail'] ?? 'no thumbnail here',
        title: json['title'] ?? "no title here");
  }
}
