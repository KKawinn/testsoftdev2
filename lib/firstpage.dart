import 'package:flutter/material.dart';

class Firstpage extends StatefulWidget {
  const Firstpage({super.key});
  @override
  State<Firstpage> createState() => _Firstpage();
}

class _Firstpage extends State<Firstpage> {
  int num1 = 1;
  int num2 = 2;
  int num3 = 3;
  void _calculate_m() {}
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color.fromARGB(255, 213, 229, 242),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: <Widget>[
            Column(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [Image.asset("image/p.png")]),
            Text("เลือกเนื้อหาที่ต้องการเรียน"),
            Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: <Widget>[
                  FloatingActionButton.extended(
                    onPressed: () {
                      Navigator.pushNamed(context, '/second', arguments: num1);
                    },
                    label: const Text("พยัชนะ"),
                  ),
                  FloatingActionButton.extended(
                    onPressed: () {
                      Navigator.pushNamed(context, '/second', arguments: num2);
                    },
                    label: const Text("สระ"),
                  )
                ]),
            Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: <Widget>[
                  FloatingActionButton.extended(
                    onPressed: () {
                      Navigator.pushNamed(context, '/payokpange',
                          arguments: num3);
                    },
                    label: const Text("ประโยค"),
                  ),
                  FloatingActionButton.extended(
                    onPressed: () {
                      Navigator.pushNamed(context, '/flashcard',
                          arguments: num2);
                    },
                    label: const Text("คำศัพท์"),
                  )
                ])
          ],
        ),
      ),
    );
  }
}
