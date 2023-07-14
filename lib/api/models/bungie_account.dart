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

  String get getFullBungieId => "$bungieGlobalDisplayName#$bungieGlobalDisplayNameCode";

  bool get isCrossSavedAccount =>
    memberships!.length > 1 && memberships!.every((element) => element.overrideType != 0);

  bool get isNotCrossSavedAccount =>
    memberships!.length > 1 && memberships!.every((element) => element.overrideType == 0);

  bool get isSinglePlatformAccount => memberships!.length == 1;

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
