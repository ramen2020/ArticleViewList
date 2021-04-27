import 'package:flutter/material.dart';
import 'package:qiita_client/services/repository.dart';
import 'package:qiita_client/view/TopPage.dart';

void main() {
  ArticleRepository _repository = ArticleRepository();

  runApp(MyApp(
    articleRepository: _repository,
  ));
}

class MyApp extends StatelessWidget {
  final ArticleRepository articleRepository;
  MyApp({this.articleRepository});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        title: 'Qiita List',
        home: TopPage(articleRepository: articleRepository));
  }
}
