import 'dart:convert';

import 'package:dio/dio.dart';
import 'package:tmdb_project/core/models/response_model.dart';
import 'package:tmdb_project/core/network/api_constant.dart';
import 'package:tmdb_project/features/ai_news/data/models/news_article_model.dart';

abstract class AINewsRemoteDataSource {
  Future<List<NewsArticleModel>> getAINews();
}

class AINewsRemoteDataSourceImpl extends AINewsRemoteDataSource{
  @override
  Future<List<NewsArticleModel>> getAINews() async{
    final response = await Dio(BaseOptions(
        baseUrl: ApiConstance.baseUrl,
        receiveDataWhenStatusError: true,
      ),).get("v2/everything", queryParameters: {
        "q" : "ai",
        "sortBy" : "publishedAt",
        "apiKey" : ApiConstance.apiKey,
        "language" : "en",
      });
    if(response.statusCode == 200){
      return List<NewsArticleModel>.from((response.data["articles"] as List).map((e) => NewsArticleModel.fromJson(e)));
    } else {
      var responseBody = ResponseModel.fromJson(json.decode(response.data));

      throw Exception(responseBody.statusMessage);
    }
  }

}