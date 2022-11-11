import 'dart:io';

import 'package:bloc/bloc.dart';
import 'package:hacker_news/helper/ext.dart';
import 'package:hacker_news/models/article_model.dart';
import 'package:hacker_news/repository/news_repository.dart';
import 'package:hacker_news/views/home/home_state.dart';
import 'package:injectable/injectable.dart';

@lazySingleton
class HomeCubit extends Cubit<HomeState> {
  HomeCubit(
    this._newsRepository,
  ) : super(const IdleHomeState());

  final NewsRepository _newsRepository;

  void getNews() async {
    emit(LoadingHomeState(state));
    final articles = await _newsRepository.getNews();
    emit(LoadedNewsHomeState(articles.toArticleModelList(), 1));
  }

  void getNewsNextPage() async {
    var prevState = state;
    var pageNumber = (state as LoadedNewsHomeState).pageNumber + 1;
    emit(LoadingMoreNewsHomeState((state as LoadedNewsHomeState).articles));
    final articles = await _newsRepository.getNews(page: pageNumber);
    await Future.delayed(const Duration(seconds: 2));
    List<ArticleModel> newArticles = [...(prevState as LoadedNewsHomeState).articles,...articles.toArticleModelList()];
    emit(LoadedNewsHomeState(newArticles, pageNumber));
  }
}
