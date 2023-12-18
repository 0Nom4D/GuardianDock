import 'package:flutter/material.dart';

import 'package:get_it/get_it.dart';
import 'package:guardian_dock/src/widgets/rss/rss_feed_element.dart';

import 'package:infinite_scroll_pagination/infinite_scroll_pagination.dart';
import 'package:guardian_dock/src/widgets/persistent_search_bar.dart';
import 'package:guardian_dock/src/widgets/maintenance_error.dart';
import 'package:guardian_dock/src/widgets/custom_appbar.dart';
import 'package:guardian_dock/api/models/news_article.dart';
import 'package:guardian_dock/api/client_api.dart';

class HomeView extends StatefulWidget {
  const HomeView({super.key});

  @override
  State<HomeView> createState() => _HomeViewState();
}

class _HomeViewState extends State<HomeView> implements AutomaticKeepAliveClientMixin<HomeView> {
  final client = GetIt.I<ApiClient>();

  final PagingController<int, NewsArticle> pController = PagingController(firstPageKey: 1);

  final ScrollController controller = ScrollController();
  bool isFetchingMore = false;

  late Future<List<NewsArticle>> moreFetchingFuture;
  late Future<void> futures;

  Future<List<NewsArticle>> getNextArticles() async => (await client.rss.getLatestArticles('fr'));

  Future<void> getNewsArticles() async {
    pController.appendPage(await client.rss.getLatestArticles('fr'), 1);
  }

  Future<void> getManifest() async => await client.getManifest();

  @override
  void initState() {
    pController.addPageRequestListener((pageKey) async {
      pController.appendPage(await getNextArticles(), client.rss.currentPage);
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
      future: Future.wait([getManifest(), getNewsArticles()]),
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
          return Scaffold(
            body: MaintenanceError(
              error: snapshot.error,
              onReload: () {
                setState(() {});
                Future.delayed(const Duration(seconds: 5));
              },
            )
          );
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
            child: NotificationListener<ScrollEndNotification>(
              onNotification: client.rss.isMoreToFetch ? (ScrollEndNotification notif) {
                return true;
              } : null,
              child: CustomScrollView(
                controller: controller,
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
                  PagedSliverList(
                    pagingController: pController,
                    builderDelegate: PagedChildBuilderDelegate<NewsArticle>(
                      itemBuilder: (BuildContext context, NewsArticle item, int index) => NewsArticleItem(
                        rssInformation: item
                      ),
                      animateTransitions: false
                    )
                  )
                ],
              ),
            ),
          )
        );
      },
    );
  }

  @override
  bool get wantKeepAlive => true;

  @override
  void updateKeepAlive() {}
}