import 'package:guardian_dock/api/models/manifest/mobile_gear_asset_database.dart';

class DestinyManifest {
  String version;
  String mobileAssetContentPath;
  String mobileClanBannerDatabasePath;

  List<MobileGearAssetDataBases> mobileGearsAssetsDB;

  Map<String, String> mobileWorldContentPaths;
  Map<String, dynamic> iconImagePyramidInfo;
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
      mobileWorldContentPaths = json["mobileWorldContentPaths"],
      iconImagePyramidInfo = json["iconImagePyramidInfo"],
      jsonWorldContentPaths = json["jsonWorldContentPaths"],
      mobileGearCDN = json["mobileGearCDN"],
      jsonWorldComponentContentPaths = json["jsonWorldComponentContentPaths"];

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
