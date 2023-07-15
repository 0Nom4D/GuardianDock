import 'package:flutter_test/flutter_test.dart';
import 'package:guardian_dock/api/models/bungie_account.dart';
import 'package:guardian_dock/api/models/destiny_membership.dart';

void main() {
  test('Bungie Account creation with BungieMembershipId', () {
    var json = {
      "bungieGlobalDisplayName": "ALED",
      "bungieGlobalDisplayNameCode": 3064,
      "bungieNetMembershipId": "31142636",
      "destinyMemberships": [
        {
          "iconPath": "/img/theme/bungienet/icons/steamLogo.png",
          "crossSaveOverride": 0,
          "applicableMembershipTypes": [
            3
          ],
          "isPublic": true,
          "membershipType": 3,
          "membershipId": "4611686018526693254",
          "displayName": "KREKKX",
          "bungieGlobalDisplayName": "ALED",
          "bungieGlobalDisplayNameCode": 3064
        }
      ]
    };

    final accountData = BungieAccountData.fromJson(json);
    expect(accountData.bungieGlobalDisplayName, "ALED");
    expect(accountData.bungieGlobalDisplayNameCode, 3064);
    expect(accountData.bungieNetMembershipId, "31142636");

    expect(accountData.fullBungieId, "ALED#3064");
    expect(accountData.isCrossSavedAccount, false);
    expect(accountData.isNotCrossSavedAccount, false);
    expect(accountData.isSinglePlatformAccount, true);

    expect(accountData.memberships, isNotNull);
    expect(accountData.memberships!.length, 1);

    final firstMembership = accountData.memberships!.first;
    expect(firstMembership.overrideType, 0);
    expect(firstMembership.membershipType, 3);
    expect(firstMembership.platformDisplayName, "KREKKX");
    expect(firstMembership.applicableMemberships.length, 1);
    expect(firstMembership.applicableMemberships.first, 3);
    expect(firstMembership.platformIconPath, "/img/theme/bungienet/icons/steamLogo.png");
    expect(firstMembership.membershipId, "4611686018526693254");
  });

  test('Bungie Account creation with No Platform Account', () {
    var json = {
      "bungieGlobalDisplayName": "A",
      "bungieGlobalDisplayNameCode": 206,
      "bungieNetMembershipId": "31841225",
      "destinyMemberships": []
    };

    final accountData = BungieAccountData.fromJson(json);
    expect(accountData.bungieGlobalDisplayName, "A");
    expect(accountData.bungieGlobalDisplayNameCode, 206);
    expect(accountData.bungieNetMembershipId, "31841225");

    expect(accountData.fullBungieId, "A#206");
    expect(accountData.isCrossSavedAccount, false);
    expect(accountData.isNotCrossSavedAccount, false);
    expect(accountData.isSinglePlatformAccount, false);

    expect(accountData.memberships, isNotNull);
    expect(accountData.memberships!.length, 0);
  });

  test('Bungie Account creation with NoBungieMembershipId', () {
    var json = {
      "bungieGlobalDisplayName": "A",
      "bungieGlobalDisplayNameCode": 196,
      "destinyMemberships": [
        {
          "iconPath": "/img/theme/bungienet/icons/steamLogo.png",
          "crossSaveOverride": 0,
          "applicableMembershipTypes": [
            3
          ],
          "isPublic": true,
          "membershipType": 3,
          "membershipId": "4611686018519134278",
          "displayName": "A",
          "bungieGlobalDisplayName": "A",
          "bungieGlobalDisplayNameCode": 196
        }
      ]
    };

    final accountData = BungieAccountData.fromJson(json);
    expect(accountData.bungieGlobalDisplayName, "A");
    expect(accountData.bungieGlobalDisplayNameCode, 196);
    expect(accountData.bungieNetMembershipId, "");

    expect(accountData.fullBungieId, "A#196");
    expect(accountData.isCrossSavedAccount, false);
    expect(accountData.isNotCrossSavedAccount, false);
    expect(accountData.isSinglePlatformAccount, true);

    expect(accountData.memberships, isNotNull);
    expect(accountData.memberships!.length, 1);
  });

  test('Bungie Account creation with only display name', () {
    var json = {
      "bungieGlobalDisplayName": "A",
      "bungieGlobalDisplayNameCode": 206,
      "destinyMemberships": []
    };

    final accountData = BungieAccountData.fromJson(json);
    expect(accountData.bungieGlobalDisplayName, "A");
    expect(accountData.bungieGlobalDisplayNameCode, 206);
    expect(accountData.bungieNetMembershipId, "");

    expect(accountData.fullBungieId, "A#206");
    expect(accountData.isCrossSavedAccount, false);
    expect(accountData.isNotCrossSavedAccount, false);
    expect(accountData.isSinglePlatformAccount, false);

    expect(accountData.memberships, isNotNull);
    expect(accountData.memberships!.length, 0);
  });

  test('Bungie Account creation with nullable membership', () {
    var json = {
      "bungieGlobalDisplayName": "A",
      "bungieGlobalDisplayNameCode": 206,
    };

    final accountData = BungieAccountData.fromJson(json);
    expect(accountData.bungieGlobalDisplayName, "A");
    expect(accountData.bungieGlobalDisplayNameCode, 206);
    expect(accountData.bungieNetMembershipId, "");

    expect(accountData.fullBungieId, "A#206");
    expect(accountData.isCrossSavedAccount, false);
    expect(accountData.isNotCrossSavedAccount, false);
    expect(accountData.isSinglePlatformAccount, false);

    expect(accountData.memberships, isNotNull);
    expect(accountData.memberships!.length, 0);
  });

  test('Bungie Account creation with basic constructor', () {
    final accountData = BungieAccountData(
      bungieGlobalDisplayName: "A",
      bungieGlobalDisplayNameCode: 206
    );
    expect(accountData.bungieGlobalDisplayName, "A");
    expect(accountData.bungieGlobalDisplayNameCode, 206);
    expect(accountData.bungieNetMembershipId, "");

    expect(accountData.fullBungieId, "A#206");
    expect(accountData.isCrossSavedAccount, false);
    expect(accountData.isNotCrossSavedAccount, false);
    expect(accountData.isSinglePlatformAccount, false);

    expect(accountData.memberships, isNotNull);
    expect(accountData.memberships!.length, 0);
  });


  test('Bungie Account creation to Json transform', () {
    final accountData = BungieAccountData(
      bungieGlobalDisplayName: "A",
      bungieGlobalDisplayNameCode: 103,
      bungieMembershipId: "28082140",
      memberships: [
        DestinyMembership(
          platformIconPath: "/img/theme/bungienet/icons/steamLogo.png",
          overrideType: 3,
          applicableMemberships: [1, 3],
          membershipType: 3,
          platformDisplayName: "★★★",
          membershipId: "4611686018514825640"
        ),
        DestinyMembership(
          platformIconPath: "/img/theme/bungienet/icons/xboxLiveLogo.png",
          overrideType: 3,
          applicableMemberships: [],
          membershipType: 1,
          platformDisplayName: "Nobody7433",
          membershipId: "4611686018519558087"
        )
      ]
    );

    final json = accountData.toJson();
    expect(json["bungieGlobalDisplayName"], "A");
    expect(json["bungieGlobalDisplayNameCode"], 103);
    expect(json["bungieNetMembershipId"], "28082140");

    expect(json["destinyMemberships"].length, 2);
    expect(json["destinyMemberships"][0]["crossSaveOverride"], 3);
    expect(json["destinyMemberships"][0]["membershipType"], 3);
    expect(json["destinyMemberships"][0]["displayName"], "★★★");
    expect(json["destinyMemberships"][0]["applicableMembershipTypes"].length, 2);
    expect(json["destinyMemberships"][0]["applicableMembershipTypes"], [1, 3]);
    expect(json["destinyMemberships"][0]["iconPath"], "/img/theme/bungienet/icons/steamLogo.png");
    expect(json["destinyMemberships"][0]["membershipId"], "4611686018514825640");

    expect(json["destinyMemberships"][1]["crossSaveOverride"], 3);
    expect(json["destinyMemberships"][1]["membershipType"], 1);
    expect(json["destinyMemberships"][1]["displayName"], "Nobody7433");
    expect(json["destinyMemberships"][1]["applicableMembershipTypes"].length, 0);
    expect(json["destinyMemberships"][1]["applicableMembershipTypes"], []);
    expect(json["destinyMemberships"][1]["iconPath"], "/img/theme/bungienet/icons/xboxLiveLogo.png");
    expect(json["destinyMemberships"][1]["membershipId"], "4611686018519558087");
  });
}
