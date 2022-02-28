import 'package:flutter/material.dart';

class ErrorView extends StatelessWidget {
  final Function() onRetry;

  final String errorMessage;

  const ErrorView({
    Key? key,
    required this.onRetry,
    required this.errorMessage,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
          title: const Text('DOTA', style: TextStyle(color: Colors.white)),
          centerTitle: true),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Container(
              margin: const EdgeInsets.only(bottom: 12),
              child: const Icon(
                Icons.warning,
                color: Colors.amberAccent,
                size: 100,
              ),
            ),
            Container(
              margin: const EdgeInsets.only(bottom: 12),
              child: Text(
                'ERROR',
                style: Theme.of(context).textTheme.subtitle1,
              ),
            ),
            Container(
              margin: const EdgeInsets.only(bottom: 12),
              child: Text(
                errorMessage,
                style: Theme.of(context).textTheme.subtitle2,
              ),
            ),
            ElevatedButton(
              onPressed: () {
                onRetry();
              },
              child: const Padding(
                padding: EdgeInsets.all(12),
                child: Text('Retry'),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
