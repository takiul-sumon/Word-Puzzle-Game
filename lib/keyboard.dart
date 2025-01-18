// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';

const Keylist = [
  ['Q', 'W', 'E', 'R', 'T', 'Y', 'U', 'I', 'O', 'P'],
  ['A', 'S', 'D', 'F', 'G', 'H', 'J', 'K', 'L'],
  [
    'Z',
    'X',
    'C',
    'V',
    'B',
    'N',
    'M',
  ]
];

class KeyBoardView extends StatelessWidget {
  final List<String> excludedLetters;
  final Function(String) onPressed;
  const KeyBoardView({
    Key? key,
    required this.excludedLetters,
    required this.onPressed,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        for (int i = 0; i < Keylist.length; i++)
          Row(
            children: Keylist[i]
                .map((e) => VirtualKey(
                    letter: e,
                    extended: excludedLetters.contains(e),
                    onPress: (value) {
                      onPressed(value);
                    }))
                .toList(),
          ),
      ],
    );
  }
}

class VirtualKey extends StatelessWidget {
  final String letter;
  final bool extended;
  final Function(String) onPress;
  VirtualKey(
      {super.key,
      required this.letter,
      required this.extended,
      required this.onPress});
  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: ElevatedButton(
        onPressed: () {
          onPress(letter);
        },
        child: Text(letter),
        style: ElevatedButton.styleFrom(
          backgroundColor: extended ? Colors.red : Colors.black,
          foregroundColor: Colors.white,
        ),
      ),
    );
  }
}
