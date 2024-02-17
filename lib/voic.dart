import 'package:flutter/material.dart';

class voic extends StatefulWidget {
  @override
  State<voic> createState() => _QuizPageState();
}

class _QuizPageState extends State<voic> {
  String? selectedAnswer;
  final String correctAnswer = 'Choice 1';
  String? resultText;
  Color con = Color.fromARGB(255, 69,39,160) ;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Color.fromARGB(255, 69,39,160),
        title: Text('Quiz',style: TextStyle(color: Color.fromARGB(255, 255, 255, 255)),),
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
              child: Image.asset('image/voic.png'),
            ),
          ),
          Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text("รูปภาพที่เห็นนี้คืออะไร"),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
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
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
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
      child: Column(
        mainAxisSize: MainAxisSize.min, // ใช้ MainAxisSize.min เพื่อปรับให้ Column มีขนาดเล็กที่สุดเท่าที่จำเป็น
        children: [
          if (resultText != null)
            Text(
              resultText!,
              style: TextStyle(fontSize: 18.0),
            ),
          ElevatedButton(
            onPressed: () {
              setState(() {
                resultText =
                    selectedAnswer == correctAnswer ? 'ถูกต้อง' : 'ผิด';
                    con = selectedAnswer== correctAnswer ?  Color.fromARGB(255, 0, 255, 0) : Color.fromARGB(255, 255, 0, 0);
              });
            },
            style: ElevatedButton.styleFrom(backgroundColor: con),
            child: Padding(
              padding: const EdgeInsets.symmetric(
                  vertical: 16.0, horizontal: 32.0),
              child: Text(
                'Submit',
                style: TextStyle(fontSize: 18.0, color: Color.fromARGB(255, 255, 255, 255)),
              ),
            ),
          ),
        ],
      ),
    ),
  ),
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
