import 'package:flutter/material.dart';
import 'package:flutter_application_1/login_page.dart';
import 'package:flutter_application_1/kendaraan.dart'; // Import halaman baru

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(
          seedColor: Colors.blueGrey, 
          primary: Colors.blueGrey[800], 
          secondary: Colors.grey[600], 
        ),
        appBarTheme: AppBarTheme(
          backgroundColor: Colors.blueGrey[900], 
          foregroundColor: Colors.white, 
        ),
        scaffoldBackgroundColor: Colors.white, 
        useMaterial3: true,
      ),
      home: const LoginPage(), // Tampilkan halaman login
    );
  }
}
