import 'package:flutter/material.dart';
import 'package:tugasform/loginform.dart';
import 'data.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      initialRoute: '/',
      routes: {
        '/loginform': (context) => const LoginForm(),
        '/data': (context) => const Data(),
      },
      title: 'Tugas Form APP',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
          colorScheme: ColorScheme.fromSeed(
            seedColor: Color.fromARGB(255, 110, 38, 193),
          ),
          useMaterial3: true),
      home: const LoginForm(),
    );
  }
}
