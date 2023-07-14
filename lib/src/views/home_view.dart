import 'dart:io';

import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_typeahead/flutter_typeahead.dart';

import 'package:get_it/get_it.dart';

import 'package:guardian_dock/src/widgets/account_suggestion_tile.dart';
import 'package:guardian_dock/src/widgets/empty_suggestion_tile.dart';
import 'package:guardian_dock/api/models/bungie_account.dart';
import 'package:guardian_dock/src/widgets/custom_appbar.dart';
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
      appBar: const GuardianDockAppbar(),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 8.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            TypeAheadField<BungieAccountData>(
              hideOnEmpty: true,
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
                if (lastFetchedAccounts.isEmpty) {
                  return Container();
                }

                // Since the combination "displayName#displayNameCode" is unique, we can use it to find the current account.
                BungieAccountData relatedAccount = lastFetchedAccounts.firstWhere(
                  (e) => e.bungieNetMembershipId == suggestion.bungieNetMembershipId
                );
                if (relatedAccount.memberships!.isEmpty) {
                  return Container();
                }

                return AccountSuggestionTile(relatedAccount: relatedAccount);
              },
              onSuggestionSelected: (suggestion) {},
            )
          ],
        ),
      )
    );
  }
}