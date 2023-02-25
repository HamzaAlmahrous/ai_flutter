import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:tmdb_project/core/usecase/usecase.dart';
import 'package:tmdb_project/features/ai_news/domain/usecases/get_ai_news.dart';
import 'package:tmdb_project/features/ai_news/presentation/bloc/ai_news_events.dart';
import 'package:tmdb_project/features/ai_news/presentation/bloc/ai_news_states.dart';

class AINewsBloc extends Bloc<AINewsEvent, AINewsState> {
  final GetAINews getAINews;

  AINewsBloc({required this.getAINews}) : super(AINewsInitialState()) {
    on<AINewsEvent>((event, emit) async {
      if (event is GetAINewsEvent) {
        emit(GetAINewsLoadingState());
        var failureOrGetAINews =
            await getAINews(parameters: const NoParameters());
        await failureOrGetAINews.fold((failure) async {
          emit(GetAINewsErrorState(message: failure.message));
        }, (articles) async {
          emit(GetAINewsSuccessState(articles: articles));
        });
      }
    });
  }
}
