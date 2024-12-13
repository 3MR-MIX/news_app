import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:news_app/model/news_model.dart';
import 'package:news_app/provider/news_provider.dart';
import 'package:news_app/weidgt/news_item.dart';
import 'package:provider/provider.dart';

class NewsScreen extends StatelessWidget {
  const NewsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "News",
          style: TextStyle(color: Colors. blueAccent),
        ),
        centerTitle: true,
      ),
      body: Consumer<NewsProvider>(builder: (context,value,child) {
        var newsModel = value.data;
        if(newsModel == null){
          value.getNews();
          return Center(
            child: CircularProgressIndicator(),
          );
        }else{
          return ListView.separated(
            itemBuilder: (context,index) => NewsItem(
                image:newsModel.news[index]["urlToImage"],
                title: newsModel.news[index]["title"],
                description: newsModel.news[index]["description"],
            ),
            separatorBuilder: (context,index)=> const SizedBox(
              height: 10,
            ),
            itemCount: newsModel.news.length,
          );
        }
      }),
      );
  }
}
