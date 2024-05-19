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
          retainOnLoading: false,
          decorationBuilder: (context, widget) => Material(
            color: Theme.of(context).colorScheme.surface,
            child: widget,
          ),
          builder: (context, controller, focusNode) => TextField(
            controller: controller,
            focusNode: focusNode,
            cursorColor: Theme.of(context).colorScheme.onSurface,
            style: TextStyle(color: Theme.of(context).colorScheme.onSurface),
            decoration: InputDecoration(
              filled: true,
              hintText: "Bungie ID",
              fillColor: Theme.of(context).colorScheme.surface,
              hintStyle: TextStyle(
                  color: Theme.of(context).colorScheme.onSurface.withOpacity(.3)
              ),
            ),
          ),
          suggestionsCallback: (String search) async {
            lastFetchedAccounts = await getPossibleBungieAccounts(search);
            return lastFetchedAccounts;
          },
          emptyBuilder: (context) => const EmptySuggestionTile(),
          itemBuilder: (context, suggestion) {
            if (suggestion.memberships!.isEmpty) {
              return Container();
            }
            return AccountSuggestionTile(relatedAccount: suggestion);
          },
          itemSeparatorBuilder: (context, index) => Divider(
            height: 1,
            color: Theme.of(context).colorScheme.onSurface.withOpacity(.15)
          ),
          onSelected: (BungieAccountData value) {},
        ),
      ),
    );
  }
}