import 'package:flutter/material.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:provider/provider.dart';
import 'package:word_puzzle/hurdle_provider.dart';
import 'Home_Page.dart';
void main() {
  runApp(ChangeNotifierProvider(create: (context) => HurdleProvider(),child: const MyApp()));
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple,brightness: Brightness.dark),
        useMaterial3: true,
      ),
      builder: EasyLoading.init(),
      home: const WordHurdle(),
    );
  }
}

