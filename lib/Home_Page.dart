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
                width: MediaQuery.of(context).size.width*.7,
                child: Consumer<HurdleProvider>(
                    builder: (context, provider, child) => GridView.builder(
                        gridDelegate:const SliverGridDelegateWithFixedCrossAxisCount(
                            crossAxisCount: 5),
                        itemCount: provider.hurdleBoard.length,
                        itemBuilder: (context, index) {
                          final wordle = provider.hurdleBoard[index];
                          return WordleView(wordle:wordle);
                        })),
              ),
            ),
            KeyBoardView(),
            // Placeholder(
            //   fallbackHeight: MediaQuery.of(context).size.height * .3,
            //   fallbackWidth: double.infinity,
            // ),
            Placeholder(
              fallbackHeight: MediaQuery.of(context).size.height * .1,
              fallbackWidth: double.infinity,
            ),
          ],
        ),
      ),
    );
  }
}
