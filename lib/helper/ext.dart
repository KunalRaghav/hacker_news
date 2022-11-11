import 'package:hacker_news/models/article_model.dart';
import 'package:hacker_news/network/models/article_response.dart';

extension ModelTranslator on Articles {
  ArticleModel toArticleModel() {
    return ArticleModel(
      author: author,
      description: description,
      title: title,
      url: url,
      urlToImage: urlToImage,
      publishedAt: publishedAt,
      source: source?.name,
    );
  }
}

extension ListTranslator on List<Articles> {
  List<ArticleModel> toArticleModelList() {
    var filteredList = <Articles>[];
    forEach((element) {
      if (element.urlToImage != null &&
          element.description != null &&
          element.title != null) {
        filteredList.add(element);
      }
    });
    return filteredList.map((e) => e.toArticleModel()).toList();
  }
}
