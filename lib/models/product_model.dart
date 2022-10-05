class ProductModel {
  final String id;
  final String name;
  final String image;
  final String category;
  final double price;
  final double offerPrice;
  final bool isOffer;
  final bool isPiece;

  ProductModel(
      {required this.id,
      required this.name,
      required this.image,
      required this.category,
      required this.price,
      required this.offerPrice,
      required this.isOffer,
      required this.isPiece});

  factory ProductModel.fromJson(Map<String, dynamic> json) {
    return ProductModel(
      id: json['id'] ?? '',
      name: json['name'] ?? '',
      image: json['image'] ?? '',
      category: json['category'] ?? '',
      price: json['price'] ?? '',
      offerPrice: json['offerPrice'] ?? '',
      isOffer: json['isOffer'] ?? '',
      isPiece: json['isPiece'] ?? '',
    );
  }
}
