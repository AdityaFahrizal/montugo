class NewsItemModel {
  final String imagePath;
  final String title;
  final String description;
  final String url;

  NewsItemModel({
    required this.imagePath,
    required this.title,
    required this.description,
    required this.url,
  });

  factory NewsItemModel.fromMap(Map<String, dynamic> data) {
    return NewsItemModel(
      imagePath: data['imagePath'] ?? '',
      title: data['judul'] ?? '',
      description: data['deskripsi'] ?? '',
      url: data['link'] ?? '',
    );
  }
}
