class BungieUser {
  final int membershipId;
  final String uniqueName;
  final String displayName;
  final String locale;
  final String profilePicturePath;
  final String cachedBungieGlobalDisplayName;
  final int cachedBungieGlobalDisplayNameCode;
  final bool isDeleted;

  const BungieUser({
    required this.membershipId,
    required this.uniqueName,
    required this.displayName,
    required this.locale,
    required this.profilePicturePath,
    required this.cachedBungieGlobalDisplayName,
    required this.cachedBungieGlobalDisplayNameCode,
    required this.isDeleted
  });

  BungieUser.fromJson(Map<String, dynamic> json) :
    membershipId = int.parse(json["membershipId"]),
    uniqueName = json["uniqueName"],
    displayName = json["displayName"],
    locale = json["locale"],
    profilePicturePath = json["profilePicturePath"],
    cachedBungieGlobalDisplayName = json["cachedBungieGlobalDisplayName"],
    cachedBungieGlobalDisplayNameCode = json["cachedBungieGlobalDisplayNameCode"],
    isDeleted = json["isDeleted"];

  Map<String, dynamic> toJson() {
    return <String, dynamic>{
      "membershipId": membershipId,
      "uniqueName": uniqueName,
      "displayName": displayName,
      "locale": locale,
      "profilePicturePath": profilePicturePath,
      "cachedBungieGlobalDisplayName": cachedBungieGlobalDisplayName,
      "cachedBungieGlobalDisplayNameCode": cachedBungieGlobalDisplayNameCode,
      "isDeleted": isDeleted
    };
  }
}
