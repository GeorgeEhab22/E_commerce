import 'package:hive/hive.dart';
part 'products_model.g.dart';

@HiveType(
  typeId: 0,
)
class ProductModel {
  @HiveField(0)
  final String? id;
  @HiveField(1)
  final String? title;
  @HiveField(2)
  final String? description;
  @HiveField(3)
  final String? price;
  @HiveField(4)
  final String? rating;
  @HiveField(5)
  final String? thumbnail;
  @HiveField(6)
  final String? discountPercentage;
  ProductModel({
    required this.description,
    required this.price,
    required this.rating,
    required this.thumbnail,
    required this.title,
    required this.discountPercentage,
    required this.id,
  });
  factory ProductModel.fromjson(json) {
    return ProductModel(
      description: json['description'] ?? 'no description here',
      price: json['price'].toString(),
      rating: json['rating'].toString(),
      thumbnail: json['thumbnail'] ?? 'no thumbnail here',
      title: json['title'] ?? "no title here",
      discountPercentage: json['discountPercentage'].toString(),
      id: json['id'].toString(),
    );
  }
}
