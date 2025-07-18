import 'package:flutter/material.dart';
import 'package:flutter_application_2/config/theme/app_theme.dart';
import 'package:flutter_application_2/views/screens/chat_screen.dart';

void main() => runApp(const MyApp());

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Yes No App',
      theme: AppTheme(selectedColor: 0).theme(),
      home: ChatScreen()
    );
  }
}