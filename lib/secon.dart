import 'package:flutter/material.dart';

class Second extends StatefulWidget {
  const Second({Key? key}) : super(key: key);
  @override
  State<Second> createState() => _SecondState();
}

class _SecondState extends State<Second> {
  void _calculate_m() {}
  @override
  Widget build(BuildContext context) {

    final dolp = ModalRoute.of(context)?.settings.arguments as int;
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
              children: [
                Image.asset("image/2ndimage.png"),
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: <Widget>[
                FloatingActionButton.extended(
                  onPressed: () {
                    Navigator.pushNamed(context, '/quiz');
                  },
                  label: const Text("Pic Quiz"),
                ),
                FloatingActionButton.extended(
                  onPressed: () {
                    if(dolp == 1){Navigator.pushNamed(context, '/voic');}
                    else{Navigator.pushNamed(context, '/voic_sara');}
                  },
                  label: const Text("Listen Quiz"),
                ),
                FloatingActionButton.extended(
                  onPressed: () {
                    if(dolp == 1){Navigator.pushNamed(context, '/voic_payok');}
                    else{Navigator.pushNamed(context, '/voic_payok');}
                  },
                  label: const Text("Listen payok"),
                )
              ],
            ),
          ],
        ),
      ),
    );
  }
}
