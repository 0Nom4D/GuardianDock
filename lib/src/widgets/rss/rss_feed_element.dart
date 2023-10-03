import 'package:intl/intl.dart';
import 'package:flutter/material.dart';

import 'package:guardian_dock/api/models/news_article.dart';

class NewsArticleFullWidthItem extends StatelessWidget {
  final NewsArticle rssInformation;

  const NewsArticleFullWidthItem({required this.rssInformation, super.key});

  @override
  Widget build(BuildContext context) {
    return Card(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(12)
      ),
      clipBehavior: Clip.antiAliasWithSaveLayer,
      child: Stack(
        children: [
          Container(
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(12)
            ),
            child: ShaderMask(
              shaderCallback: (Rect bounds) => LinearGradient(
                colors: [Colors.transparent, Theme.of(context).colorScheme.primary.withOpacity(.75)],
                stops: const [.0, .1]
              ).createShader(bounds),
              blendMode: BlendMode.srcATop,
              child: IntrinsicHeight(
                child: Image.network(
                  rssInformation.bannerImagePath,
                  fit: BoxFit.cover,
                ),
              ),
            ),
          ),
          Positioned.fill(
            child: ListTile(
              tileColor: Theme.of(context).colorScheme.primary,
              textColor: Theme.of(context).colorScheme.onBackground,
              trailing: Text(
                DateFormat('yyyy-MM-dd').format(rssInformation.pubDate),
                style: const TextStyle(
                  fontFamily: "NeueHaasDisplay",
                  fontStyle: FontStyle.italic
                ),
              ),
              title: Text(
                rssInformation.title,
                maxLines: 2,
                style: const TextStyle(
                  fontFamily: "NeueHaasDisplay",
                  fontWeight: FontWeight.bold,
                  overflow: TextOverflow.ellipsis
                ),
              ),
              subtitle: Text(
                rssInformation.description,
                maxLines: 3,
                style: const TextStyle(
                  fontFamily: "NeueHaasDisplay",
                  overflow: TextOverflow.ellipsis
                ),
              )
            ),
          )
        ]
      )
    );
  }
}