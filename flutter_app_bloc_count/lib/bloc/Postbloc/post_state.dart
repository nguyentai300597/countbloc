
import 'package:equatable/equatable.dart';
import 'package:flutter_app_bloc_count/model/Post.dart';

abstract class poststate extends Equatable{}

class initsate extends poststate{
  @override
  // TODO: implement props
  List<Object> get props => throw UnimplementedError();
}
class success extends poststate{
 final List<Post> dspost;
 success(this.dspost);


  @override
  // TODO: implement props
  List<Object> get props => throw UnimplementedError();

}
class loading extends poststate{
  @override
  // TODO: implement props
  List<Object> get props => throw UnimplementedError();
}
class error extends poststate{
  @override
  // TODO: implement props
  List<Object> get props => throw UnimplementedError();
}