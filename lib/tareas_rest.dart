import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class TareasRest extends StatefulWidget {
  const TareasRest({super.key});

  @override
  State<TareasRest> createState() => _TareasRestState();
}

class _TareasRestState extends State<TareasRest> {
  List tasks = [];

  Future<void> getTasks() async {
    try {
      final url = Uri.parse('https://jsonplaceholder.typicode.com/todos');
      final response = await http.get(url);
      if (response.statusCode == 200) {
        final data = jsonDecode(response.body);
        setState(() {
          tasks = data.take(10).toList();
        });
      } else {
        print(response.statusCode);
      }
    } catch (e) {
      print('ocurrio un error: $e');
    }
  }

  @override
  void initState() {
    super.initState();
    getTasks();
  }

  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Tareas REST')),
      body: ListView.builder(
        itemCount: tasks.length,
        itemBuilder: (context, index) {
          final task = tasks[index];
          return ListTile(
            title: Text(task['title']),
            leading: Icon(
              task['completed'] ? Icons.check : Icons.close,
              color: task['completed'] ? Colors.green : Colors.red,
            ),
          );
        },
      ),
    );
  }
}
