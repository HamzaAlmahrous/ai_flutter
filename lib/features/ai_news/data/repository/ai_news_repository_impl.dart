import '/core/error/failure.dart';
import 'package:dartz/dartz.dart';
import '/features/ai_news/domain/entities/news_article.dart';

import '../../domain/repository/ai_news_repository.dart';
import '../data_sources/ai_news_remote_datasource.dart';

class AINewsRepositoryImpl extends AINewsRepository{
  final AINewsRemoteDataSource aiNewsRemoteDataSource;

  AINewsRepositoryImpl({required this.aiNewsRemoteDataSource});

  @override
  Future<Either<Failure, List<NewsArticle>>> getAINews() async{
    final result = await aiNewsRemoteDataSource.getAINews();
    try {
      return Right(result);
    } on Exception catch(e) {
      return Left(Failure(message: e.toString()));
    }
  }
}