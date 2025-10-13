class CatalogItemModel {
  final String imagePath;
  final String title;
  final String price;
  final String description;
  final String category;
  final String url;

  CatalogItemModel({
    required this.imagePath,
    required this.title,
    required this.price,
    required this.description,
    required this.category,
    required this.url,
  });

  factory CatalogItemModel.fromMap(Map<String, dynamic> data) {
    return CatalogItemModel(
      imagePath: data['imagePath'] ?? '',
      title: data['nama'] ?? '',
      price: data['harga'] ?? '',
      description: data['deskripsi'] ?? '',
      category: data['kategori'] ?? '',
      url: data['link'] ?? '',
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'imagePath': imagePath,
      'nama': title,
      'harga': price,
      'deskripsi': description,
      'kategori': category,
      'link': url,
    };
  }
}
