import 'package:dio/dio.dart';
import 'package:hacker_news/models/article_model.dart';
import 'package:hacker_news/network/models/article_response.dart';
import 'package:injectable/injectable.dart';
import 'package:retrofit/retrofit.dart';

part 'NewsClient.g.dart';

@RestApi(baseUrl: "https://newsapi.org/v2")
abstract class NewsClient {
  @factoryMethod
  factory NewsClient(Dio dio, {String baseUrl}) = _NewsClient;

  @GET("/top-headlines")
  Future<ArticleResponse> getNews({
    @Query("country") String country = 'in',
    @Query("page") int page = 1,
  });

  @GET("/top-headlines")
  Future<ArticleResponse> getNewsFromCategory(
    @Query('category') String cat, {
    @Query("country") String country = 'in',
    @Query("page") int page = 1,
  });
}
