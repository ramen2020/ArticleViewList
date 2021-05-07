import 'package:qiita_client/models/article.dart';
import 'package:meta/meta.dart';

abstract class ArticleState {}

// はじめ
class ArticleUninitializedState extends ArticleState {}

// tagをクリックした時
class ArticleFetchingState extends ArticleState {}

// 取得できた時
class ArticleFetchedState extends ArticleState {
  final List<Article> articles;

  ArticleFetchedState({this.articles});
}

// エラー
class ArticleErrorState extends ArticleState {}

// いない
class ArticleEmptyState extends ArticleState {}
