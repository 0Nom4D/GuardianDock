class ClanData {
  String groupId;
  String name;
  String description;
  String locale;
  String motto;
  DateTime createdAt;
  int memberCount;
  bool isPublic;

  ClanData({
    required this.groupId,
    required this.name,
    required this.description,
    required this.locale,
    required this.motto,
    required this.createdAt,
    required this.memberCount,
    required this.isPublic
  });

  ClanData.fromJson(Map<String, dynamic> json)
      :
        groupId = json["groupId"],
        name = json["name"],
        description = json["about"],
        locale = json["locale"],
        motto = json["motto"],
        createdAt = DateTime.parse(json["creationDate"]),
        memberCount = json["memberCount"],
        isPublic = json["isPublic"]
      ;

  Map<String, dynamic> toJson() =>
      {
        'groupId': groupId,
        'name': name,
        'about': description,
        'locale': locale,
        'motto': motto,
        'creationDate': createdAt.toIso8601String(),
        'memberCount': memberCount,
        'isPublic': isPublic
      };
}