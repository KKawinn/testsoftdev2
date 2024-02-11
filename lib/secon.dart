import 'package:flutter/material.dart';

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
        colorScheme: ColorScheme.fromSeed(seedColor: Color.fromARGB(255, 130, 208, 242)),
        useMaterial3: true,
      ),
      home: const MyHomePage(title: 'Flutter Demo Home Page'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});



  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  double result = 0;
  String pb = "";
  double x = 2;
  double count = 0;
  TextEditingController number1 =  TextEditingController();
  TextEditingController number2 =  TextEditingController();

  void _calculate_p(){
    setState(() {
      result = double.parse(number1.text)+ double.parse(number2.text);
    });
  }
  void _calculat(){
    while ( x<result) {
      if (result%x == 0){
        count++;
      }
    x++;
    }
    setState(() {
      if (count == 0){
        pb = "เป็นจำนวนฉะเพราะ";
      }else{
        pb = "ไม่เป็นจำนวนฉะเพราะ";
      }
    });
    x = 2;
    count = 0;
  }
  
  void _calculate_m(){
    setState(() {
      result = double.parse(number1.text)- double.parse(number2.text);
    });
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(backgroundColor: Color.fromARGB(255, 213,229,242),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: <Widget>[
              Column(mainAxisAlignment: MainAxisAlignment.spaceBetween,children:[
              
            Image.asset("image/p.png")
            ]),
            
            Text("เลือกเนื้อหาที่ต้องการเรียน"
            ),
            Row(mainAxisAlignment: MainAxisAlignment.spaceEvenly,children: <Widget>[
            
            FloatingActionButton.extended(onPressed:_calculate_m
            ,label: const Text("พยัชนะ"),),

            FloatingActionButton.extended(onPressed:_calculat
            ,label: const Text("สระ"),)])
            
            ,Row(mainAxisAlignment: MainAxisAlignment.spaceEvenly,children: <Widget>[

            FloatingActionButton.extended(
              onPressed:_calculat
            ,label: const Text("ประโยค"),)])
            
          ],
        ),
      ),
    );
    
  }
}