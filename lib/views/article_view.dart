import 'dart:async';
import 'dart:io';

import 'package:flutter/material.dart';
import 'package:hacker_news/models/article_model.dart';
import 'package:webview_flutter/webview_flutter.dart';

class ArticleView extends StatefulWidget {
  final ArticleModel article;

  const ArticleView({Key? key, required this.article}) : super(key: key);

  @override
  State<ArticleView> createState() => _ArticleViewState();
}

class _ArticleViewState extends State<ArticleView> {
  final Completer<WebViewController> _completer =
      Completer<WebViewController>();

  @override
  void initState() {
    super.initState();
    if (Platform.isAndroid) WebView.platform = AndroidWebView();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text(
          widget.article.title ?? '',
          style: TextStyle(color: Colors.black),
        ),
        actionsIconTheme: const IconThemeData(
          color: Colors.black,
        ),
        iconTheme: const IconThemeData(color: Colors.black),
        backgroundColor: Colors.white,
      ),
      body: WebView(
        initialUrl: widget.article.url,
        onWebViewCreated: ((WebViewController webViewController) {
          _completer.complete(webViewController);
        }),
        javascriptMode: JavascriptMode.unrestricted,
      ),
    );
  }
}
