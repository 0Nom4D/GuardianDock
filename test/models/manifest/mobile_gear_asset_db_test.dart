import 'package:flutter_test/flutter_test.dart';

import 'package:guardian_dock/api/models/manifest/mobile_gear_asset_database.dart';

void main() {
  test("MobileGearAssetDataBases from JSON Build test", () {
    var json = {
      "version": 0,
      "path": "/common/destiny2_content/sqlite/asset/asset_sql_content_b2075ce2c4ebbf04c799ca0c772f520a.content"
    };

    final mobileGearDB = MobileGearAssetDataBases.fromJson(json);

    expect(mobileGearDB.version, 0);
    expect(mobileGearDB.databasePath, "/common/destiny2_content/sqlite/asset/asset_sql_content_b2075ce2c4ebbf04c799ca0c772f520a.content");
  });

  test("MobileGearAssetDataBases to JSON Build test", () {
    final mobileGearDB = MobileGearAssetDataBases(
      version: 0,
      databasePath: "/common/destiny2_content/sqlite/asset/asset_sql_content_b2075ce2c4ebbf04c799ca0c772f520a.content"
    );
    final json = mobileGearDB.toJson();

    expect(json["version"], 0);
    expect(json["path"], "/common/destiny2_content/sqlite/asset/asset_sql_content_b2075ce2c4ebbf04c799ca0c772f520a.content");
  });
}