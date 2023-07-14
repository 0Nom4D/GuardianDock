class DestinyMembership {
  String platformIconPath;
  int overrideType;
  int membershipType;
  List<int> applicableMemberships;
  String platformDisplayName;
  String membershipId;

  DestinyMembership({
    required this.platformIconPath,
    required this.overrideType,
    required this.membershipType,
    required this.applicableMemberships,
    required this.platformDisplayName,
    required this.membershipId
  });

  DestinyMembership.fromJson(Map<String, dynamic> json)
    :
      platformIconPath = json["iconPath"],
      overrideType = json["crossSaveOverride"],
      membershipType = json["membershipType"],
      applicableMemberships = json["applicableMembershipTypes"].cast<int>(),
      platformDisplayName = json["displayName"],
      membershipId = json["membershipId"];

  Map<String, dynamic> toJson() =>
    {
      "iconPath": platformIconPath,
      "crossSaveOverride": overrideType,
      "membershipType": membershipType,
      "applicableMembershipTypes": applicableMemberships,
      "displayName": platformDisplayName,
      "membershipId": membershipId
    };
}
