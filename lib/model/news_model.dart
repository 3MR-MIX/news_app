class NewsModel{
  List<dynamic> news;

  NewsModel({required this.news});
  factory NewsModel.fromjson(Map<String,dynamic>json){
    return NewsModel(news: json['articles']);
  }
}
