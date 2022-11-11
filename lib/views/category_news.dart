import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:hacker_news/di/injection.dart';
import 'package:hacker_news/helper/ext.dart';

import '../components/news_card.dart';
import '../models/article_model.dart';
import '../models/category_model.dart';
import '../repository/news_repository.dart';

class CategoryNews extends StatefulWidget {
  final CategoryModel categoryModel;

  const CategoryNews({Key? key, required this.categoryModel}) : super(key: key);

  @override
  State<CategoryNews> createState() => _CategoryNewsState();
}

class _CategoryNewsState extends State<CategoryNews> {
  late List<ArticleModel> articles;
  late NewsRepository newsRepository;
  bool _loading = true;

  _CategoryNewsState() {
    newsRepository = getIt<NewsRepository>();
  }

  @override
  void initState() {
    super.initState();
    newsRepository
        .getNewsFromCategory(widget.categoryModel.categoryName)
        .then((value) {
      setState(() {
        _loading = false;
        articles = value.toArticleModelList();
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: NestedScrollView(
        headerSliverBuilder: (context, innerBoxIsScrolled) {
          return [
            SliverAppBar(
              expandedHeight: 200,
              pinned: true,
              elevation: 0,
              snap: true,
              floating: true,
              flexibleSpace: Stack(
                children: [
                  Positioned.fill(
                    child: CachedNetworkImage(
                      imageUrl: widget.categoryModel.imageUrl,
                      fit: BoxFit.cover,
                    ),
                  ),
                  Positioned.fill(
                    child: Container(
                      decoration: BoxDecoration(
                          gradient: LinearGradient(
                        colors: [
                          Colors.transparent,
                          Colors.black.withOpacity(0.7)
                        ],
                        begin: Alignment.topCenter,
                        end: Alignment.bottomCenter,
                      )),
                    ),
                  ),
                  Positioned.fill(
                      child: Align(
                    alignment: Alignment.bottomCenter,
                    child: Padding(
                      padding: const EdgeInsets.all(16.0),
                      child: Text(
                        widget.categoryModel.categoryName.toUpperCase(),
                        style: const TextStyle(
                            fontSize: 24,
                            color: Colors.white,
                            fontWeight: FontWeight.bold),
                        textAlign: TextAlign.center,
                      ),
                    ),
                  ))
                ],
              ),
            ),
          ];
        },
        body: _loading
            ? Container(
                alignment: Alignment.center,
                child: const CircularProgressIndicator(),
              )
            : ListView.separated(
                itemBuilder: (context, index) {
                  return NewsCard(article: articles[index]);
                },
                separatorBuilder: (context, index) {
                  return const SizedBox(
                    height: 12,
                  );
                },
                itemCount: articles.length),
      ),
    );
  }
}
