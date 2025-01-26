import 'package:idp_todo_app/models/todo_model.dart';

abstract class TodoRepository {
  Future<List<TodoModel>> getTodos();
}
