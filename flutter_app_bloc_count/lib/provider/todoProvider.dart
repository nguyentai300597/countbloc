


import 'package:dio/dio.dart';
import 'package:flutter_app_bloc_count/model/Post.dart';

class TodoProvider {
  var dio = Dio();

  Future<List<Post>> getListTodo() async {
    List<Post> todoList = List();
    String url = 'https://jsonplaceholder.typicode.com/posts';
    var result = await dio.get(url);
    print(result.data);
    print('voo');
    List todo = result.data;
    todoList = todo.map((e) => Post.fromJson(e)).toList();
    return todoList;
  }
}