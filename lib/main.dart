import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: "Belajar Flutter PPLG 3",
      home: const Scaffold(
        body: Center(
          child: Text("Belajar Flutter PPLG 3"),
        ),
      ),
    );
  }
}