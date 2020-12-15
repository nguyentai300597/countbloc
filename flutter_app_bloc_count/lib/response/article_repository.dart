

import 'dart:convert';

import 'package:dio/dio.dart';
import 'package:flutter_app_bloc_count/api/server.dart';
import 'package:flutter_app_bloc_count/model/Articles.dart';
import 'package:http/http.dart' as http;

abstract class ArticleRepository {
  Future<List<Articles>> getArticles();
}

class ArticleRepositoryImpl implements ArticleRepository {
  final dio= Dio();

  @override
  Future<List<Articles>> getArticles() async {
    var response = await http.get(AppStrings.cricArticleUrl);
    if (response.statusCode == 200) {
      var data = json.decode(response.body);
      List<Articles> articles = ApiResultModel.fromJson(data).articles;
      return articles;
    } else {
      throw Exception();
    }
  }

}