class CatalogItemModel {
  final String title;
  final String category;
  final String description;
  final String price;
  final String imagePath;
  final String url;

  CatalogItemModel({
    required this.title,
    required this.category,
    required this.description,
    required this.price,
    required this.imagePath,
    required this.url,
  });

  
  factory CatalogItemModel.fromMap(Map<String, dynamic> map) {
    return CatalogItemModel(
      title: map['nama'] ?? 'Judul Tidak Tersedia',
      category: map['kategori'] ?? 'Lainnya',
      description: map['deskripsi'] ?? 'Deskripsi tidak tersedia.',
      price: map['harga'].toString() ?? 'Harga tidak tersedia',
      imagePath: map['imagePath'] ?? '', 
      url: map['link'] ?? '', 
    );
  }
}
