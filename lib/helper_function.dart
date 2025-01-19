import 'package:flutter/material.dart';

void showResult(
    {required BuildContext context,
    required String title,
    required String body,
    required VoidCallback onPlayAgain,
    required VoidCallback onCancel}) {
  showDialog(context: context, builder: (context) => AlertDialog(
    title: Text(title),
    content: Text(body),
    actions: [
      TextButton(onPressed: onPlayAgain, child: Text('Play Again')),
      TextButton(onPressed: onCancel, child:const Text('Quit')),
    ],
  ));
}
