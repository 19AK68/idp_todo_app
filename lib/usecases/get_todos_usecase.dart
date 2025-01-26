import 'package:idp_todo_app/models/todo_model.dart';
import 'package:idp_todo_app/repositories/todo_repository.dart';
import 'package:injectable/injectable.dart';

@injectable
class GetTodosUseCase {
  final TodoRepository _repository;

  GetTodosUseCase(this._repository);

  Future<List<TodoModel>> execute() {
    return _repository.getTodos();
  }
}
