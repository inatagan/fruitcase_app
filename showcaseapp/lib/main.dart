import 'package:flutter/material.dart';
import 'package:showcaseapp/viewmodels/welcome.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Fruit Basket',
      theme: ThemeData(
        fontFamily: 'Mapple Mono NF',
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.amberAccent),
      ),
      home: Welcome(),
    );
  }
}
