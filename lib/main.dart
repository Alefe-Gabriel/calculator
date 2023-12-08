import 'package:calculator/dependencies/set_up_get_it.dart';
import 'package:calculator/views/main_view.dart';
import 'package:flutter/material.dart';

void main() {
  setUpGetIt();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData.dark(
        useMaterial3: true,
      ),
      debugShowCheckedModeBanner: false,
      home: const MainView(),
    );
  }
}
