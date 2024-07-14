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
    debugPrint(client.authorizationTokens?.accessToken);
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
            Padding(
              padding: const EdgeInsets.only(right: 15),
              child: IconButton(
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
            )
          } else ...{
            Padding(
              padding: const EdgeInsets.only(right: 15),
              child: MenuAnchor(
                builder: (BuildContext context, MenuController controller, Widget? child) {
                  return GestureDetector(
                    child: ClipOval(
                      child: SizedBox.fromSize(
                        size: const Size.fromRadius(17.5),
                        child: Image.network(
                            Uri.https(ApiClient.baseUrl, '/img/profile/avatars/cc00009.jpg').toString()
                        ),
                      )
                    ),
                    onTap: () {
                      if (controller.isOpen) {
                        controller.close();
                      } else {
                        controller.open();
                      }
                    },
                  );
                },
                menuChildren: List<MenuItemButton>.generate(
                  1, (int index) => MenuItemButton(
                    onPressed: () async {
                      client.oauth.closeSession();
                      setState(() {});
                    },
                    child: const Text("Se déconnecter")
                  )
                ),
              )
            )
          }
      ],
    );
  }
}