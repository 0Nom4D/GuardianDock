import 'dart:io';

import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

import 'package:drop_down_search_field/drop_down_search_field.dart';
import 'package:get_it/get_it.dart';

import 'package:guardian_dock/api/models/bungie_account.dart';
import 'package:guardian_dock/api/client_api.dart';

class HomeView extends StatelessWidget {
  HomeView({super.key});

  final TextEditingController _dropdownSearchFieldController = TextEditingController();

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
        title: const Text("GuardianDock"),
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 8.0),
            child: DropDownSearchField<String>(
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
                List<BungieAccountData> accounts = await getPossibleBungieAccounts(search);
                return accounts.map(
                  (account) => "${account.bungieGlobalDisplayName}#${account.bungieGlobalDisplayNameCode}"
                );
              },
              itemBuilder: (context, suggestion) => ListTile(
                title: Text(suggestion)
              ),
              onSuggestionSelected: (suggestion) {
                _dropdownSearchFieldController.text = suggestion;
              },
            ),
          )
        ],
      )
    );
  }
}