import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hacker_news/components/category_card.dart';
import 'package:hacker_news/di/injection.dart';
import 'package:hacker_news/helper/data.dart';
import 'package:hacker_news/models/article_model.dart';
import 'package:hacker_news/models/category_model.dart';
import 'package:hacker_news/views/home/home_cubit.dart';
import 'package:hacker_news/views/home/home_state.dart';

import '../../components/news_card.dart';

class Home extends StatefulWidget {
  const Home({Key? key}) : super(key: key);

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  late List<CategoryModel> categories;

  @override
  void initState() {
    super.initState();
    categories = getCategories();
    getIt<HomeCubit>().getNews();
  }

  @override
  Widget build(BuildContext context) {
    return Builder(builder: (context) {
      return BlocConsumer<HomeCubit, HomeState>(
        listener: (context, state) {},
        bloc: getIt<HomeCubit>(),
        builder: (context, state) => Scaffold(
            appBar: AppBar(
              title: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: const [
                  Text(
                    "Flutter",
                    style: TextStyle(
                      color: Colors.black87,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                  Text(
                    "News",
                    style: TextStyle(
                      color: Colors.blue,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                ],
              ),
              backgroundColor: Colors.transparent,
              elevation: 0.0,
            ),
            body: Builder(
              builder: (context) {
                var scrollController = ScrollController();
                scrollController.addListener(() {
                  if (scrollController.position.pixels >
                          scrollController.position.maxScrollExtent * 0.8 &&
                      state is LoadedNewsHomeState) {
                    print('At the end of the list');
                    context.read<HomeCubit>().getNewsNextPage();
                  }
                });
                if (state is LoadingHomeState &&
                    state.state is IdleHomeState) {
                  return const Center(
                    child: CircularProgressIndicator(),
                  );
                } else if (state is LoadedNewsHomeState ||
                    state is LoadingMoreNewsHomeState) {
                  return SingleChildScrollView(
                    controller: scrollController,
                    child: Column(
                      children: [
                        SizedBox(
                          height: 70,
                          child: ListView.builder(
                            itemBuilder: (context, index) {
                              return CategoryCard(
                                category: categories[index],
                              );
                            },
                            shrinkWrap: true,
                            scrollDirection: Axis.horizontal,
                            itemCount: categories.length,
                            padding: const EdgeInsets.only(left: 14),
                          ),
                        ),
                        Builder(
                          builder: (context) {
                            List<ArticleModel> articles = [];
                            if (state is LoadedNewsHomeState) {
                              articles = state.articles;
                            } else if (state is LoadingMoreNewsHomeState) {
                              articles = state.articles;
                            }
                            return ListView.builder(
                              padding: const EdgeInsets.only(
                                  bottom: 16, left: 8, right: 8),
                              physics: const NeverScrollableScrollPhysics(),
                              itemBuilder: (context, index) {
                                // if(state.articles.length - index <=3) context.read<HomeCubit>().getNews();
                                return NewsCard(article: articles[index]);
                              },
                              scrollDirection: Axis.vertical,
                              itemCount: articles.length,
                              shrinkWrap: true,
                            );
                          },
                        ),
                        state is LoadingMoreNewsHomeState
                            ? const CircularProgressIndicator()
                            : const SizedBox.shrink(),
                      ],
                    ),
                  );
                } else {
                  return const SizedBox(
                    height: 12,
                  );
                }
              },
            )),
      );
    });
  }
}
