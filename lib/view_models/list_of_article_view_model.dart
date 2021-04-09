
import 'package:flutter/material.dart';
import 'package:news_cloud/model/article_model.dart';
import 'package:news_cloud/services/news_service.dart';

class ArticlesListViewModel extends ChangeNotifier {
  List<Article> _articlesList = [];
  List<Article> _articleListByCategory = [];

  Future<void> fetchArticles() async {
    _articlesList = await NewsApi().fetchArticles();
    notifyListeners();
  }
  Future<void> fetchArticlesByCategory(String category) async {
    _articleListByCategory = await NewsApi().fetchArticlesByCategory(category);
    notifyListeners();
  }

  List<Article> get articlesList => _articlesList;
  List<Article> get articlesListByCategory => _articleListByCategory;
}