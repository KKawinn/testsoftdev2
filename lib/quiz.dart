import 'package:flutter/material.dart';

class QuizPage extends StatefulWidget {
  @override
  _QuizPageState createState() => _QuizPageState();
}

class _QuizPageState extends State<QuizPage> {
  int _questionIndex = 0;
  int _totalScore = 0;
  String? selectedAnswer;
  int choice = 0 ;

final List<Map<String, Object>> _questions = [
    {
      'pic': 'image/bi.png',
      'answers': [
        {'text': 'จักยาน', 'score': 1},
        {'text': 'regdrg', 'score': 0},
        {'text': 'gdrg', 'score': 0},
        {'text': 'drgr', 'score': 0},
      ],
    },
    {
      'pic': 'image/des.png',
      'answers': [
        {'text': '4', 'score': 0},
        {'text': 'คนคิด', 'score': 1},
        {'text': '8', 'score': 0},
        {'text': '10', 'score': 0},
      ],
    },
    // Add more questions here...
  ];


void _answerQuestion(int score) {
    setState(() {
      _totalScore += score;
      _questionIndex++;
      selectedAnswer = null; // Reset selected answer
    });
  }

  void _restartQuiz() {
    setState(() {
      _questionIndex = 0;
      _totalScore = 0;
      selectedAnswer = null; // Reset selected answer
    });
  }

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
      body:  _questionIndex < _questions.length
          ? Quiz(
              questionIndex: _questionIndex,
              questions: _questions,
              answerQuestion: _answerQuestion,
              selectedAnswer: selectedAnswer,
              choice: choice,
              onAnswerSelected: (String answer) {
                setState(() {
                  selectedAnswer = answer;
                });
              },
              choiceselect: (int cha){
                setState(() {
                  choice = cha;
                });
              },
            )
          : Result(_totalScore, _questions.length, _restartQuiz),
    );
  }
}

class Quiz extends StatelessWidget {
  
  final String correctAnswer = 'Choice 1';
  String? resultText;
  Color con = Color.fromARGB(255, 69,39,160) ;
  String buto = "Submit";
  
  final int questionIndex;
  final List questions;
  final Function(int) answerQuestion;
  final Function(int) choiceselect;
  final int? choice  ;
  final String? selectedAnswer;
  final void Function(String) onAnswerSelected;
  
  Quiz({
    required this.questionIndex,
    required this.questions,
    required this.answerQuestion,
    required this.selectedAnswer,
    required this.onAnswerSelected,
    required this.choiceselect,
    required this.choice
  });

  @override
  Widget build(BuildContext context) {
    return Column(
        children: [
          Expanded(
            child: Center(
              child: Image.asset(questions[questionIndex]['pic'] as String),
            ),
          ),
          Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text("รูปภาพที่เห็นนี้คืออะไร"),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  ...(questions[questionIndex]['answers'] as List<Map<String, Object>>).sublist(0,1).map((answer) {
                  return ElevatedButton(
                    onPressed: () { 
                      choiceselect(0);
                      onAnswerSelected(answer['text'] as String);},
                    child: Text(answer['text'] as String),
                    style: ButtonStyle(
                      backgroundColor: MaterialStateProperty.resolveWith<Color>((states) {
                        if (selectedAnswer == answer['text']) {
                          return Colors.green; // สีเมื่อปุ่มถูกเลือก
                        } else {
                          return Colors.blue; // สีปกติ
                        }
                      }),
                    ),
                  );
                }).toList(),
                  ...(questions[questionIndex]['answers'] as List<Map<String, Object>>).sublist(1,2).map((answer) {
                  return ElevatedButton(
                    onPressed: () { 
                      choiceselect(1);
                      onAnswerSelected(answer['text'] as String);},
                    child: Text(answer['text'] as String),
                    style: ButtonStyle(
                      backgroundColor: MaterialStateProperty.resolveWith<Color>((states) {
                        if (selectedAnswer == answer['text']) {
                          return Colors.green; // สีเมื่อปุ่มถูกเลือก
                        } else {
                          return Colors.blue; // สีปกติ
                        }
                      }),
                    ),
                  );
                }).toList(),
                ],
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  ...(questions[questionIndex]['answers'] as List<Map<String, Object>>).sublist(2,3).map((answer) {
                  return ElevatedButton(
                    onPressed: () { 
                      choiceselect(2); 
                      onAnswerSelected(answer['text'] as String);},
                    child: Text(answer['text'] as String),
                    style: ButtonStyle(
                      backgroundColor: MaterialStateProperty.resolveWith<Color>((states) {
                        if (selectedAnswer == answer['text']) {
                          return Colors.green; // สีเมื่อปุ่มถูกเลือก
                        } else {
                          return Colors.blue; // สีปกติ
                        }
                      }),
                    ),
                  );
                }).toList(),
                  ...(questions[questionIndex]['answers'] as List<Map<String, Object>>).sublist(3,4).map((answer) {
                  return ElevatedButton(
                    onPressed: () { 
                      choiceselect(3);
                      onAnswerSelected(answer['text'] as String);},
                    child: Text(answer['text'] as String),
                    style: ButtonStyle(
                      backgroundColor: MaterialStateProperty.resolveWith<Color>((states) {
                        if (selectedAnswer == answer['text']) {
                          return Colors.green; // สีเมื่อปุ่มถูกเลือก
                        } else {
                          return Colors.blue; // สีปกติ
                        }
                      }),
                    ),
                  );
                }).toList(),
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
              answerQuestion(questions[questionIndex]['answers'][choice]['score'] as int);
                resultText =
                    selectedAnswer == correctAnswer ? 'ถูกต้อง' : 'ผิด';
                    con = selectedAnswer== correctAnswer ?  Color.fromARGB(255, 0, 255, 0) : Color.fromARGB(255, 255, 0, 0);
                    buto = "continue";
            
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

class Result extends StatelessWidget {
  final int totalScore;
  final int totalQuestions;
  final Function restartQuiz;

  Result(this.totalScore, this.totalQuestions, this.restartQuiz);

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(
            'You have completed the quiz!',
            style: TextStyle(fontSize: 20),
          ),
          Text(
            'Your Score: $totalScore out of $totalQuestions',
            style: TextStyle(fontSize: 18),
          ),
          ElevatedButton(
            onPressed: () => restartQuiz(),
            child: Text('Restart Quiz'),
          ),
        ],
      ),
    );
  }
}
