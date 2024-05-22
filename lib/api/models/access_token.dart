// coverage:ignore-file

class AccessToken {
  final String accessToken;
  final String tokenType;
  final int expiresIn;
  final String membershipId;

  const AccessToken({
    required this.accessToken,
    required this.tokenType,
    required this.expiresIn,
    required this.membershipId
  });

  AccessToken.fromJson(Map<String, dynamic> json) :
      accessToken = json["access_token"],
      tokenType = json["token_type"],
      expiresIn = json["expires_in"],
      membershipId = json["membership_id"];

  Map<String, dynamic> toJson() {
    return <String, dynamic>{
      "access_token": accessToken,
      "token_type": tokenType,
      "expires_in": expiresIn,
      "membership_id": membershipId
    };
  }
}
