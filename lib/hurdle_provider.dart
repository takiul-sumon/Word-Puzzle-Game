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
  int index = 0;
  bool wins = false;

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
    if (count < letterPerRow) {
      rowInputs.add(letter);
      count++;
      hurdleBoard[index] = Wordle(letter: letter);
      index++;
      notifyListeners();
    }
  }

  deleteLetter() {
    if (count > 0) {
      rowInputs.removeLast();
      count--;
      index--;
      hurdleBoard[index] = Wordle(letter: '');
      notifyListeners();
      print(rowInputs);
    }
  }

  bool get isValidWord => totalWords.contains(rowInputs.join('').toLowerCase());
  bool get shouldCheckForAnswer => rowInputs.length == letterPerRow;

  void checkAnswer() {
    final input = rowInputs.join('');
    if (targetWord == input) {
      wins = true;
    }
  }
}
