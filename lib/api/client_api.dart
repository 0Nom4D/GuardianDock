// coverage:ignore-file
import 'dart:convert';
import 'dart:io';

import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:guardian_dock/api/models/access_token.dart';
import 'package:http/http.dart' as http;
import 'package:get_it/get_it.dart';

import 'package:guardian_dock/api/models/manifest/destiny_manifest.dart';
import 'package:guardian_dock/api/search.dart';
import 'package:guardian_dock/api/oauth.dart';
import 'package:guardian_dock/api/rss.dart';

class ApiClient {
  static const String baseUrl = "www.bungie.net";
  String apiKey = const String.fromEnvironment("BNG_API_KEY", defaultValue: r"");
  String bungieClientId = const String.fromEnvironment("BUNGIE_CLIENT_ID", defaultValue: r"");

  final void Function(AccessToken tokens)? callbackJwt;

  final http.Client client;

  late OAuth _oauth;

  late Search _search;

  late Rss _rss;

  OAuth get oauth => _oauth;

  Search get search => _search;

  Rss get rss => _rss;

  Map<String, String> get headers => {'Content-Type': 'application/json', 'X-API-Key': apiKey};

  AccessToken? authorizationTokens;
  DestinyManifest? appManifest;

  ApiClient({this.callbackJwt, String? accessTokens, String? manifest, http.Client? client}) : client = client ?? http.Client() {
    final accessToken = accessTokens != null ? AccessToken.fromJson(jsonDecode(accessTokens)) : null;
    authorizationTokens = accessToken != null && !accessToken.isExpired() ? accessToken : null;
    appManifest = manifest != null ? DestinyManifest.fromJson(
      jsonDecode(manifest)
    ) : null;
    _oauth = OAuth(this);
    _search = Search(this);
    _rss = Rss(this);
  }

  Future<void> getManifest() async {
    final manifestStorage = GetIt.I<FlutterSecureStorage>();
    final path = Uri.https(ApiClient.baseUrl, 'Platform/Destiny2/Manifest');
    final response = await client.get(path, headers: headers);

    if (response.statusCode == 503) {
      throw const HttpException("Unable to load data from Bungie. Bungie.net servers are down for maintenance.");
    } else if (response.statusCode >= 400) {
      throw HttpException(response.body);
    }

    final jsonManifest = jsonDecode(utf8.decode(response.bodyBytes));
    if (appManifest == null || jsonManifest["Response"]["version"] != appManifest?.version) {
      appManifest = DestinyManifest.fromJson(jsonManifest["Response"]);
      manifestStorage.write(key: 'manifest', value: jsonEncode(appManifest?.toJson()));
    }
  }
}