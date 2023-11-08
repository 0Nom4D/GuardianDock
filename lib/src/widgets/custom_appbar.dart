import 'package:flutter/material.dart';

import 'package:go_router/go_router.dart';

class GuardianDockAppbar extends StatelessWidget implements PreferredSizeWidget {
  const GuardianDockAppbar({this.title, super.key});

  final String? title;

  @override
  Widget build(BuildContext context) {
    return AppBar(
      elevation: 2.0,
      backgroundColor: Colors.transparent,
      leading: GoRouter.of(context).canPop() ? BackButton(
        color: Theme.of(context).colorScheme.onBackground,
        onPressed: () => GoRouter.of(context).pop()
      ) : null,
      centerTitle: true,
      title: Text(
        title ?? "GuardianDock",
        overflow: TextOverflow.ellipsis,
        style: const TextStyle(fontWeight: FontWeight.bold),
      ),
      actions: [
        if (GoRouterState.of(context).path! == '/')
          IconButton(
            onPressed: () {},
            tooltip: "Link a Bungie account",
            icon: Icon(
              Icons.link,
              color: Theme.of(context).colorScheme.onBackground
            )
          )
      ],
    );
  }

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);
}