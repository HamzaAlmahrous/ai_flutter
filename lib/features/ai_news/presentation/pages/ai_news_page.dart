import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:tmdb_project/core/util/themes.dart';
import 'package:tmdb_project/features/ai_news/domain/entities/news_article.dart';
import 'package:tmdb_project/features/ai_news/presentation/bloc/ai_news_events.dart';
import '../../../../core/services/service_locator.dart';
import '../bloc/ai_news_bloc.dart';
import '../bloc/ai_news_states.dart';

class AINewsPage extends StatelessWidget {
  AINewsPage({super.key});

  late double height, width;

  static const String routeName = 'AINewsPage';

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(builder: (context, BoxConstraints constraints) {
      height = constraints.maxHeight;
      width = constraints.maxWidth;
      return BlocProvider(
        create: (BuildContext context) =>
            sl<AINewsBloc>()..add(GetAINewsEvent()),
        child: BlocBuilder<AINewsBloc, AINewsState>(builder: (context, state) {
          return SingleChildScrollView(
            physics: const BouncingScrollPhysics(),
            child: Column(
              children: [
                BlocBuilder<AINewsBloc, AINewsState>(
                  builder: (context, state) {
                    if (state is GetAINewsSuccessState) {
                      return ListView.builder(
                        shrinkWrap: true,
                        itemCount: state.articles.length,
                        itemBuilder: ((context, index) => AINewsWidget(
                            article: state.articles[index],
                            height: height,
                            width: width)),
                      );
                    } else if (state is GetAINewsErrorState) {
                      SizedBox(
                        height: MediaQuery.of(context).size.height,
                        child: Center(
                          child: Text(state.message),
                        ),
                      );
                    }
                    return SizedBox(
                      height: height,
                      child: const Center(
                        child: CircularProgressIndicator(),
                      ),
                    );
                  },
                ),
              ],
            ),
          );
        }),
      );
    });
  }
}

class AINewsWidget extends StatelessWidget {
  NewsArticle article;
  double width, height;
  AINewsWidget({
    required this.article,
    required this.height,
    required this.width,
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(12),
        color: aiDarkPurple,
      ),
      padding: const EdgeInsets.all(10.0),
      margin: const EdgeInsets.all(10.0),
      width: width,
      height: height / 5,
      child: Row(
        children: [
          Container(
            width: width * 0.25,
            decoration: article.urlToImage != null
                ? BoxDecoration(
                    borderRadius: BorderRadius.circular(8),
                    color: aiDarkGrey,
                    image: DecorationImage(
                        image: NetworkImage(article.urlToImage!),
                        fit: BoxFit.cover),
                  )
                : BoxDecoration(
                    borderRadius: BorderRadius.circular(8),
                    color: aiDarkGrey,
                  ),
          ),
          Expanded(
            child: Container(
              padding: const EdgeInsets.all(5.0),
              height: height / 5,
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Text(article.title!,
                      maxLines: 1,
                      overflow: TextOverflow.ellipsis,
                      style: TextStyle(
                          color: aiWhite,
                          fontSize: 20,
                          fontWeight: FontWeight.bold)),
                  const SizedBox(height: 10),
                  Expanded(
                    child: Text(article.description!,
                        textAlign: TextAlign.start,
                        maxLines: 4,
                        overflow: TextOverflow.ellipsis,
                        style: TextStyle(color: aiWhite)),
                  ),
                  Text(
                      "${article.publishedAt!.day} / ${article.publishedAt!.month} / ${article.publishedAt!.year}",
                      textAlign: TextAlign.end,
                      maxLines: 1,
                      overflow: TextOverflow.ellipsis,
                      style: TextStyle(
                          color: aiPurple, fontWeight: FontWeight.bold)),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
