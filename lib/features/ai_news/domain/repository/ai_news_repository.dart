import 'package:dartz/dartz.dart';
import 'package:tmdb_project/core/error/failure.dart';
import 'package:tmdb_project/features/ai_news/domain/entities/news_article.dart';

abstract class AINewsRepository {
  Future<Either<Failure, List<NewsArticle>>> getAINews();
}