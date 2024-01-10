// coverage:ignore-file
import 'dart:convert';
import 'dart:io';

import 'package:guardian_dock/api/client_api.dart';

import 'package:guardian_dock/api/models/bungie_account.dart';
import 'package:guardian_dock/api/models/clan.dart';

class Clan {
  final ApiClient _client;

  Clan(ApiClient client) : _client = client;

  Future<ClanData?> getClanForUser(BungieAccountData account) async {
    final path = Uri.https(
      ApiClient.baseUrl,
      "Platform/GroupV2/User/${account.memberships!.first.membershipType}/${account.memberships!.first.membershipId}/0/1"
    );
    final response = await _client.client.get(path,
        headers: _client.headers,
    );

    if (response.statusCode == 503) {
      _client.isInMaintenance = true;
      throw const HttpException("Unable to load data from Bungie. Bungie.net servers are down for maintenance.");
    } else if (response.statusCode >= 400) {
      _client.isInMaintenance = false;
      throw HttpException(response.body);
    }
    _client.isInMaintenance = false;
    final List<Map<String, dynamic>> json = List<Map<String, dynamic>>.from(jsonDecode(utf8.decode(response.bodyBytes))['Response']['results']);
    if (json.isEmpty) {
      return null;
    }
    return ClanData.fromJson(json.first['group']);
  }
}