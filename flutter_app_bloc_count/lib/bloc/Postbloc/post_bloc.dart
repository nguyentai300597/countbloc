

import 'package:flutter_app_bloc_count/bloc/Postbloc/post_event.dart';
import 'package:flutter_app_bloc_count/bloc/Postbloc/post_state.dart';
import 'package:flutter_app_bloc_count/model/Post.dart';
import 'package:flutter_app_bloc_count/response/todoRepository.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class  blocpost extends Bloc<postevent,poststate>{
  List<Post>dspost;
  final TodoRepository todoRepository=TodoRepository();
  @override
  // TODO: implement initialState
  poststate get initialState => initsate();

  @override
  Stream<poststate> mapEventToState(postevent event)async* {
   if(event is getdata)
     yield loading();
      dspost=todoRepository.fetchDataTodo() as List<Post>;
      print("da nhan");
      yield success(dspost);
  }
}