
import 'package:flutter/material.dart';
import 'package:flutter_app_bloc_count/bloc/Articles/articles_bloc.dart';
import 'package:flutter_app_bloc_count/bloc/Articles/articles_event.dart';
import 'package:flutter_app_bloc_count/bloc/Articles/articles_state.dart';
import 'package:flutter_app_bloc_count/bloc/Postbloc/post_state.dart';
import 'package:flutter_app_bloc_count/model/Articles.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  articlesbloc articleBloc;

  @override
  void initState() {
    super.initState();

    articleBloc = BlocProvider.of<articlesbloc>(context);
    articleBloc.add(fetchdata());
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Builder(
        builder: (context) {
          return Material(
            child: Scaffold(
              appBar: AppBar(
                title: Text("Cricket"),
                actions: <Widget>[
                  IconButton(
                    icon: Icon(Icons.refresh),
                    onPressed: () {
                      articleBloc.add(fetchdata());
                    },
                  ),
                  IconButton(
                    icon: Icon(Icons.info),
                    onPressed: () {
                    //  navigateToAoutPage(context);
                    },
                  )
                ],
              ),
              body: Container(
                child: BlocBuilder<articlesbloc,articlesstate>(
                  builder: (context,state){
                    if(state is sucess)
                     {
                       return buildArticleList(state.articles);
                     }
                    if(state is errorstate)
                      {
                        return Text(state.messs.toString());
                      }
                    else{

                      return CircularProgressIndicator();
                    }

                  },
                )
              ),
            ),
          );
        },
      ),
    );
  }

  Widget buildLoading() {
    return Center(
      child: CircularProgressIndicator(),
    );
  }

  Widget buildErrorUi(String message) {
    return Center(
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Text(
          message,
          style: TextStyle(color: Colors.red),
        ),
      ),
    );
  }

  Widget buildArticleList(List<Articles> articles) {
    return ListView.builder(
      itemCount: articles.length,
      itemBuilder: (ctx, pos) {
        return Padding(
          padding: const EdgeInsets.all(8.0),
          child: InkWell(
            child: ListTile(
              leading: ClipOval(
                child: Hero(
                  tag: articles[pos].urlToImage,
                  child: Image.network(
                    articles[pos].urlToImage,
                    fit: BoxFit.cover,
                    height: 70.0,
                    width: 70.0,
                  ),
                ),
              ),
              title: Text(articles[pos].title),
              subtitle: Text(articles[pos].publishedAt),
            ),
            onTap: () {
             // navigateToArticleDetailPage(context, articles[pos]);
            },
          ),
        );
      },
    );
  }



}
