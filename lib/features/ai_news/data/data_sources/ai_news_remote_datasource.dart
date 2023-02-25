import 'dart:convert';

import 'package:dio/dio.dart';
import '/core/models/response_model.dart';
import '/core/network/api_constant.dart';
import '/features/ai_news/data/models/news_article_model.dart';

abstract class AINewsRemoteDataSource {
  Future<List<NewsArticleModel>> getAINews();
}

class AINewsRemoteDataSourceImpl extends AINewsRemoteDataSource{

  final Dio dio;

  AINewsRemoteDataSourceImpl({required this.dio});

  @override
  Future<List<NewsArticleModel>> getAINews() async{
    final response = await dio.get("v2/everything", queryParameters: {
        "q" : "ai",
        "sortBy" : "publishedAt",
        "apiKey" : ApiConstance.apiKey,
        "language" : "en",
      });
    if(response.statusCode == 200){
      return List<NewsArticleModel>.from((response.data["articles"] as List).map((e) => NewsArticleModel.fromJson(e))).sublist(0, 10);
    } else {
      var responseBody = ResponseModel.fromJson(json.decode(response.data));

      throw Exception(responseBody.statusMessage);
    }
  }

}