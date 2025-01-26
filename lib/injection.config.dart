// dart format width=80
// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// InjectableConfigGenerator
// **************************************************************************

// ignore_for_file: type=lint
// coverage:ignore-file

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:get_it/get_it.dart' as _i174;
import 'package:http/http.dart' as _i519;
import 'package:idp_todo_app/injection.dart' as _i230;
import 'package:idp_todo_app/repositories/todo_repository.dart' as _i526;
import 'package:idp_todo_app/repositories/todo_repository_impl.dart' as _i182;
import 'package:idp_todo_app/services/todo_service.dart' as _i589;
import 'package:idp_todo_app/usecases/get_todos_usecase.dart' as _i452;
import 'package:injectable/injectable.dart' as _i526;

extension GetItInjectableX on _i174.GetIt {
// initializes the registration of main-scope dependencies inside of GetIt
  _i174.GetIt init({
    String? environment,
    _i526.EnvironmentFilter? environmentFilter,
  }) {
    final gh = _i526.GetItHelper(
      this,
      environment,
      environmentFilter,
    );
    final registerModule = _$RegisterModule();
    gh.factory<_i519.Client>(() => registerModule.httpClient);
    gh.factory<_i589.TodoService>(() => _i589.TodoService());
    gh.factory<_i526.TodoRepository>(
        () => _i182.TodoRepositoryImpl(gh<_i519.Client>()));
    gh.factory<_i452.GetTodosUseCase>(
        () => _i452.GetTodosUseCase(gh<_i526.TodoRepository>()));
    return this;
  }
}

class _$RegisterModule extends _i230.RegisterModule {}
