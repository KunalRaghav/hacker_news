


import 'package:hacker_news/network/models/article_response.dart';
import 'package:injectable/injectable.dart';

import '../network/NewsClient.dart';
import 'news_repository.dart';


@Injectable(as: NewsRepository)
class NewsRepositoryImpl implements NewsRepository{

  late final NewsClient _newsClient;

  NewsRepositoryImpl(this._newsClient){
    print("News Repository created");
  }

  @override
  Future<List<Articles>> getNews({int page = 1}){
    return _newsClient.getNews(page: page).then((value) {
      if(value.status == 'ok'){
        return value.articles ?? <Articles>[];
      }else{
        throw Exception();
      }
    });
  }

  @override
  Future<List<Articles>> getNewsFromCategory(String category, {int page = 1}) {
    return _newsClient.getNewsFromCategory(category, page: page).then((value){
      if(value.status == 'ok'){
        return value.articles ?? <Articles>[];
      }else{
        throw Exception();
      }
    });
  }

}