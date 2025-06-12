import 'package:flutter/material.dart';

class CounterFunctionsScreen extends StatefulWidget {
  const CounterFunctionsScreen({super.key});

  @override
  State<CounterFunctionsScreen> createState() => _CounterFunctionsScreenState();
}

class _CounterFunctionsScreenState extends State<CounterFunctionsScreen> {
  int counter = 0;
  String click = 'Click';
  final String title = 'Contador Functions';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Center(child: Text(title)),
        actions: [
          IconButton(
            onPressed: () {
              setState(() {
                counter = 0;
              });
            },
            icon: Icon(Icons.refresh_rounded),
          ),
        ],
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              '$counter',
              style: TextStyle(fontSize: 160, fontWeight: FontWeight.w100),
            ),

            Text(
              'Click${counter == 1 ? '' : 's'}',
              style: TextStyle(fontSize: 25),
            ),
          ],
        ),
      ),
      floatingActionButton: Column(
        mainAxisAlignment: MainAxisAlignment.end,
        children: [
          CustomFloatingButton(
            icon: Icons.plus_one,
            onPressed: () {
              setState(() {
                counter++;
              });
            },
          ),
          SizedBox(height: 10),
          CustomFloatingButton(
            icon: Icons.refresh,
            onPressed: () {
              setState(() {
                counter = 0;
              });
            },
          ),
          SizedBox(height: 10),
          CustomFloatingButton(
            icon: Icons.exposure_minus_1,
            onPressed: () {
              setState(() {
                counter--;
              });
            },
          ),
        ],
      ),
    );
  }
}

class CustomFloatingButton extends StatelessWidget {
  final IconData icon;
  final VoidCallback? onPressed;

  const CustomFloatingButton({super.key, required this.icon, this.onPressed});

  @override
  Widget build(BuildContext context) {
    return FloatingActionButton(
      shape: StadiumBorder(),
      onPressed: onPressed,
      child: Icon(icon),
    );
  }
}
