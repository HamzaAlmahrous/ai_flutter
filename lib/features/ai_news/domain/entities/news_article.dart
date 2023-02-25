import 'package:equatable/equatable.dart';

class NewsArticle extends Equatable{
  final String sourceName;
  final String author;
  final String title;
  final String description;
  final String url;
  final String urlToImage;
  final String content;
  final DateTime publishedAt;

  const NewsArticle(this.sourceName, this.author, this.title, this.description, this.url, this.urlToImage, this.content, this.publishedAt);


  @override
  List<Object> get props => [
    title,
    sourceName,
    publishedAt,
    url,
    urlToImage,
    content,
    author,
    description,
  ];

}