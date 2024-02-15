import 'package:flutter/material.dart';

class QuizPage extends StatefulWidget {
  @override
  _QuizPageState createState() => _QuizPageState();
}

class _QuizPageState extends State<QuizPage> {
  String? selectedAnswer;
  final String correctAnswer = 'Choice 1';
  String? resultText;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Quiz'),
        leading: IconButton(
          icon: Icon(Icons.arrow_back),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
      ),
      body: Column(
        children: [
          Expanded(
            child: Center(
              child: Image.asset('image/bi.png'),
            ),
          ),
          Column(
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  ChoiceButton(
                    text: 'Choice 1',
                    onSelect: () {
                      setState(() {
                        selectedAnswer = 'Choice 1';
                      });
                    },
                  ),
                  ChoiceButton(
                    text: 'Choice 2',
                    onSelect: () {
                      setState(() {
                        selectedAnswer = 'Choice 2';
                      });
                    },
                  ),
                ],
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  ChoiceButton(
                    text: 'Choice 3',
                    onSelect: () {
                      setState(() {
                        selectedAnswer = 'Choice 3';
                      });
                    },
                  ),
                  ChoiceButton(
                    text: 'Choice 4',
                    onSelect: () {
                      setState(() {
                        selectedAnswer = 'Choice 4';
                      });
                    },
                  ),
                ],
              ),
            ],
          ),
          Expanded(
            child: Align(
              alignment: Alignment.bottomCenter,
              child: Padding(
                padding: const EdgeInsets.all(16.0),
                child: ElevatedButton(
                  onPressed: () {
                    setState(() {
                      resultText =
                          selectedAnswer == correctAnswer ? 'ถูกต้อง' : 'ผิด';
                    });
                  },
                  child: Padding(
                    padding: const EdgeInsets.symmetric(
                        vertical: 16.0, horizontal: 32.0),
                    child: Text(
                      'Submit',
                      style: TextStyle(fontSize: 18.0),
                    ),
                  ),
                ),
              ),
            ),
          ),
          if (resultText != null)
            Text(
              resultText!,
              style: TextStyle(fontSize: 18.0),
            ),
        ],
      ),
    );
  }
}

class ChoiceButton extends StatelessWidget {
  final String text;
  final VoidCallback onSelect; // เพิ่มพารามิเตอร์ onSelect แบบ VoidCallback

  const ChoiceButton({required this.text, required this.onSelect});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: ElevatedButton(
        onPressed: onSelect, // เรียกใช้งานฟังก์ชัน onSelect เมื่อปุ่มถูกกด
        child: Text(text),
      ),
    );
  }
}
