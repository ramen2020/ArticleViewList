import 'package:qiita_client/models/article.dart';
import 'package:qiita_client/services/article_api_provider.dart';

class ArticleRepository {
  ArticleApiProvider _articleApiProvider = ArticleApiProvider();

  Future<List<Article>> fetchArticlesByTag(String tagName) =>
      _articleApiProvider.fetchArticlesByTag(tagName);

 Future<List<Article>> fetchArticlesByTitle(String text) =>
      _articleApiProvider.fetchArticlesByTitle(text);
}
