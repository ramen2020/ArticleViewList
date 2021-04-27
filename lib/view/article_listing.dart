import 'package:qiita_client/themes/themes.dart';
import 'package:qiita_client/bloc/article_bloc.dart';
import 'package:qiita_client/bloc/article_state.dart';
import 'package:qiita_client/models/article.dart';
import 'package:qiita_client/widgets/message.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class ArticleListing extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return BlocBuilder(
      bloc: BlocProvider.of<ArticleBloc>(context),
      builder: (context, state) {
        if (state is ArticleUninitializedState || state == null) {
          return Message(message: "ようこそ！");
        } else if (state is ArticleEmptyState) {
          return Message(message: "記事が見つかりませんでした。");
        } else if (state is ArticleErrorState) {
          return Message(message: "予期せぬエラーです。。。");
        } else if (state is ArticleFetchingState) {
          return Expanded(child: Center(child: CircularProgressIndicator()));
        } else {
          final stateAsArticleFetchedState = state as ArticleFetchedState;
          final articles = stateAsArticleFetchedState.articles;
          return buildArticlesList(articles);
        }
      },
    );
  }

  Widget buildArticlesList(List<Article> articles) {
    return Expanded(
      child: ListView.separated(
        itemBuilder: (BuildContext context, index) {
          Article article = articles[index];
          return ListTile(
            leading: Image.network(
              article.user.profileImageUrl,
              width: 70.0,
              height: 70.0,
            ),
            title: Text(article.title, style: titleStyle),
            subtitle: Text(article.user.id, style: subTitleStyle),
          );
        },
        separatorBuilder: (BuildContext context, index) {
          return Divider(
            height: 8.0,
            color: Colors.transparent,
          );
        },
        itemCount: articles.length,
      ),
    );
  }
}
