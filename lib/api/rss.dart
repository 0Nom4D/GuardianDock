// coverage:ignore-file
import 'dart:convert';
import 'dart:io';

import 'package:guardian_dock/api/client_api.dart';

import 'package:guardian_dock/api/models/news_article.dart';

class Rss {
  final ApiClient _client;

  const Rss(ApiClient client) : _client = client;

  Future<List<NewsArticle>> getLatestArticles(String locale, {int pagination = 0}) async {
    final path = Uri.https(ApiClient.baseUrl, "Platform/Content/Rss/NewsArticles/$pagination?includebody=true&lc=$locale");
    final response = await _client.client.get(path, headers: _client.headers);

    if (response.statusCode >= 400) {
      throw HttpException(response.body);
    }
    return List<NewsArticle>.from(jsonDecode(utf8.decode(response.bodyBytes))['Response']['NewsArticles'].map((account) => NewsArticle.fromJson(account)));
  }
}