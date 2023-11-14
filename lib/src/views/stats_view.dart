import 'package:flutter/material.dart';

import 'package:guardian_dock/src/widgets/custom_appbar.dart';
import 'package:guardian_dock/api/models/bungie_account.dart';

class StatView extends StatefulWidget {
  final BungieAccountData bungieAccount;

  const StatView({required this.bungieAccount, super.key});

  @override
  StatViewState createState() => StatViewState();
}

class StatViewState extends State<StatView> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      backgroundColor: Theme.of(context).colorScheme.background,
      appBar: GuardianDockAppbar(title: widget.bungieAccount.fullBungieId),
    );
  }
}