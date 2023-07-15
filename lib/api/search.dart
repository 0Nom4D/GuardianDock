// coverage:ignore-file
import 'dart:convert';
import 'dart:io';

import 'package:guardian_dock/api/models/bungie_account.dart';
import 'package:guardian_dock/api/client_api.dart';

class Search {
  final ApiClient _client;

  const Search(ApiClient client) : _client = client;

  Future<List<BungieAccountData>> searchByBungieID(String displayNamePrefix) async {
    final path = Uri.https(ApiClient.baseUrl, "Platform/User/Search/GlobalName/0/");
    final response = await _client.client.post(path,
      headers: _client.headers,
      body: jsonEncode({ "displayNamePrefix": displayNamePrefix })
    );

    if (response.statusCode >= 400) {
      throw HttpException(response.body);
    }
    return List<BungieAccountData>.from(jsonDecode(utf8.decode(response.bodyBytes))['Response']['searchResults'].map((account) => BungieAccountData.fromJson(account)));
  }
}