

import 'package:hacker_news/network/models/article_response.dart';

abstract class NewsRepository{
  Future<List<Articles>> getNews({int page=1});
  Future<List<Articles>> getNewsFromCategory(String category);
}