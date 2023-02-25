import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '/features/ai_news/presentation/bloc/ai_news_events.dart';
import '../../../../core/services/service_locator.dart';
import '../bloc/ai_news_bloc.dart';
import '../bloc/ai_news_states.dart';
import '../widgets/news_article_card.dart';

// ignore: must_be_immutable
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
                        physics: const BouncingScrollPhysics(),
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

