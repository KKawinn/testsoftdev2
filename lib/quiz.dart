import 'package:flutter/material.dart';

class QuizPage extends StatefulWidget {
  @override
  _QuizPageState createState() => _QuizPageState();
}

class _QuizPageState extends State<QuizPage> {
  String? selectedAnswer;
  final String correctAnswer = 'Choice 1';
  String? resultText;
  Color con = Color.fromARGB(255, 69,39,160) ;
  String buto = "Submit";
  Color choice1 = Color.fromARGB(255, 255, 255, 255) ;
  Color choice2 = Color.fromARGB(255, 255, 255, 255) ;
  Color choice3 = Color.fromARGB(255, 255, 255, 255) ;
  Color choice4 = Color.fromARGB(255, 255, 255, 255) ;

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
              child: Image.asset('image/bi.png'),
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
                        choice1 = Color.fromARGB( 255, 186,218,255) ;
                        choice2 = Color.fromARGB(255, 255, 255, 255) ;
                        choice3 = Color.fromARGB(255, 255, 255, 255) ;
                        choice4 = Color.fromARGB(255, 255, 255, 255) ;
                      });
                    },
                    colo:choice1 ,
                  ),
                  ChoiceButton(
                    text: 'Choice 2',
                    onSelect: () {
                      setState(() {
                        selectedAnswer = 'Choice 2';
                        choice1 = Color.fromARGB( 255, 255, 255, 255) ;
                        choice2 = Color.fromARGB(255, 186,218,255) ;
                        choice3 = Color.fromARGB(255, 255, 255, 255) ;
                        choice4 = Color.fromARGB(255, 255, 255, 255) ;
                      });
                    },
                    colo: choice2,
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
                        choice1 = Color.fromARGB( 255, 255, 255, 255) ;
                        choice2 = Color.fromARGB(255, 255, 255, 255) ;
                        choice3 = Color.fromARGB(255, 186,218,255) ;
                        choice4 = Color.fromARGB(255, 255, 255, 255) ;
                      });
                    },
                     colo: choice3,
                  ),
                  ChoiceButton(
                    text: 'Choice 4',
                    onSelect: () {
                      setState(() {
                        selectedAnswer = 'Choice 4';
                        choice1 = Color.fromARGB( 255, 255, 255, 255) ;
                        choice2 = Color.fromARGB(255, 255, 255, 255) ;
                        choice3 = Color.fromARGB(255, 255, 255, 255) ;
                        choice4 = Color.fromARGB(255, 186,218,255) ;
                      });
                    },
                    colo: choice4,
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
                    buto = "continue";
              });
            },
            style: ElevatedButton.styleFrom(backgroundColor: con),
            child: Padding(
              padding: const EdgeInsets.symmetric(
                  vertical: 16.0, horizontal: 32.0),
              child: Text(
                buto,
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
  final Color colo ;

  const ChoiceButton({required this.text, required this.onSelect,required this.colo});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: ElevatedButton(
        onPressed: onSelect, // เรียกใช้งานฟังก์ชัน onSelect เมื่อปุ่มถูกกด
        child: Text(text),
        style: ElevatedButton.styleFrom(backgroundColor: colo),
      ),
      
    );
  }
}
