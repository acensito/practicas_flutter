import 'package:flutter/material.dart';

class CounterScreen extends StatefulWidget {
  
  const CounterScreen({super.key});

  @override
  State<CounterScreen> createState() => _CounterScreenState();
}

class _CounterScreenState extends State<CounterScreen> {

  int counter = 0;
  String click = 'Click';
  final String title = 'Contador de clics';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Center(
          child: Text(title)
        ),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text('$counter', 
              style: TextStyle(
                fontSize: 160,
                fontWeight: FontWeight.w100),
            ),

            Text('Click${ counter == 1 ? '' : 's' }', 
              style: TextStyle(fontSize: 25),
            )
          ],
        ),

      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          setState(() {
            counter++;
          });
        },
        child: Icon(Icons.plus_one),
      ),
    );
  }
}