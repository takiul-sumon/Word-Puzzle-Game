import 'package:flutter/material.dart';
import 'package:word_puzzle/hurdle_provider.dart';
import 'package:word_puzzle/wordle.dart';

class WordleView extends StatelessWidget {
  final Wordle wordle;
  const WordleView({super.key, required this.wordle});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        shape: BoxShape.circle,
        color: wordle.doesNotExistInTarget
            ? Colors.white60
            : wordle.existsInteger
                ? Colors.blueGrey
                : null,
        border: Border.all(width: 2, color: Colors.red),
      ),
      child: Text(wordle.letter,style: TextStyle(fontSize: 10),),
    );
  }
}
