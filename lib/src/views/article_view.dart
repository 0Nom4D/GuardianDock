import 'package:flutter/material.dart';

import 'package:flutter_widget_from_html/flutter_widget_from_html.dart';

import 'package:guardian_dock/src/widgets/rss/news_article_header.dart';
import 'package:guardian_dock/src/widgets/custom_appbar.dart';
import 'package:guardian_dock/api/models/news_article.dart';

class ArticleView extends StatelessWidget {
  final NewsArticle article;

  const ArticleView({required this.article, super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      backgroundColor: Theme.of(context).colorScheme.background,
      appBar: const GuardianDockAppbar(),
      body: CustomScrollView(
        slivers: [
          SliverToBoxAdapter(
            child: NewsArticleHeader(article: article),
          ),
          SliverToBoxAdapter(
            child: Padding(
              padding: const EdgeInsets.all(16),
              child: HtmlWidget(
                article.htmlContent,
                enableCaching: true,
                customStylesBuilder: (element) {
                  if (element.outerHtml.startsWith("<a href")) {
                    return { 'color': "#${Theme.of(context).colorScheme.tertiary.value.toRadixString(16).substring(2)}" };
                  }

                  return null;
                },
                textStyle: TextStyle(color: Theme.of(context).colorScheme.onBackground),
              ),
            ),
          ),
        ]
      )
    );
  }
}