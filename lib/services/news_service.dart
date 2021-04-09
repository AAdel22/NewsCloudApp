import 'dart:convert';
import 'package:news_cloud/model/article_model.dart';
import 'package:http/http.dart' as http;
import 'package:news_cloud/model/articles_model.dart';

class NewsApi{
  final String apiKey = '3fe5d71299684d52ab6c50568931d80c';
  Future<List<Article>> fetchArticles() async {
    try {
      http.Response response = await http.get(Uri.parse("https://newsapi.org/v2/top-headlines?country=eg&apiKey=$apiKey"));
      if(response.statusCode == 200){
        String data = response.body;
        var jsonData = jsonDecode(data);
        ArticlesList articles = ArticlesList.fromJson(jsonData);
        List<Article> articleList = articles.articles.map((e) => Article.fromJson(e)).toList();
        return articleList;
      }else{
        print('statusCode = ${response.statusCode}');
      }
    } catch(exp){
      print(exp);
    }

  }
  Future<List<Article>> fetchArticlesByCategory(String category) async {
    try {
      http.Response response = await http.get(Uri.parse("https://newsapi.org/v2/top-headlines?country=eg&category=$category&apiKey=$apiKey"));
      if(response.statusCode == 200){
        String data = response.body;
        var jsonData = jsonDecode(data);
        ArticlesList articles = ArticlesList.fromJson(jsonData);
        List<Article> articleList = articles.articles.map((e) => Article.fromJson(e)).toList();
        return articleList;
      }else{
        print('statusCode = ${response.statusCode}');
      }
    } catch(exp){
      print(exp);
    }

  }
}