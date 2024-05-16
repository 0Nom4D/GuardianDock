import 'package:flutter/material.dart';
import 'package:simple_icons/simple_icons.dart';
import 'package:url_launcher/url_launcher.dart';

class MaintenanceError extends StatelessWidget {
  final Object? error;
  final void Function() onReload;

  const MaintenanceError({required this.error, required this.onReload, super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(40),
      child: Center(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Icon(
              Icons.error,
              size: 75,
              color: Theme.of(context).colorScheme.error
            ),
            SizedBox(height: MediaQuery.of(context).size.height * .02),
            Flexible(
              child: Text(
                error.toString().replaceFirst(RegExp('HttpException: '), ''),
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  color: Theme.of(context).colorScheme.error,
                ),
              ),
            ),
            SizedBox(height: MediaQuery.of(context).size.height * .02),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Flexible(
                  child: ElevatedButton.icon(
                    onPressed: () async {
                      canLaunchUrl(Uri.parse("https://twitter.com/BungieHelp")).then((bool result) async {
                        await launchUrl(
                          Uri.parse("https://twitter.com/BungieHelp"),
                          mode: LaunchMode.externalApplication
                        );
                      });
                    },
                    label: Text(
                      "@BungieHelp",
                      style: TextStyle(
                        color: Theme.of(context).colorScheme.onSurface
                      ),
                    ),
                    icon: Icon(
                      size: 20,
                      SimpleIcons.x,
                      color: Theme.of(context).colorScheme.onSurface,
                    ),
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Theme.of(context).colorScheme.error.withOpacity(.35)
                    ),
                  ),
                ),
                Flexible(
                  child: ElevatedButton.icon(
                    onPressed: onReload,
                    label: Text(
                      "Reload",
                      style: TextStyle(
                        color: Theme.of(context).colorScheme.onSurface
                      ),
                    ),
                    icon: Icon(
                      size: 20,
                      Icons.refresh,
                      color: Theme.of(context).colorScheme.onSurface,
                    ),
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Theme.of(context).colorScheme.error.withOpacity(.35)
                    ),
                  ),
                )
              ],
            )
          ]
        ),
      ),
    );
  }
}
