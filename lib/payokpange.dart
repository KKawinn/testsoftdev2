import 'package:flutter/material.dart';

class payokpang extends StatefulWidget {
  const payokpang({super.key});
  @override
  State<payokpang> createState() => _Firstpage();
}

class _Firstpage extends State<payokpang> {
  int num1 = 1 ;
  int num2 = 2 ;
  int num3 =3 ;
  void _calculate_m() {}
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color.fromARGB(255, 213, 229, 242),
      appBar: AppBar(
        backgroundColor: Color.fromARGB(255, 213, 229, 242),
        title: Text('เลือกวิธีที่ต้องการเรียน'),
        leading: IconButton(
          icon: Icon(Icons.arrow_back),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
      ),
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
                      Navigator.pushNamed(context, '/sentence',arguments: num1);
                    
                    },
                    label: const Text("เรียงประโยค"),
                  ),
                  FloatingActionButton.extended(
                    onPressed: (){
                      Navigator.pushNamed(context, '/voic_payok',arguments: num2);
                      
                    },
                    label: const Text("ฟังประโยค"),
                  )
                ]),
          ],
        ),
      ),
    );
  }
}
