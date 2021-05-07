import 'package:qiita_client/models/article_tag.dart';
import 'package:meta/meta.dart';

abstract class ArticleEvent {}

class ArticleTagSelectedEvent extends ArticleEvent {
  final ArticleTagModel articleTagModel;

  ArticleTagSelectedEvent({@required this.articleTagModel});
}

class SearchTextEvent extends ArticleEvent {
 final String searchWord;

 SearchTextEvent({this.searchWord});
}
