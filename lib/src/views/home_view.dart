import 'package:flutter/material.dart';

import 'package:get_it/get_it.dart';

import 'package:guardian_dock/src/widgets/persistent_search_bar.dart';
import 'package:guardian_dock/src/widgets/rss/rss_news_feed.dart';
import 'package:guardian_dock/src/widgets/custom_appbar.dart';
import 'package:guardian_dock/api/models/news_article.dart';
import 'package:guardian_dock/api/client_api.dart';

class HomeView extends StatefulWidget {
  const HomeView({super.key});

  @override
  State<HomeView> createState() => _HomeViewState();
}

class _HomeViewState extends State<HomeView> {
  List<NewsArticle> fetchedArticles = [];

  bool isLoadingNewsArticle = false;

  Future<void> getManifest() async => await GetIt.I<ApiClient>().getManifest();

  void getNewsArticles() async {
    setState(() {
      isLoadingNewsArticle = true;
    });

    fetchedArticles = await GetIt.I<ApiClient>().rss.getLatestArticles('fr');

    setState(() {
      isLoadingNewsArticle = false;
    });
  }

  @override
  void initState() {
    super.initState();
    getNewsArticles();
  }

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
      future: getManifest(),
      builder: (BuildContext context, AsyncSnapshot<void> snapshot) {
        if (snapshot.connectionState == ConnectionState.waiting) {
          return Center(
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: CircularProgressIndicator(
                color: Theme.of(context).colorScheme.tertiary
              ),
            )
          );
        }
        return Scaffold(
          resizeToAvoidBottomInset: false,
          backgroundColor: Theme.of(context).colorScheme.background,
          appBar: const GuardianDockAppbar(),
          body: CustomScrollView(
            shrinkWrap: true,
            slivers: [
              SliverAppBar(
                backgroundColor: Theme.of(context).colorScheme.background,
                toolbarHeight: MediaQuery.of(context).size.height * .05,
                collapsedHeight: MediaQuery.of(context).size.height * .05,
                expandedHeight: MediaQuery.of(context).size.height * .1,
                pinned: true,
                elevation: 20,
                centerTitle: true,
                flexibleSpace: const PersistentSearchBar()
              ),
              SliverToBoxAdapter(
                child: Center(
                  child: RichText(
                    text: TextSpan(
                      text: "Track",
                      style: TextStyle(
                        color: Theme.of(context).colorScheme.onBackground,
                        fontSize: 35,
                        fontWeight: FontWeight.bold
                      ),
                      children: [
                        TextSpan(
                          text: " your light",
                          style: TextStyle(
                            color: Theme.of(context).colorScheme.tertiary,
                            fontSize: 35,
                            fontWeight: FontWeight.bold
                          ),
                        )
                      ]
                    ),
                  )
                ),
              ),
              SliverToBoxAdapter(
                child: SizedBox(height: MediaQuery.of(context).size.height *.025)
              ),
              SliverToBoxAdapter(
                child: Center(
                  child: Text(
                    "View all your statistics on the same platform.",
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      color: Theme.of(context).colorScheme.onBackground,
                      fontSize: 20,
                      fontWeight: FontWeight.w500
                    ),
                  )
                ),
              ),
              SliverToBoxAdapter(
                child: SizedBox(height: MediaQuery.of(context).size.height *.05)
              ),
              !isLoadingNewsArticle
                ? NewsArticlesFeedList(rssFeed: fetchedArticles)
                : const SliverToBoxAdapter(
                  child: Center(
                    child: CircularProgressIndicator()
                  ),
                ),
            ],
          )
        );
      },
    );
  }
}