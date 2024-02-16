import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:news_life/models/categories_news_model.dart';
import 'package:news_life/models/news_channel_headlines_model.dart';

class NewsRepository {
  Future<NewsChannelHeadlinesModels> fetchNewsChannelHeadlinesApi(
      String channelName) async {
    String url =
        'https://newsapi.org/v2/top-headlines?sources=${channelName}&apiKey=96ce7194566b46568c8b2e6f0765db94';

    final uri = Uri.parse(url);

    final response = await http.get(uri);
    print(response.body);

    if (response.statusCode == 200) {
      // If the server did return a 200 OK response, then parse the JSON.

      // this is the body content of api which contains all news.
      final body = jsonDecode(response.body);

      return NewsChannelHeadlinesModels.fromJson(body);
    }
    throw Exception("Error");
  }

  Future<CategoriesNewsModel> fetchCategoriesNewsApi(String category) async {
    String url =
        'https://newsapi.org/v2/everything?q=${category}&apiKey=96ce7194566b46568c8b2e6f0765db94';

    final uri = Uri.parse(url);

    final response = await http.get(uri);
    print(response.body);

    if (response.statusCode == 200) {
      // If the server did return a 200 OK response, then parse the JSON.

      // this is the body content of api which contains all news.
      final body = jsonDecode(response.body);

      return CategoriesNewsModel.fromJson(body);
    }
    throw Exception("Error");
  }
}
