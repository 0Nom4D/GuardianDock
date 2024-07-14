import 'package:flutter_test/flutter_test.dart';

import 'package:guardian_dock/api/models/bungie_user.dart';

void main() {
  test('Bungie User creation', () {
    const bungieUser = BungieUser(
      membershipId: 8654607,
      uniqueName: "Nom4D of a Thousand Banner#2634",
      displayName: "Nom4D of a Thousand Banner",
      isDeleted: false,
      profilePicturePath: "/img/profile/avatars/cc00009.jpg",
      cachedBungieGlobalDisplayName: "Nom4D of a Thousand Banner",
      cachedBungieGlobalDisplayNameCode: 2634,
      locale: "fr"
    );
    expect(bungieUser.membershipId, 8654607);
    expect(bungieUser.uniqueName, "Nom4D of a Thousand Banner#2634");
    expect(bungieUser.displayName, "Nom4D of a Thousand Banner");
    expect(bungieUser.isDeleted, false);
    expect(bungieUser.profilePicturePath, "/img/profile/avatars/cc00009.jpg");
    expect(bungieUser.cachedBungieGlobalDisplayName, "Nom4D of a Thousand Banner");
    expect(bungieUser.cachedBungieGlobalDisplayNameCode, 2634);
    expect(bungieUser.locale, "fr");
  });

  test('Bungie User creation from Json', () {
    var json = {
      "membershipId": "8654607",
      "uniqueName": "Nom4D of a Thousand Banner#2634",
      "displayName": "Nom4D of a Thousand Banner",
      "profilePicture": 70711,
      "profileTheme": 1101,
      "userTitle": 0,
      "successMessageFlags": "43",
      "isDeleted": false,
      "about": "Si tu vois la balle que j'ai tiré, c'est que tu as vécu assez longtemps pour mourrir en paix.",
      "firstAccess": "2014-11-13T19:33:20.299Z",
      "lastUpdate": "2022-09-25T23:40:31.654Z",
      "context": {
        "isFollowing": false,
        "ignoreStatus": {
          "isIgnored": false,
          "ignoreFlags": 0
        }
      },
      "psnDisplayName": "YT-Nom4D",
      "showActivity": true,
      "locale": "fr",
      "localeInheritDefault": true,
      "showGroupMessaging": true,
      "profilePicturePath": "/img/profile/avatars/cc00009.jpg",
      "profileThemeName": "d2_01",
      "userTitleDisplay": "Newbie",
      "statusText": "",
      "statusDate": "2015-10-25T13:30:05.667Z",
      "blizzardDisplayName": "Nom4D",
      "steamDisplayName": "0Nom4D-",
      "twitchDisplayName": "Nom4D",
      "cachedBungieGlobalDisplayName": "Nom4D of a Thousand Banner",
      "cachedBungieGlobalDisplayNameCode": 2634
    };

    final bungieUser = BungieUser.fromJson(json);
    expect(bungieUser.membershipId, 8654607);
    expect(bungieUser.uniqueName, "Nom4D of a Thousand Banner#2634");
    expect(bungieUser.displayName, "Nom4D of a Thousand Banner");
    expect(bungieUser.isDeleted, false);
    expect(bungieUser.profilePicturePath, "/img/profile/avatars/cc00009.jpg");
    expect(bungieUser.cachedBungieGlobalDisplayName, "Nom4D of a Thousand Banner");
    expect(bungieUser.cachedBungieGlobalDisplayNameCode, 2634);
    expect(bungieUser.locale, "fr");
  });

  test('Bungie User toJson', () {
    var json = {
      "membershipId": "8654607",
      "uniqueName": "Nom4D of a Thousand Banner#2634",
      "displayName": "Nom4D of a Thousand Banner",
      "profilePicture": 70711,
      "profileTheme": 1101,
      "userTitle": 0,
      "successMessageFlags": "43",
      "isDeleted": false,
      "about": "Si tu vois la balle que j'ai tiré, c'est que tu as vécu assez longtemps pour mourrir en paix.",
      "firstAccess": "2014-11-13T19:33:20.299Z",
      "lastUpdate": "2022-09-25T23:40:31.654Z",
      "context": {
        "isFollowing": false,
        "ignoreStatus": {
          "isIgnored": false,
          "ignoreFlags": 0
        }
      },
      "psnDisplayName": "YT-Nom4D",
      "showActivity": true,
      "locale": "fr",
      "localeInheritDefault": true,
      "showGroupMessaging": true,
      "profilePicturePath": "/img/profile/avatars/cc00009.jpg",
      "profileThemeName": "d2_01",
      "userTitleDisplay": "Newbie",
      "statusText": "",
      "statusDate": "2015-10-25T13:30:05.667Z",
      "blizzardDisplayName": "Nom4D",
      "steamDisplayName": "0Nom4D-",
      "twitchDisplayName": "Nom4D",
      "cachedBungieGlobalDisplayName": "Nom4D of a Thousand Banner",
      "cachedBungieGlobalDisplayNameCode": 2634
    };

    final bungieUser = BungieUser.fromJson(json);
    expect(bungieUser.membershipId, 8654607);
    expect(bungieUser.uniqueName, "Nom4D of a Thousand Banner#2634");
    expect(bungieUser.displayName, "Nom4D of a Thousand Banner");
    expect(bungieUser.isDeleted, false);
    expect(bungieUser.profilePicturePath, "/img/profile/avatars/cc00009.jpg");
    expect(bungieUser.cachedBungieGlobalDisplayName, "Nom4D of a Thousand Banner");
    expect(bungieUser.cachedBungieGlobalDisplayNameCode, 2634);
    expect(bungieUser.locale, "fr");

    final userToJson = bungieUser.toJson();
    expect(userToJson["membershipId"], 8654607);
    expect(userToJson["uniqueName"], "Nom4D of a Thousand Banner#2634");
    expect(userToJson["displayName"], "Nom4D of a Thousand Banner");
    expect(userToJson["isDeleted"], false);
    expect(userToJson["profilePicturePath"], "/img/profile/avatars/cc00009.jpg");
    expect(userToJson["cachedBungieGlobalDisplayName"], "Nom4D of a Thousand Banner");
    expect(userToJson["cachedBungieGlobalDisplayNameCode"], 2634);
    expect(userToJson["locale"], "fr");
  });
}
