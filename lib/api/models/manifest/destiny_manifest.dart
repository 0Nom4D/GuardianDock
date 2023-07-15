import 'package:guardian_dock/api/models/manifest/mobile_gear_asset_database.dart';

class DestinyManifest {
  String version;
  String mobileAssetContentPath;
  String mobileClanBannerDatabasePath;

  List<MobileGearAssetDataBases> mobileGearsAssetsDB;

  Map<String, String> mobileWorldContentPaths;
  List<dynamic> iconImagePyramidInfo;
  Map<String, String> jsonWorldContentPaths;
  Map<String, String> mobileGearCDN;

  Map<String, Map<String, String>> jsonWorldComponentContentPaths;

  DestinyManifest({
    required this.version,
    required this.mobileAssetContentPath,
    required this.mobileClanBannerDatabasePath,
    required this.mobileGearsAssetsDB,
    required this.mobileWorldContentPaths,
    required this.iconImagePyramidInfo,
    required this.jsonWorldContentPaths,
    required this.mobileGearCDN,
    required this.jsonWorldComponentContentPaths,
  });

  DestinyManifest.fromJson(Map<String, dynamic> json)
    :
      version = json["version"],
      mobileAssetContentPath = json["mobileAssetContentPath"],
      mobileClanBannerDatabasePath = json["mobileClanBannerDatabasePath"],
      mobileGearsAssetsDB = List<MobileGearAssetDataBases>.from(
        json["mobileGearAssetDataBases"].map((e) => MobileGearAssetDataBases.fromJson(e))
      ),
      mobileWorldContentPaths = Map<String, String>.from(
        json["mobileWorldContentPaths"].map((key, value) => MapEntry(key, value?.toString()))
      ),
      iconImagePyramidInfo = json["iconImagePyramidInfo"],
      jsonWorldContentPaths = Map<String, String>.from(
          json["jsonWorldContentPaths"].map((key, value) => MapEntry(key, value?.toString()))
      ),
      mobileGearCDN = Map<String, String>.from(
          json["mobileGearCDN"].map((key, value) => MapEntry(key, value?.toString()))
      ),
      jsonWorldComponentContentPaths = Map<String, Map<String, String>>.from(
        json["jsonWorldComponentContentPaths"].map((key, value) => MapEntry(key, Map<String, String>.from(
          value.map((keyy, valuee) => MapEntry(keyy, valuee.toString()))
        )))
      );

  Map<String, dynamic> toJson() =>
    {
      "version": version,
      "mobileAssetContentPath": mobileAssetContentPath,
      "mobileClanBannerDatabasePath": mobileClanBannerDatabasePath,
      "mobileGearAssetDataBases": mobileGearsAssetsDB.map((e) => e.toJson()).toList(),
      "mobileWorldContentPaths": mobileWorldContentPaths,
      "iconImagePyramidInfo": iconImagePyramidInfo,
      "jsonWorldContentPaths": jsonWorldContentPaths,
      "mobileGearCDN": mobileGearCDN,
      "jsonWorldComponentContentPaths": jsonWorldComponentContentPaths
    };
}
