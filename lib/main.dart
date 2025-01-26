import 'package:flutter/material.dart';
import 'injection.dart';
import 'screens/todo_screen.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  configureDependencies();
  runApp(IDPTODOApp());
}

class IDPTODOApp extends StatelessWidget {
  const IDPTODOApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'IDP Todo App',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.blue),
      ),
      home: TodoScreen(),
    );
  }
}
