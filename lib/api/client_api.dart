import 'package:http/http.dart' as http;

import 'package:guardian_dock/api/search.dart';

class ApiClient {
  static const String baseUrl = "www.bungie.net";
  String apiKey = const String.fromEnvironment("BNG_API_KEY", defaultValue: r"");
  final http.Client client;

  late Search _search;

  Search get search => _search;

  Map<String, String> get headers => {'Content-Type': 'application/json', 'X-API-Key': apiKey};

  ApiClient({http.Client? client}) : client = client ?? http.Client() {
    _search = Search(this);
  }
}