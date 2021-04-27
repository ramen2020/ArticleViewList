import 'package:qiita_client/models/article.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

class ArticleApiProvider {
  String url = 'https://qiita.com/api/v2/items';

  Future<List<Article>> fetchArticlesByTag(String tag) async {
    final response = await http.get(url + '?query=title%3A' + tag);
    final List<dynamic> jsonArray = jsonDecode(response.body);

    if (response.statusCode == 200) {
      return jsonArray.map((json) => Article.fromJson(json)).toList();
    } else {
      throw Exception('response時にエラーが帰ってきました');
    }
  }
}
