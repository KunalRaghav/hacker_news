import 'dart:convert';

import 'package:dio/dio.dart';
import 'package:hacker_news/models/article_model.dart';

class DioClient {
  final Dio _dio = Dio();

  final _baseUrl = "https://newsapi.org/v2";
  final _apiKey = "e980bea76b474c068059ea0b22db5adb";

  DioClient() {
    _dio.options.headers["X-Api-Key"] = _apiKey;
  }

  Future<List<ArticleModel>> getNews() async {
    var newsItems = <ArticleModel>[];
    Response<String> response =
        await _dio.get('$_baseUrl/top-headlines?country=in',
            options: Options(
              responseType: ResponseType.plain,
            ));

    var data = jsonDecode(response.data ?? '');
    print(data);
    if (data['status'] == 'ok') {
      data['articles'].forEach((article) {
        if (article["urlToImage"] != null &&
            article['description'] != null &&
            article['title'] != null) {
          var newsItem = ArticleModel(
              author: article['author'] ?? '',
              description: article['description'] ?? '',
              title: article['title'] ?? '',
              url: article['url'] ?? '',
              urlToImage: article['urlToImage'] ?? '',
              publishedAt: article['publishedAt'] ?? '',
              source: article['source']['name'] ?? '');
          newsItems.add(newsItem);
        }
      });
    }
    print('Articles Found : ${newsItems.length}');
    return newsItems;
  }

  Future<List<ArticleModel>> getNewsFromCategory(String category) async {
    var newsItems = <ArticleModel>[];
    Response<String> response = await _dio.get(
        '$_baseUrl/top-headlines?country=in&category=$category',
        options: Options(
          responseType: ResponseType.plain,
        ));

    var data = jsonDecode(response.data ?? '');
    print(data);
    if (data['status'] == 'ok') {
      data['articles'].forEach((article) {
        if (article["urlToImage"] != null &&
            article['description'] != null &&
            article['title'] != null) {
          var newsItem = ArticleModel(
              author: article['author'] ?? '',
              description: article['description'] ?? '',
              title: article['title'] ?? '',
              url: article['url'] ?? '',
              urlToImage: article['urlToImage'] ?? '',
              publishedAt: article['publishedAt'] ?? '',
              source: article['source']['name'] ?? '');
          newsItems.add(newsItem);
        }
      });
    }
    print('Articles Found : ${newsItems.length}');
    return newsItems;
  }
}
