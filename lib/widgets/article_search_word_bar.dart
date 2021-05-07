import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:qiita_client/bloc/article_bloc.dart';
import 'package:qiita_client/bloc/article_events.dart';
import 'package:qiita_client/themes/themes.dart';

class ArticleSearchWordBar extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(horizontal: 16.0),
      decoration: BoxDecoration(
        color: Colors.teal[50],
        borderRadius: BorderRadius.all(Radius.circular(20.20)),
      ),
      child: TextField(
          onSubmitted: (searchWord) {
            BlocProvider.of<ArticleBloc>(context)
                .add(SearchTextEvent(searchWord: searchWord));
          },
          decoration: InputDecoration(
            border: InputBorder.none,
            hintStyle: hintStyle,
            hintText: '記事を検索する。',
            prefixIcon: Icon(
              Icons.search,
              size: 30.0,
              color: Colors.black54,
            ),
          )),
    );
  }
}
