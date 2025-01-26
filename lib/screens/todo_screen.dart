import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:idp_todo_app/injection.dart';
import 'package:idp_todo_app/models/todo_model.dart';

import 'package:idp_todo_app/usecases/get_todos_usecase.dart';

class TodoScreen extends StatefulWidget {
  const TodoScreen({super.key});

  @override
  State<TodoScreen> createState() => _TodoScreenState();
}

class _TodoScreenState extends State<TodoScreen> {
  final GetTodosUseCase _getTodosUseCase = getIt<GetTodosUseCase>();
  List<TodoModel> _todos = [];
  bool _isLoading = false;

  @override
  void initState() {
    super.initState();
    _loadTodos();
  }

  Future<void> _loadTodos() async {
    setState(() {
      _isLoading = true;
    });

    try {
      final todos = await _getTodosUseCase.execute();
      setState(() {
        _todos = todos;
      });
    } catch (e) {
      if (kDebugMode) {
        print('Error loading todos: $e');
      } // Зам
    } finally {
      setState(() {
        _isLoading = false;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Todo List'),
      ),
      body: _isLoading
          ? Center(child: CircularProgressIndicator())
          : ListView.builder(
              itemCount: _todos.length,
              itemBuilder: (context, index) {
                final todo = _todos[index];
                return ListTile(
                  leading: Checkbox(
                    value: todo.completed,
                    onChanged: null,
                  ),
                  title: Text(todo.title),
                );
              },
            ),
    );
  }
}
