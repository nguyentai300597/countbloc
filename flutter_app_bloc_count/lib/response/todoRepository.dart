


import 'package:flutter_app_bloc_count/model/Post.dart';
import 'package:flutter_app_bloc_count/provider/todoProvider.dart';

class TodoRepository {
  final TodoProvider todoProvider = TodoProvider();

  Future<List<Post>>fetchDataTodo() => todoProvider.getListTodo();
}