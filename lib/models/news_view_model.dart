import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:news_life/models/categories_news_model.dart';
import 'package:news_life/models/news_channel_headlines_model.dart';
import 'package:news_life/repository/news_repository.dart';

class NewsViewModel {
  final _rep = NewsRepository();

  Future<NewsChannelHeadlinesModels> fetchNewsChannelHeadlinesApi(
      String channelName) async {
    final response = await _rep.fetchNewsChannelHeadlinesApi(channelName);
    return response;
  }

  Future<CategoriesNewsModel> fetchCategoriesNewsApi(String category) async {
    final response = await _rep.fetchCategoriesNewsApi(category);
    return response;
  }
}
