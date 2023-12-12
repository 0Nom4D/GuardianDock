import 'package:flutter/material.dart';

import 'package:get_it/get_it.dart';
import 'package:guardian_dock/src/widgets/maintenance_error.dart';

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
  late Future<void> future;

  Future<void> getManifest() async => await GetIt.I<ApiClient>().getManifest();

  Future<void> getNewsArticles() async {
    fetchedArticles = await GetIt.I<ApiClient>().rss.getLatestArticles('fr');
  }

  @override
  void initState() {
    future = Future.wait([getNewsArticles(), getManifest()]);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
      future: future,
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
        } else if (snapshot.hasError) {
          return Scaffold(body: MaintenanceError(error: snapshot.error));
        }
        return Scaffold(
          resizeToAvoidBottomInset: false,
          backgroundColor: Theme.of(context).colorScheme.background,
          appBar: const GuardianDockAppbar(),
          body: GestureDetector(
            onTap: () {
              FocusScopeNode currentFocus = FocusScope.of(context);

              if (!currentFocus.hasPrimaryFocus) {
                currentFocus.unfocus();
              }
            },
            child: CustomScrollView(
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
                NewsArticlesFeedList(rssFeed: fetchedArticles)
              ],
            ),
          )
        );
      },
    );
  }
}