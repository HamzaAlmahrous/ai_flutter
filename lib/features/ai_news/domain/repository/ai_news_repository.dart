import 'package:dartz/dartz.dart';
import '/core/error/failure.dart';
import '/features/ai_news/domain/entities/news_article.dart';

abstract class AINewsRepository {
  Future<Either<Failure, List<NewsArticle>>> getAINews();
}