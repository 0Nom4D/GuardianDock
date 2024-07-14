// coverage:ignore-file
import 'dart:convert';
import 'dart:io';
import 'dart:math';

import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:flutter_web_auth_2/flutter_web_auth_2.dart';
import 'package:get_it/get_it.dart';

import 'package:guardian_dock/api/models/access_token.dart';
import 'package:guardian_dock/api/models/bungie_user.dart';
import 'package:guardian_dock/api/client_api.dart';

class OAuth {
  final ApiClient _client;

  BungieUser? currentSessionUser;

  OAuth(ApiClient client) : _client = client;

  String _generateOAuth2StateString() {
    const chars = 'AaBbCcDdEeFfGgHhIiJjKkLlMmNnOoPpQqRrSsTtUuVvWwXxYyZz1234567890';
    Random random = Random();

    return String.fromCharCodes(
        Iterable.generate(
            15, (_) => chars.codeUnitAt(random.nextInt(chars.length))
        )
    );
  }

  Future<String?> _getAuthorizationCode() async {
    final oAuthState = _generateOAuth2StateString();
    final oAuthUri = Uri.https(ApiClient.baseUrl, '/fr/OAuth/Authorize', {
      'response_type': 'code',
      'client_id': _client.bungieClientId,
      'redirect_uri': 'guardiandock:/oauth/callback',
      'state': oAuthState
    });

    final oAuthRedirectedUrl = await FlutterWebAuth2.authenticate(
        url: oAuthUri.toString(),
        callbackUrlScheme: 'guardiandock'
    );
    return Uri.parse(oAuthRedirectedUrl).queryParameters['code'];
  }

  Future<void> connectUserWithOAuth2() async {
    final authorizationCode = await _getAuthorizationCode();
    if (authorizationCode == null) {
      return;
    }

    final response = await _client.client.post(
      Uri.https(ApiClient.baseUrl, 'Platform/App/OAuth/Token/'),
      headers: {'Content-Type': 'application/x-www-form-urlencoded'},
      body: {
        'grant_type': 'authorization_code',
        'code': authorizationCode,
        'client_id': _client.bungieClientId
      }
    );

    if (response.statusCode == 503) {
      throw const HttpException("Unable to load data from Bungie. Bungie.net servers are down for maintenance.");
    } else if (response.statusCode >= 400) {
      throw HttpException(response.body);
    }

    final accessTokens = AccessToken.fromJson(jsonDecode(utf8.decode(response.bodyBytes)));
    _client.authorizationTokens = accessTokens;
    if (_client.callbackJwt != null) {
      _client.callbackJwt!(accessTokens);
    }
    getCurrentSessionUser();
  }

  Future<void> getCurrentSessionUser() async {
    final response = await _client.client.get(
      Uri.https(ApiClient.baseUrl, '/Platform/User/GetCurrentBungieNetUser'),
      headers: { ..._client.headers, ...?_client.authorizationTokens?.authorizationHeader }
    );

    if (response.statusCode == 503) {
      throw const HttpException("Unable to load data from Bungie. Bungie.net servers are down for maintenance.");
    } else if (response.statusCode >= 400) {
      throw HttpException(response.body);
    }

    final bungieUser = BungieUser.fromJson(jsonDecode(utf8.decode(response.bodyBytes))["Response"]);
    if (bungieUser.isDeleted) {
      return;
    }
    currentSessionUser = bungieUser;
  }

  Future<void> closeSession() async {
    final storage = GetIt.I<FlutterSecureStorage>();

    await storage.delete(key: 'access');
    _client.authorizationTokens = null;
    currentSessionUser = null;
  }
}