import 'package:dio/dio.dart';
import 'package:news_app/model/news_model.dart';

class NewsServices{
  static Dio dio = Dio();

  static Future<NewsModel> fetchData() async{
    try{
      Response response = await dio.get(
          "https://newsapi.org/v2/top-headlines?sources=techcrunch&apiKey=a410b1724f84452c8df8a810efe34642");
      return NewsModel.fromjson(response.data);
    }catch(error){
      throw Exception("Error:$error");
    }
  }
}