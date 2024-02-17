import 'package:flutter/material.dart';
import 'firstpage.dart';
import 'secon.dart';
import 'quiz.dart';
import 'voic.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        colorScheme:
            ColorScheme.fromSeed(seedColor: Color.fromARGB(255, 130, 208, 242)),
        useMaterial3: true,
      ),
      home: const Firstpage(),
      routes: {
        '/second': (context) => const Second(),
        '/first': (context) => const Firstpage(),
        '/quiz': (context) => QuizPage(),
        '/voic': (context) => voic(),

      },
    );
  }
}
