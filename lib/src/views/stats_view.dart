// coverage:ignore-file
import 'package:flutter/material.dart';

import 'package:simple_icons/simple_icons.dart';
import 'package:get_it/get_it.dart';

import 'package:guardian_dock/api/models/bungie_account.dart';
import 'package:guardian_dock/api/models/clan.dart';
import 'package:guardian_dock/api/client_api.dart';

import 'package:guardian_dock/src/widgets/maintenance_error.dart';
import 'package:guardian_dock/src/widgets/custom_appbar.dart';

class StatView extends StatefulWidget {
  final BungieAccountData bungieAccount;

  const StatView({required this.bungieAccount, super.key});

  @override
  StatViewState createState() => StatViewState();
}

class StatViewState extends State<StatView> {
  final ApiClient client = GetIt.I<ApiClient>();

  @override
  Widget build(BuildContext context) {
    return FutureBuilder<ClanData?>(
      future: client.clan.getClanForUser(widget.bungieAccount),
      builder: (BuildContext context, AsyncSnapshot<ClanData?> snapshot) {
        if (snapshot.connectionState == ConnectionState.waiting) {
          return Center(
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: CircularProgressIndicator(
                color: Theme.of(context).colorScheme.tertiary,
              ),
            )
          );
        } else if (snapshot.hasError && snapshot.error != null) {
          return Scaffold(
            body: MaintenanceError(
              error: snapshot.error,
              onReload: () {
                setState(() {});
                Future.delayed(const Duration(seconds: 5));
              },
            )
          );
        }
        return Scaffold(
          resizeToAvoidBottomInset: false,
          backgroundColor: Theme.of(context).colorScheme.background,
          appBar: GuardianDockAppbar(title: widget.bungieAccount.fullBungieId),
        );
      },
    );
  }
}