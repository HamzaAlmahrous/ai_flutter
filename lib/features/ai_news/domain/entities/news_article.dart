import 'package:equatable/equatable.dart';

class NewsArticle extends Equatable{
  final String? sourceName;
  final String? author;
  final String? title;
  final String? description;
  final String? url;
  final String? urlToImage;
  final String? content;
  final DateTime? publishedAt;

  const NewsArticle({required this.sourceName, required this.author, required this.title, required this.description, required this.url, required this.urlToImage, required this.content, required this.publishedAt});


  @override
  List<Object> get props => [
    title!,
    sourceName!,
    publishedAt!,
    url!,
    urlToImage!,
    content!,
    author!,
    description!,
  ];

}