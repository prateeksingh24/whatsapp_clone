import 'package:flutter/material.dart';
import 'package:whatsapp_clone/Screens/homeScreen.dart';

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
      title: 'Flutter Demo',
      theme: ThemeData(
        primaryColor: Color(0xFF075E54),
        colorScheme: ColorScheme.fromSeed(seedColor: Color(0xFF128C7E)),
        fontFamily: "OpenSans",
        useMaterial3: false,
      ),
      home: const HomeScreen(),
    );
  }
}

