import 'package:flutter/material.dart';
// لاحظي هنا غيرنا المسار لأن الملف دخل داخل مجلد screens
import 'screens/habit_screen.dart';

void main() {
  runApp(const FlowWizeApp());
}

class FlowWizeApp extends StatelessWidget {
  const FlowWizeApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'FlowWize',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        brightness: Brightness.dark,
        primaryColor: const Color(0xFFA020F0), // Hot Purple
        scaffoldBackgroundColor: const Color(0xFF0F0C29), // Midnight
      ),
      home: const HabitScreen(),
    );
  }
}
