import 'package:camera/camera.dart';
import 'package:flutter/material.dart';
import 'package:whatsapp_clone/Screens/CameraScreen.dart';
import 'package:whatsapp_clone/Screens/homeScreen.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  cameras = await availableCameras();
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
