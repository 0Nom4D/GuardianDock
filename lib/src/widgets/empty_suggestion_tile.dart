import 'package:flutter/material.dart';

class EmptySuggestionTile extends StatelessWidget {
  const EmptySuggestionTile({super.key});

  @override
  Widget build(BuildContext context) {
    return ListTile(
      title: const Text("No Items Found!"),
      tileColor: Theme.of(context).colorScheme.background,
      textColor: Theme.of(context).colorScheme.onBackground
    );
  }
}
