import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:injectable/injectable.dart';
import '../models/todo_model.dart';

@injectable
class TodoService {
  final String baseUrl = 'https://jsonplaceholder.typicode.com';

  Future<List<TodoModel>> getTodos() async {
    final response = await http.get(Uri.parse('$baseUrl/todos'));
    
    if (response.statusCode == 200) {
      final List<dynamic> jsonList = json.decode(response.body);
      return jsonList.map((json) => TodoModel.fromJson(json)).toList();
    } else {
      throw Exception('Failed to load todos');
    }
  }
}