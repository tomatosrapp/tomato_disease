import 'package:Tomatect/screens/loading.dart';
import 'package:Tomatect/screens/onboarding_screen.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Tomato Plant Disease Detection',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: LoadingScreen(),
      routes: {
        '/other_page': (context) => OnboardingScreen(),
      },
    );
  }
}
