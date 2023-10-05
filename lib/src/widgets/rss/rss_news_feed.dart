import 'package:flutter/material.dart';

import 'package:guardian_dock/src/widgets/rss/rss_feed_element.dart';
import 'package:guardian_dock/api/models/news_article.dart';

class NewsArticlesFeedList extends StatelessWidget {
  final List<NewsArticle> rssFeed;

  const NewsArticlesFeedList({required this.rssFeed, super.key});

  @override
  Widget build(BuildContext context) {
    return SliverList.builder(
      itemBuilder: (BuildContext context, int count) => Padding(
        padding: const EdgeInsets.symmetric(horizontal: 8.0),
        child: NewsArticleItem(rssInformation: rssFeed[count]),
      ),
      itemCount: rssFeed.length,
    );
  }
}