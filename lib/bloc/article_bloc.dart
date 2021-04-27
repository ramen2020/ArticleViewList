import 'package:bloc/bloc.dart';
import 'package:qiita_client/services/repository.dart';
import 'package:qiita_client/bloc/article_events.dart';
import 'package:qiita_client/bloc/article_state.dart';
import 'package:qiita_client/models/article.dart';

class ArticleBloc extends Bloc<ArticleEvent, ArticleState> {
  final ArticleRepository articleRepository;

  ArticleBloc({this.articleRepository})
      : assert(articleRepository != null),
        super(null);

  @override
  Stream<ArticleState> mapEventToState(ArticleEvent event) async* {
    print(event);
    if (event is ArticleTagSelectedEvent) {
      yield ArticleFetchingState();
      try {
        final List<Article> articles = await articleRepository
            .fetchArticlesByTag(event.articleTagModel.tagName);
        print(articles);
        if (articles.length == 0) {
          yield ArticleEmptyState();
        } else {
          yield ArticleFetchedState(articles: articles);
        }
      } catch (_) {
        yield ArticleErrorState();
      }
    }
  }
}
