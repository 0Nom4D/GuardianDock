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

  IconData getIconForMembership(int applicableMembership) {
    Map<int, IconData> platformIcons = {
      1: SimpleIcons.xbox,
      2: SimpleIcons.playstation,
      3: SimpleIcons.steam,
      4: SimpleIcons.activision,
      5: SimpleIcons.stadia,
      6: SimpleIcons.epicgames
    };
    return platformIcons[applicableMembership] ?? Icons.question_mark;
  }

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
        final ClanData? userClan = snapshot.data;

        return Scaffold(
          resizeToAvoidBottomInset: false,
          backgroundColor: Theme.of(context).colorScheme.background,
          appBar: const GuardianDockAppbar(title: ""),
          body: CustomScrollView(
            slivers: [
              SliverToBoxAdapter(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Text(
                      widget.bungieAccount.bungieGlobalDisplayName,
                      textAlign: TextAlign.center,
                      style: const TextStyle(
                        fontSize: 34,
                        fontWeight: FontWeight.bold,
                        fontFamily: "NeueHaasDisplay"
                      ),
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: [
                            for (int x = 0; x < widget.bungieAccount.memberships!.length; x++)
                              ...[
                                Icon(
                                  getIconForMembership(widget.bungieAccount.memberships![x].membershipType),
                                  color: Theme.of(context).colorScheme.onPrimary,
                                  size: 12,
                                ),
                                if (x - 1 != widget.bungieAccount.memberships!.length)
                                  SizedBox(width: MediaQuery.of(context).size.width * .02)
                              ]
                          ],
                        ),
                        if (userClan != null)
                          ...[
                            SizedBox(width: MediaQuery.of(context).size.width * .02),
                            Text(userClan.name)
                          ]
                      ],
                    )
                  ],
                )
              ),
            ],
          ),
        );
      },
    );
  }
}