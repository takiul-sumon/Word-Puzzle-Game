import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:word_puzzle/helper_function.dart';
import 'package:word_puzzle/keyboard.dart';
import 'package:word_puzzle/wordle_hurdle.dart';
import './hurdle_provider.dart';

void ShowMsg(BuildContext context, String msg) {
  ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text(msg)));
}

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
                          ShowMsg(context, 'Invalid Word');
                          return;
                        }
                        if (provider.shouldCheckForAnswer) {
                          provider.checkAnswer();
                        }
                        if (provider.wins) {
                          showResult(
                              context: context,
                              title: 'You Win',
                              body: 'The Word was ${provider.targetWord}',
                              onPlayAgain: () {
                                Navigator.pop(context);
                                provider.reset();
                              },
                              onCancel: () {
                                 Navigator.pop(context);
                              });
                        } else if (provider.noAttemptsLeft) {
                          showResult(
                            context: context,
                            title: 'You Lost',
                            body: "The Target Word was ${provider.targetWord}",
                            onPlayAgain: () {
                              Navigator.pop(context);
                                provider.reset();
                            },
                            onCancel: () {
                               Navigator.pop(context);
                            },
                          );
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
