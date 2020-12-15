






import 'package:flutter_app_bloc_count/response/todoRepository.dart';

class Repository {
  static final Repository _repository = Repository._();
  Repository._();

  factory Repository() => _repository;

   final TodoRepository todo = TodoRepository();

}