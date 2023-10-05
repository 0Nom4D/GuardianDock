import 'dart:developer';
import 'dart:io';

import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

import 'package:flutter_typeahead/flutter_typeahead.dart';
import 'package:get_it/get_it.dart';

import 'package:guardian_dock/src/widgets/account_suggestion_tile.dart';
import 'package:guardian_dock/src/widgets/empty_suggestion_tile.dart';
import 'package:guardian_dock/api/models/bungie_account.dart';
import 'package:guardian_dock/api/client_api.dart';

class PersistentSearchBar extends StatefulWidget {
  const PersistentSearchBar({super.key});

  @override
  State<PersistentSearchBar> createState() => _PersistentSearchBarState();
}

class _PersistentSearchBarState extends State<PersistentSearchBar> {
  final TextEditingController _dropdownSearchFieldController = TextEditingController();

  List<BungieAccountData> lastFetchedAccounts = [];

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

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 8.0),
      child: Align(
        alignment: Alignment.center,
        child: TypeAheadField<BungieAccountData>(
          hideOnEmpty: true,
          hideOnLoading: true,
          minCharsForSuggestions: 2,
          keepSuggestionsOnLoading: false,
          suggestionsBoxDecoration: SuggestionsBoxDecoration(
            color: Theme.of(context).colorScheme.background
          ),
          textFieldConfiguration: TextFieldConfiguration(
            style: TextStyle(color: Theme.of(context).colorScheme.onBackground),
            decoration: InputDecoration(
              filled: true,
              hintText: "Bungie ID",
              fillColor: Theme.of(context).colorScheme.background,
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
      ),
    );
  }
}