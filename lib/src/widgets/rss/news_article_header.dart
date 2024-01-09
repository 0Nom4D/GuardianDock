import 'package:flutter/material.dart';

import 'package:guardian_dock/api/models/news_article.dart';

class NewsArticleHeader extends StatelessWidget {
  final NewsArticle article;

  const NewsArticleHeader({required this.article, super.key});

  @override
  Widget build(BuildContext context) {
    return SliverAppBar(
      automaticallyImplyLeading: false,
      elevation: 0,
      expandedHeight: MediaQuery.of(context).size.height * .25,
      floating: false,
      pinned: false,
      snap: false,
      stretch: true,
      flexibleSpace: FlexibleSpaceBar(
        stretchModes: const [StretchMode.zoomBackground],
        background: SizedBox(
          height: MediaQuery.of(context).size.height * .25,
          child: Stack(
            alignment: Alignment.bottomLeft,
            children: [
              Positioned.fill(
                child: Container(
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
                      article.bannerImagePath,
                      fit: BoxFit.cover,
                      height: MediaQuery.of(context).size.height * .25,
                      width: MediaQuery.of(context).size.width
                    ),
                  ),
                )
              ),
              Positioned.fill(
                child: Align(
                  alignment: Alignment.bottomLeft,
                  child: Padding(
                    padding: const EdgeInsets.all(16.0),
                    child: Text(
                      article.title,
                      style: TextStyle(
                        fontSize: 24,
                        fontWeight: FontWeight.bold,
                        color: Theme.of(context).colorScheme.onBackground,
                      )
                    ),
                  ),
                )
              )
            ],
          ),
        ),
      ),
    );
  }
}