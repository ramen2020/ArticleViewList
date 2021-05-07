import 'package:qiita_client/models/article.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

class ArticleApiProvider {
  String url = 'https://qiita.com/api/v2/items';

  Future<List<Article>> fetchArticlesByTag(String tag) async {
    final response = await http.get('${url}?query=tag%3A${tag}');
    final List<dynamic> jsonArray = jsonDecode(response.body);

    if (response.statusCode == 200) {
      return jsonArray.map((json) => Article.fromJson(json)).toList();
    } else {
      throw Exception('response時にエラーが帰ってきました');
    }
  }

  Future<List<Article>> fetchArticlesByTitle(String text) async {
    String moldingSearchText = text.replaceAll('　', ' ');
    List searchTextList = moldingSearchText.split(' ');
    String searchQuery;

    searchTextList.forEach((searchText) {
      if (searchTextList.indexOf(searchText) == 0) {
        searchQuery = '?query=title%3A${searchText}';
      } else {
        searchQuery = '${searchQuery}+title%3A${searchText}';
      }
    });

    final response = await http.get(url + searchQuery);
    final List<dynamic> jsonArray = jsonDecode(response.body);

    if (response.statusCode == 200) {
      return jsonArray.map((json) => Article.fromJson(json)).toList();
    } else {
      throw Exception('response時にエラーが帰ってきました');
    }
  }

  Future<List<Article>> fetchArticlesByDetailSearch(List searchData) async {
    final response = await http.get(url + '?query=tag%3A' + null);
    final List<dynamic> jsonArray = jsonDecode(response.body);

    if (response.statusCode == 200) {
      return jsonArray.map((json) => Article.fromJson(json)).toList();
    } else {
      throw Exception('response時にエラーが帰ってきました');
    }
  }
}
