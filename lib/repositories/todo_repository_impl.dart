import 'package:idp_todo_app/models/todo_model.dart';
import 'package:idp_todo_app/repositories/todo_repository.dart';
import 'package:injectable/injectable.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

@Injectable(as: TodoRepository)
class TodoRepositoryImpl implements TodoRepository {
  final http.Client _client;

  TodoRepositoryImpl(this._client);

  @override
  Future<List<TodoModel>> getTodos() async {
    final response = await _client.get(
      Uri.parse('https://jsonplaceholder.typicode.com/todos'),
    );

    if (response.statusCode == 200) {
      final List<dynamic> jsonList = json.decode(response.body);
      return jsonList.map((json) => TodoModel.fromJson(json)).toList();
    } else {
      throw Exception('Failed to load todos');
    }
  }
}
