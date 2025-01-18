import 'dart:math';

import 'package:flutter/material.dart';
import 'package:english_words/english_words.dart' as words;
import 'package:word_puzzle/wordle.dart';
import 'package:flutter/foundation.dart';

class HurdleProvider extends ChangeNotifier {
  final random = Random.secure();
  List<Wordle> hurdleBoard = [];
  List<String> excludedLetters = [];
  List<String> rowInputs = [];
  List<String> totalWords = [];
  String targetWord = '';
  int count = 0;
  int letterPerRow = 5;

  init() {
    totalWords = words.all.where((element) => element.length == 5).toList();
    generateBoard();
    genreateRandomWord();
  }

  generateBoard() {
    hurdleBoard = List.generate(
      30,
      (index) => Wordle(letter: ''),
    );
  }

  genreateRandomWord() {
    targetWord = totalWords[random.nextInt(totalWords.length)].toUpperCase();
    print(targetWord);
  }

  inputLetter(String letter) {
    if(count<letterPerRow){
      rowInputs.add(letter);
      count++;
    }
  }
}
