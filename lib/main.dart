import 'package:flutter/material.dart';

import 'screens/input_page.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData.dark().copyWith(
        appBarTheme: const AppBarTheme(
          backgroundColor: Color(0xff1d1f33),
        ),
        scaffoldBackgroundColor: const Color(0xff1d1f33),
      ),
      home: const InputPage(),
    );
  }
}
