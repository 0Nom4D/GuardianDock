import 'package:flutter/material.dart';

import 'package:go_router/go_router.dart';
import 'package:intl/intl.dart';

import 'package:guardian_dock/api/models/news_article.dart';

class NewsArticleItem extends StatelessWidget {
  final NewsArticle rssInformation;

  const NewsArticleItem({required this.rssInformation, super.key});

  @override
  Widget build(BuildContext context) {
    return Card(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(12)
      ),
      clipBehavior: Clip.antiAliasWithSaveLayer,
      child: GestureDetector(
        onTap: () => GoRouter.of(context).push('/article/${rssInformation.uid}', extra: rssInformation),
        child: Stack(
          children: [
            Container(
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(12)
              ),
              child: ShaderMask(
                shaderCallback: (Rect bounds) => LinearGradient(
                  colors: [
                    Colors.transparent,
                    Theme.of(context).colorScheme.primary.withOpacity(.25),
                    Theme.of(context).colorScheme.primary.withOpacity(.5),
                    Theme.of(context).colorScheme.primary.withOpacity(.75)
                  ],
                  stops: const [.0, .05, .25, .65]
                ).createShader(bounds),
                blendMode: BlendMode.srcATop,
                child: Image.network(
                  rssInformation.bannerImagePath,
                  fit: BoxFit.cover,
                  height: MediaQuery.of(context).size.height * .15,
                  width: MediaQuery.of(context).size.width
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
        ),
      )
    );
  }
}