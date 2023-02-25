
import '../../domain/entities/news_article.dart';
// "source": {
// "id": null,
// "name": "Finbold.com"
// },
// "author": "Ana Nicenko",
// "title": "Top 5 Artificial Intelligence (AI) cryptocurrencies to watch in March",
// "description": "The booming popularity of the text-based artificial intelligence (AI) platform ChatGPT has reawakened the public’s interest in the underlying technology, … Continued The post Top 5 Artificial Intelligence (AI) cryptocurrencies to watch in March appeared first…",
// "url": "https://finbold.com/top-5-artificial-intelligence-ai-cryptocurrencies-to-watch-in-march/",
// "urlToImage": "https://finbold.com/app/uploads/2023/02/Top-5-Artificial-Intelligence-AI-cryptocurrencies-to-watch-in-March.jpg",
// "publishedAt": "2023-02-24T11:55:07Z",
// "content": "The booming popularity of the text-based artificial intelligence (AI) platform ChatGPT has reawakened the publics interest in the underlying technology, giving rise to AI-focused cryptocurrencies, so… [+4031 chars]"
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
    publishedAt: json["publishedAt"],
  );
}