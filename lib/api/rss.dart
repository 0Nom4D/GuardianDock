// coverage:ignore-file
import 'dart:convert';
import 'dart:io';

import 'package:guardian_dock/api/client_api.dart';

import 'package:guardian_dock/api/models/news_article.dart';

class Rss {
  final ApiClient _client;

  bool isMoreToFetch = true;
  int currentPage = 0;

  Rss(ApiClient client) : _client = client;

  Future<List<NewsArticle>> getLatestArticles(String locale) async {
    final path = Uri.https(ApiClient.baseUrl, "Platform/Content/Rss/NewsArticles/$currentPage", {"includebody": "true", "lc": locale});
    final response = await _client.client.get(path, headers: _client.headers);

    if (response.statusCode == 503) {
      throw const HttpException("Unable to load data from Bungie. Bungie.net servers are down for maintenance.");
    } else if (response.statusCode >= 400) {
      throw HttpException(response.body);
    }
    if (jsonDecode(utf8.decode(response.bodyBytes))['Response']['NewsArticles'] == null) {
      isMoreToFetch = false;
      return [];
    }
    currentPage++;
    return List<NewsArticle>.from(jsonDecode(utf8.decode(response.bodyBytes))['Response']['NewsArticles'].map((account) => NewsArticle.fromJson(account)));
  }
}