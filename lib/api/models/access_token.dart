// coverage:ignore-file

class AccessToken {
  final String accessToken;
  final String tokenType;
  final DateTime grantedAt;
  final int expiresIn;
  final String membershipId;

  const AccessToken({
    required this.accessToken,
    required this.tokenType,
    required this.grantedAt,
    required this.expiresIn,
    required this.membershipId
  });

  Map<String, String> get authorizationHeader => { "Authorization": "Bearer $accessToken" };

  bool isExpired() {
    return DateTime.now().isAfter(grantedAt.add(Duration(seconds: expiresIn)));
  }

  AccessToken.fromJson(Map<String, dynamic> json) :
      accessToken = json["access_token"],
      tokenType = json["token_type"],
      expiresIn = json["expires_in"],
      membershipId = json["membership_id"],
      grantedAt = json["grantedAt"] != null ? DateTime.parse(json["grantedAt"]) : DateTime.now()
  ;

  Map<String, dynamic> toJson() {
    return <String, dynamic>{
      "access_token": accessToken,
      "token_type": tokenType,
      "expires_in": expiresIn,
      "membership_id": membershipId,
      "grantedAt": grantedAt.toIso8601String()
    };
  }
}
