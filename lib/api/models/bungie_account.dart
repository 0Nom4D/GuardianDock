import 'package:guardian_dock/api/models/destiny_membership.dart';

class BungieAccountData {
  String bungieGlobalDisplayName;
  int bungieGlobalDisplayNameCode;
  String bungieNetMembershipId;
  List<DestinyMembership>? memberships;

  BungieAccountData({
    required this.bungieGlobalDisplayName,
    required this.bungieGlobalDisplayNameCode,
    required this.bungieNetMembershipId,
    List<DestinyMembership>? memberships
  }) : memberships = memberships ?? [];

  BungieAccountData.fromJson(Map<String, dynamic> json)
    :
      bungieGlobalDisplayName = json["bungieGlobalDisplayName"],
      bungieGlobalDisplayNameCode = json["bungieGlobalDisplayNameCode"],
      bungieNetMembershipId = json["bungieNetMembershipId"],
      memberships = json["destinyMemberships"] != null ? List<DestinyMembership>.from(json["destinyMemberships"].map((membership) =>
        DestinyMembership.fromJson(membership))
      ) : [];

  Map<String, dynamic> toJson() =>
    {
      'bungieGlobalDisplayName': bungieGlobalDisplayName,
      'bungieGlobalDisplayNameCode': bungieGlobalDisplayNameCode,
      'bungieNetMembershipId': bungieNetMembershipId,
      'destinyMemberships': memberships?.map((membership) => membership.toJson()).toList()
    };
}

// {
// "Response": {
// "searchResults": [
// {
// "bungieGlobalDisplayName": "Nom4D of a Thousand Banner",
// "bungieGlobalDisplayNameCode": 2634,
// "bungieNetMembershipId": "8654607",
// "destinyMemberships": [
// {
// "iconPath": "/img/theme/bungienet/icons/psnLogo.png",
// "crossSaveOverride": 2,
// "applicableMembershipTypes": [
// 3,
// 2
// ],
// "isPublic": true,
// "membershipType": 2,
// "membershipId": "4611686018440106302",
// "displayName": "YT-Nom4D",
// "bungieGlobalDisplayName": "Nom4D of a Thousand Banner",
// "bungieGlobalDisplayNameCode": 2634
// },
// {
// "iconPath": "/img/theme/bungienet/icons/steamLogo.png",
// "crossSaveOverride": 2,
// "applicableMembershipTypes": [],
// "isPublic": true,
// "membershipType": 3,
// "membershipId": "4611686018484788690",
// "displayName": "Nom4D of a Thousand Banners",
// "bungieGlobalDisplayName": "Nom4D of a Thousand Banner",
// "bungieGlobalDisplayNameCode": 2634
// }
// ]
// }
// ],
// "page": 0,
// "hasMore": false
// },
// "ErrorCode": 1,
// "ThrottleSeconds": 0,
// "ErrorStatus": "Success",
// "Message": "Ok",
// "MessageData": {}
// }