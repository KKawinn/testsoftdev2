import 'package:flutter/material.dart';

class Aboutpage extends StatefulWidget {
  const Aboutpage({super.key});
  @override
  State<Aboutpage> createState() => _Aboutpage();
}

class _Aboutpage extends State<Aboutpage> {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color.fromARGB(255, 213, 229, 242),
      appBar: AppBar(
        title: Text('About page'),
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
           
            Text(
              "W16-2",
              style: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.bold,
                color: Color.fromARGB(255, 5, 5, 5),
                letterSpacing: 1.2,
              ),
            ),
            
          ],
        ),
      ),
    );
  }
}
