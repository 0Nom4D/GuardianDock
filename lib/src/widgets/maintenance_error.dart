import 'package:flutter/material.dart';

class MaintenanceError extends StatelessWidget {
  final Object? error;

  const MaintenanceError({required this.error, super.key});

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
            )
          ]
        ),
      ),
    );
  }
}
