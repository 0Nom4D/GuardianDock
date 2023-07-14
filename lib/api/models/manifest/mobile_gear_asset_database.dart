class MobileGearAssetDataBases {
  String version;
  String databasePath;

  MobileGearAssetDataBases({
    required this.version,
    required this.databasePath
  });

  MobileGearAssetDataBases.fromJson(Map<String, dynamic> json)
    :
      version = json["version"],
      databasePath = json["path"];

  Map<String, dynamic> toJson() =>
    {
      "version": version,
      "path": databasePath
    };
}