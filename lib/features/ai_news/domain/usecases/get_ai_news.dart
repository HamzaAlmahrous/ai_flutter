import '/core/error/failure.dart';
import 'package:dartz/dartz.dart';
import '/core/usecase/usecase.dart';
import '/features/ai_news/domain/entities/news_article.dart';
import '../repository/ai_news_repository.dart';

class GetAINews extends UseCase<List<NewsArticle>, NoParameters>{
  final AINewsRepository aiNewsRepository;
  GetAINews({required this.aiNewsRepository});

  @override
  Future<Either<Failure, List<NewsArticle>>> call({required NoParameters parameters}) async{
    return await aiNewsRepository.getAINews();
  }
}