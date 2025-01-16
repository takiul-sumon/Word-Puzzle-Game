import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
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
      body: Column(
        children: [
          Placeholder(
            fallbackHeight: MediaQuery.of(context).size.height * .6,
            fallbackWidth: double.infinity,
            child: Padding(
              padding: const EdgeInsets.all(64.0),
              child: GridView.count(
                mainAxisSpacing: 10,
                crossAxisSpacing: 10,
                crossAxisCount: 5,
                children: List.generate(
                  30,
                  (index) {
                    return Container(
                      child: CircleAvatar(),
                    );
                  },
                ),
              ),
            ),
          ),
          Placeholder(
            fallbackHeight: MediaQuery.of(context).size.height * .3,
            fallbackWidth: double.infinity,
          ),
          Placeholder(
            fallbackHeight: MediaQuery.of(context).size.height * .1,
            fallbackWidth: double.infinity,
          ),
        ],
      ),
    );
  }
}
