import 'package:flutter/cupertino.dart';
import 'package:news_app/model/news_model.dart';
import 'package:news_app/services/news_services.dart';

class NewsProvider extends ChangeNotifier{
  NewsModel? data;

  Future<void> getNews() async{
    data = await NewsServices.fetchData();
    notifyListeners();
  }
}