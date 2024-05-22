import 'dart:convert';
import 'dart:io';
import 'dart:math';

import 'package:flutter_web_auth_2/flutter_web_auth_2.dart';
import 'package:guardian_dock/api/client_api.dart';
import 'package:guardian_dock/api/models/access_token.dart';

class OAuth {
  final ApiClient _client;

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
    final oAuthUri = Uri.https('www.bungie.net', '/fr/OAuth/Authorize', {
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
      Uri.https('www.bungie.net', 'Platform/App/OAuth/Token/'),
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
  }
}