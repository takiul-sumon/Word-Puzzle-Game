import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:word_puzzle/keyboard.dart';
import 'package:word_puzzle/wordle_hurdle.dart';
import './hurdle_provider.dart';

class WordHurdle extends StatefulWidget {
  const WordHurdle({super.key});

  @override
  State<WordHurdle> createState() => _WordHurdleState();
}

class _WordHurdleState extends State<WordHurdle> {
  @override
  void didChangeDependencies() {
    Provider.of<HurdleProvider>(context, listen: false).init();
    super.didChangeDependencies();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Word Hurdle'),
      ),
      body: Center(
        child: Column(
          children: [
            Expanded(
              child: SizedBox(
                width: MediaQuery.of(context).size.width * .7,
                child: Consumer<HurdleProvider>(
                    builder: (context, provider, child) => GridView.builder(
                        gridDelegate:
                            const SliverGridDelegateWithFixedCrossAxisCount(
                                crossAxisCount: 5),
                        itemCount: provider.hurdleBoard.length,
                        itemBuilder: (context, index) {
                          final wordle = provider.hurdleBoard[index];
                          return WordleView(wordle: wordle);
                        })),
              ),
            ),
            Consumer<HurdleProvider>(
                builder: (context, provider, child) => KeyBoardView(
                      excludedLetters: provider.excludedLetters,
                      onPressed: (value) {
                        provider.inputLetter(value);
                        print(provider.rowInputs);
                      },
                    )),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Consumer<HurdleProvider>(
                builder: (context, provider, child) => Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    ElevatedButton(
                      onPressed: () {
                        provider.deleteLetter();
                      },
                      child: Text('DELETE'),
                    ),
                    ElevatedButton(
                      onPressed: () {
                        if (!provider.isValidWord) {
                          ScaffoldMessenger.of(context).showSnackBar(
                              const SnackBar(content: Text('Invalid Word')));
                          return;
                        }
                        if (provider.shouldCheckForAnswer) {
                          provider.checkAnswer();
                        }
                      },
                      child: Text('SUBMIT'),
                    ),
                  ],
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
