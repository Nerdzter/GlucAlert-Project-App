import 'package:flutter/material.dart';
import 'screens/home_screen.dart';

void main() {
  runApp(const GlucAlertApp());
}

class GlucAlertApp extends StatelessWidget {
  const GlucAlertApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'GlucAlert',
      theme: ThemeData(
        fontFamily: 'SF Pro Text',
        scaffoldBackgroundColor: const Color(0xFFF2F2F7),
        textTheme: const TextTheme(
          titleLarge: TextStyle(
            color: Color(0xFF1C1C1E),
            fontSize: 24,
            fontWeight: FontWeight.bold,
          ),
          bodyMedium: TextStyle(
            color: Color(0xFF1C1C1E),
            fontSize: 16,
          ),
        ),
      ),
      home: HomeScreen(),
    );
  }
}
