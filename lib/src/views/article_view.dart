import 'package:flutter/material.dart';

import 'package:guardian_dock/api/models/news_article.dart';

class ArticleView extends StatelessWidget {
  final NewsArticle article;

  const ArticleView({required this.article, super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold();
  }
}