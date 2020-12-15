

import 'package:equatable/equatable.dart';
import 'package:flutter_app_bloc_count/model/Articles.dart';

abstract class articlesstate extends Equatable{}
class Initsate extends articlesstate{
  @override
  // TODO: implement props
  List<Object> get props => throw UnimplementedError();
}
class loadingstate extends articlesstate{
  @override
  // TODO: implement props
  List<Object> get props => throw UnimplementedError();

}
class sucess extends articlesstate{
  List<Articles> articles;
  sucess(this.articles);
  @override
  // TODO: implement props
  List<Object> get props => [articles];
}
class errorstate extends articlesstate{
  String messs;
  errorstate({this.messs});

  @override
  // TODO: implement props
  List<Object> get props => [messs];

}