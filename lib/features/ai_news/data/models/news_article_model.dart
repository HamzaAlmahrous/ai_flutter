import '../../domain/entities/news_article.dart';
class NewsArticleModel extends NewsArticle{
  const NewsArticleModel({required super.sourceName, required super.author, required super.title, required super.description, required super.url, required super.urlToImage, required super.content, required super.publishedAt});

  factory NewsArticleModel.fromJson(Map<String, dynamic> json) => NewsArticleModel(
    sourceName: json["source"]["name"],
    title: json["title"],
    author: json["author"],
    description: json["description"],
    url: json["url"],
    urlToImage: json["urlToImage"],
    content: json["content"],
    publishedAt: DateTime.parse(json["publishedAt"].toString()),
  );
}