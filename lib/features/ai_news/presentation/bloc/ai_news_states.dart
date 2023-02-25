import 'package:equatable/equatable.dart';
import '/features/ai_news/domain/entities/news_article.dart';

class AINewsState extends Equatable{
  @override
  List<Object?> get props => [];
}

class AINewsInitialState extends AINewsState {}

class GetAINewsLoadingState extends AINewsState {}

class GetAINewsSuccessState extends AINewsState {
  final List<NewsArticle> articles;
  GetAINewsSuccessState({required this.articles});
  
  @override
  List<Object> get props => [articles];
}

class GetAINewsErrorState extends AINewsState {

  final String message;
  GetAINewsErrorState({required this.message});
  
  @override
  List<Object> get props => [message];
}




