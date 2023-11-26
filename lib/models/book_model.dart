class BookModel {
  final int id;
  final String title;
  final String author;
  final String cover_url;
  final String download_url;

  BookModel({
    required this.id,
    required this.title,
    required this.author,
    required this.cover_url,
    required this.download_url,
  });

  factory BookModel.fromJson(Map<String, dynamic> json) {
    return BookModel(
      id: json["id"] ?? 0,
      title: json["title"] ?? "",
      author: json["author"] ?? "",
      cover_url: json["cover_url"] ?? "",
      download_url: json["download_ur"] ?? "",
    );
  }
}
