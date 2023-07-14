import 'package:flutter/material.dart';

import 'package:guardian_dock/api/models/destiny_membership.dart';
import 'package:guardian_dock/api/models/bungie_account.dart';
import 'package:guardian_dock/api/client_api.dart';

class AccountSuggestionTile extends StatelessWidget {
  const AccountSuggestionTile({required this.relatedAccount, super.key});

  final BungieAccountData relatedAccount;

  DestinyMembership getMainDestinyMembership() {
    if (relatedAccount.isCrossSavedAccount) {
      return relatedAccount.memberships!.singleWhere((element) =>
        element.overrideType == element.membershipType
      );
    }
    return relatedAccount.memberships!.first;
  }

  @override
  Widget build(BuildContext context) {
    return ListTile(
      leading: Image.network(
        width: 40,
        height: 40,
        Uri.https(
          ApiClient.baseUrl,
          getMainDestinyMembership().platformIconPath
        ).toString()
      ),
      title: Text(
        "${relatedAccount.bungieGlobalDisplayName}#${relatedAccount.bungieGlobalDisplayNameCode}"
      ),
      tileColor: Theme.of(context).colorScheme.background,
      textColor: Theme.of(context).colorScheme.onBackground
    );
  }
}
