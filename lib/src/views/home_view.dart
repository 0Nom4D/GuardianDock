import 'dart:io';

import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

import 'package:drop_down_search_field/drop_down_search_field.dart';
import 'package:get_it/get_it.dart';

import 'package:guardian_dock/api/models/bungie_account.dart';
import 'package:guardian_dock/api/client_api.dart';

class HomeView extends StatefulWidget {
  const HomeView({super.key});

  @override
  State<HomeView> createState() => _HomeViewState();
}

class _HomeViewState extends State<HomeView> {
  final TextEditingController _dropdownSearchFieldController = TextEditingController();

  List<BungieAccountData> lastFetchedAccounts = [];

  Future<List<BungieAccountData>> getPossibleBungieAccounts(String bungieName) async {
    if (bungieName.isEmpty) {
      return [];
    }

    List<BungieAccountData> possibleAccounts = [];
    try {
      possibleAccounts = await GetIt
        .I<ApiClient>()
        .search
        .searchByBungieID(bungieName);
    } on HttpException catch (ex) {
      if (kDebugMode) {
        print(ex.message);
      }
      return [];
    }
    return possibleAccounts;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).colorScheme.background,
      appBar: AppBar(
        elevation: 2.0,
        backgroundColor: Colors.transparent,
        title: const Text(
          "GuardianDock",
          style: TextStyle(fontWeight: FontWeight.bold),
          textAlign: TextAlign.start,
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 8.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            DropDownSearchField<String>(
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
                return lastFetchedAccounts.map(
                  (account) => "${account.bungieGlobalDisplayName}#${account.bungieGlobalDisplayNameCode}"
                );
              },
              itemBuilder: (context, suggestion) {
                // Since the combination "displayName#displayNameCode" is unique, we can use it to find the current account.
                BungieAccountData relatedAccount = lastFetchedAccounts.firstWhere((element) => "${element.bungieGlobalDisplayName}#${element.bungieGlobalDisplayNameCode}" == suggestion);
                if (relatedAccount.memberships!.isEmpty || relatedAccount.memberships!.indexWhere((element) => element.overrideType == element.membershipType) == -1) {
                  return Container();
                }

                return ListTile(
                  leading: Image.network(
                    width: 40,
                    height: 40,
                    Uri.https(
                      ApiClient.baseUrl,
                      relatedAccount.memberships![
                        relatedAccount.memberships!.indexWhere((element) => element.overrideType == element.membershipType)
                      ].platformIconPath
                    ).toString()
                  ),
                  title: Text(suggestion),
                  tileColor: Theme.of(context).colorScheme.background,
                  textColor: Theme.of(context).colorScheme.onBackground,
                  onTap: () {
                    _dropdownSearchFieldController.text = suggestion;
                    // TODO
                    // Do the redirection to the user's stats
                  }
                );
              },
              onSuggestionSelected: (suggestion) {
                _dropdownSearchFieldController.text = suggestion;
              },
            )
          ],
        ),
      )
    );
  }
}