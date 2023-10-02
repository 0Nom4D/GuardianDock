class NewsArticle {
  String uid;
  String title;
  String link;
  DateTime pubDate;
  String description;
  String htmlContent;
  String bannerImagePath;
  String? optionalMobileAsset;

  NewsArticle({
    required this.uid,
    required this.title,
    required this.link,
    required this.pubDate,
    required this.description,
    required this.htmlContent,
    required this.bannerImagePath,
    this.optionalMobileAsset
  });

  NewsArticle.fromJson(Map<String, dynamic> json)
      :
        uid = json["UniqueIdentifier"],
        title = json["Title"],
        link = json["Link"],
        pubDate = DateTime.parse(json["PubDate"]),
        description = json["Description"],
        htmlContent = json["HtmlContent"],
        bannerImagePath = json["ImagePath"],
        optionalMobileAsset = json["OptionalMobileImagePath"] ?? "";
}
