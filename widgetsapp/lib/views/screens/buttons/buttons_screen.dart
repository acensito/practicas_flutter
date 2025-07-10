import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class ButtonsScreen extends StatelessWidget {
  const ButtonsScreen({super.key});

  static const String routeName = 'buttons';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Buttons screen')),
      body: _ButtonsView(),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          context.pop();
        },
        child: Icon(Icons.arrow_back_ios_new_rounded),
      ),
    );
  }
}

class _ButtonsView extends StatelessWidget {

  @override
  Widget build(BuildContext context) {

    final colors = Theme.of(context).colorScheme;

    return SizedBox(
      width: double.infinity,
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 20),
        child: Wrap(
          spacing: 10,
          alignment: WrapAlignment.center,
          children: [
            ElevatedButton(onPressed: () {}, child: Text('Elevated Button')),
            ElevatedButton(onPressed: null, child: Text('Elevated Disabled')),
            ElevatedButton.icon(onPressed: () {}, icon: Icon(Icons.access_alarm_rounded), label: Text('Elevated Icon')),
            FilledButton(onPressed: () {}, child: Text('Filled Button')),
            FilledButton.icon(onPressed: () {}, icon: Icon(Icons.accessibility_new), label: Text('Filled Icon')),
            OutlinedButton.icon(onPressed: () {}, icon: Icon(Icons.accessibility_new), label: Text('Outlined Icon')),
            TextButton.icon(onPressed: () {}, icon: Icon(Icons.accessibility_new), label: Text('Text Icon')),
            IconButton(onPressed: () {}, icon: Icon(Icons.accessibility_new)),
            IconButton(onPressed: () {}, icon: Icon(Icons.accessibility_new), tooltip: 'Icon Button'),
            IconButton.filled(onPressed: () {}, icon: Icon(Icons.accessibility_new), style: ButtonStyle(
              backgroundColor: WidgetStatePropertyAll(colors.secondary),
            )),
            CustomButton(), 

          ],
        ),
      ),
    );
  }
}

class CustomButton extends StatelessWidget {
  const CustomButton
({super.key});

  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      borderRadius: BorderRadius.circular(20),
      child: Material(
        color: Colors.redAccent,
        child: InkWell(
          onTap: () {},
          child: Padding(
            padding: EdgeInsets.symmetric(horizontal: 20, vertical: 10),
            child: Text('Hola mundo', 
              style: TextStyle(color: Colors.white, fontSize: 20, fontWeight: FontWeight.bold),
          ),
              ),
        )),
    );
  }
}
