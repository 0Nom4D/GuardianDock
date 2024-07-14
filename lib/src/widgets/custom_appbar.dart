import 'package:flutter/material.dart';
import 'package:get_it/get_it.dart';

import 'package:go_router/go_router.dart';
import 'package:guardian_dock/api/client_api.dart';

class GuardianDockAppbar extends StatefulWidget implements PreferredSizeWidget {
  const GuardianDockAppbar({this.title, super.key});

  final String? title;

  @override
  State<GuardianDockAppbar> createState() => _GuardianDockAppbarState();

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);
}

class _GuardianDockAppbarState extends State<GuardianDockAppbar> {
  final client = GetIt.I<ApiClient>();

  @override
  Widget build(BuildContext context) {
    return AppBar(
      elevation: 2.0,
      backgroundColor: Colors.transparent,
      leading: GoRouter.of(context).canPop() ? BackButton(
        color: Theme.of(context).colorScheme.onSurface,
        onPressed: () => GoRouter.of(context).pop()
      ) : null,
      centerTitle: true,
      title: Text(
        widget.title ?? "GuardianDock",
        overflow: TextOverflow.ellipsis,
        style: const TextStyle(fontWeight: FontWeight.bold),
      ),
      actions: [
        if (GoRouterState.of(context).path! == '/')
          if (client.authorizationTokens == null) ...{
            IconButton(
              onPressed: () async {
                await client.oauth.connectUserWithOAuth2();
                setState(() {});
              },
              tooltip: "Link a Bungie account",
              icon: Icon(
                Icons.link,
                color: Theme.of(context).colorScheme.onSurface
              )
            )
          } else ...{
            // TODO Bien gérer l'affichage de la photo de profile du compte Bungie
            CircleAvatar(
              radius: 10,
              child: Image.network(
                Uri.https(ApiClient.baseUrl, '/img/profile/avatars/cc00009.jpg').toString()
              ),
            )
          }
      ],
    );
  }
}