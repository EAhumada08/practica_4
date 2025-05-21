import 'package:flutter/material.dart';
import 'package:practica_4/tareas_rest.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'REST demo',
      theme: ThemeData(primarySwatch: Colors.blue),
      home: TareasRest(),
    );
  }
}
