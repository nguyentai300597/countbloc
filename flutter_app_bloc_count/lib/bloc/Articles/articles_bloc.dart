

import 'package:flutter_app_bloc_count/bloc/Articles/articles_event.dart';
import 'package:flutter_app_bloc_count/bloc/Articles/articles_state.dart';
import 'package:flutter_app_bloc_count/model/Articles.dart';
import 'package:flutter_app_bloc_count/response/article_repository.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class articlesbloc extends Bloc<articlesevent,articlesstate>{

  ArticleRepository articleRepositor;
  @override
  // TODO: implement initialState
  articlesstate get initialState =>Initsate();

  @override
  Stream<articlesstate> mapEventToState(articlesevent event) async*{
   if(event is fetchdata)
     {
       yield loadingstate();
       try{
         List<Articles> articles = await articleRepositor.getArticles();
         yield sucess(articles);
       }
       catch(e){
         print(e.toString());

       }
     }

  }

}