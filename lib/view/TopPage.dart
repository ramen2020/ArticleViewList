import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:qiita_client/bloc/article_bloc.dart';
import 'package:qiita_client/services/repository.dart';
import 'package:qiita_client/themes/themes.dart';
import 'package:qiita_client/widgets/article_search_word_bar.dart';
import 'package:qiita_client/widgets/article_tag_bar.dart';
import 'package:qiita_client/widgets/article_list.dart';

class TopPage extends StatefulWidget {
  final ArticleRepository articleRepository;

  TopPage({this.articleRepository});

  @override
  TopPageState createState() {
    return new TopPageState();
  }
}

class TopPageState extends State<TopPage> {
  // ignore: close_sinks
  ArticleBloc _articleBloc;

  @override
  void initState() {
    super.initState();
    _articleBloc = ArticleBloc(articleRepository: widget.articleRepository);
  }

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (BuildContext context) => _articleBloc,
      child: Scaffold(
          appBar: AppBar(
            elevation: 0.0,
            backgroundColor: Colors.teal[400],
            title: Text(
              'Qiita client',
              style: appBarTextStyle,
            ),
          ),
          body: Column(
            children: <Widget>[
              ArticleTagBar(),
              SizedBox(height: 10.0),
              ArticleSearchWordBar(),
              SizedBox(height: 10.0),
              ArticleListing(),
            ],
          )),
    );
  }
}
