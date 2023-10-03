import 'dart:developer';
import 'dart:io';

import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

import 'package:flutter_typeahead/flutter_typeahead.dart';
import 'package:get_it/get_it.dart';

import 'package:guardian_dock/src/widgets/account_suggestion_tile.dart';
import 'package:guardian_dock/src/widgets/empty_suggestion_tile.dart';
import 'package:guardian_dock/src/widgets/rss/rss_news_feed.dart';
import 'package:guardian_dock/api/models/bungie_account.dart';
import 'package:guardian_dock/src/widgets/custom_appbar.dart';
import 'package:guardian_dock/api/models/news_article.dart';
import 'package:guardian_dock/api/client_api.dart';

class HomeView extends StatefulWidget {
  const HomeView({super.key});

  @override
  State<HomeView> createState() => _HomeViewState();
}

class _HomeViewState extends State<HomeView> {
  final TextEditingController _dropdownSearchFieldController = TextEditingController();

  List<BungieAccountData> lastFetchedAccounts = [];
  List<NewsArticle> fetchedArticles = [];

  bool isLoadingNewsArticle = false;

  Future<void> getManifest() async => await GetIt.I<ApiClient>().getManifest();

  Future<List<BungieAccountData>> getPossibleBungieAccounts(String bungieName) async {
    if (bungieName.isEmpty) {
      return [];
    } else if (bungieName.contains('#')) {
      bungieName = bungieName.split('#')[0];
    }

    try {
      return await GetIt
        .I<ApiClient>()
        .search
        .searchByBungieID(bungieName);
    } on HttpException catch (ex) {
      if (kDebugMode) {
        log(ex.message);
      }
      return [];
    }
  }

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
          body: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 8.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                TypeAheadField<BungieAccountData>(
                  hideOnEmpty: true,
                  hideOnLoading: true,
                  keepSuggestionsOnLoading: false,
                  suggestionsBoxDecoration: SuggestionsBoxDecoration(
                      color: Theme.of(context).colorScheme.background
                  ),
                  textFieldConfiguration: TextFieldConfiguration(
                    style: TextStyle(color: Theme.of(context).colorScheme.onBackground),
                    decoration: InputDecoration(
                      filled: true,
                      hintText: "Bungie ID",
                      hintStyle: TextStyle(
                          color: Theme.of(context).colorScheme.onBackground.withOpacity(.3)
                      ),
                    ),
                    controller: _dropdownSearchFieldController,
                  ),
                  suggestionsCallback: (String search) async {
                    lastFetchedAccounts = await getPossibleBungieAccounts(search);
                    return lastFetchedAccounts;
                  },
                  noItemsFoundBuilder: (context) => const EmptySuggestionTile(),
                  itemBuilder: (context, suggestion) {
                    if (suggestion.memberships!.isEmpty) {
                      return Container();
                    }

                    return AccountSuggestionTile(relatedAccount: suggestion);
                  },
                  itemSeparatorBuilder: (context, index) => Divider(
                      height: 1,
                      color: Theme.of(context).colorScheme.onBackground.withOpacity(.15)
                  ),
                  onSuggestionSelected: (suggestion) {},
                ),
                Center(
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
                Center(
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
                !isLoadingNewsArticle ? SizedBox(
                  height: MediaQuery.of(context).size.height * .4,
                  child: NewsArticlesFeedList(rssFeed: fetchedArticles)
                ) : const Center(
                  child: CircularProgressIndicator()
                )
              ],
            ),
          )
        );
      },
    );
  }
}