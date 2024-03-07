class ArticleModel {
  final String? image;
  final String title;
  final String? description;
  final String? content;
  final String? publishedAt;
  final Source source;
  final String? author;
  final String? url;



  ArticleModel({
    required this.image,
    required this.title,
    required this.description,
    required this.content,
    required this.publishedAt,
    required this.source,
    required this.author,
    required this.url,
  });

  factory ArticleModel.fromJson(json) {
    return ArticleModel(
      source: Source.fromJson(json['source']),
      image: json['urlToImage'],
      title: json['title'],
      description: json['description'],
      content: json['content'],
      publishedAt: json['publishedAt'],
      url: json['url'],
      author: json['author'],
    );
  }
}
class Source {
  final String id;
  final String name;
  const Source({required this.id, required this.name});

  factory Source.fromJson(Map<String, dynamic> json) {
    return Source(id: json['id'] ?? '', name: json['name']);
  }
}
