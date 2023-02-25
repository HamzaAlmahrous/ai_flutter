import 'package:flutter/material.dart';

import '../../../../core/util/themes.dart';
import '../../domain/entities/news_article.dart';

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
              padding: const EdgeInsets.symmetric(horizontal: 10.0, vertical: 8.0),
              height: height / 5,
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Text(article.title!,
                      maxLines: 1,
                      textAlign: TextAlign.center,
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
                      style: TextStyle(color: aiPurple, fontWeight: FontWeight.bold)),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
