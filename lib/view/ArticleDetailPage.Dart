import 'package:flutter/material.dart';
import 'package:qiita_client/models/article.dart';
import 'package:qiita_client/themes/themes.dart';
import 'package:webview_flutter/webview_flutter.dart';

class ArticleDetailPage extends StatelessWidget {
  final Article article;

  ArticleDetailPage({Key key, this.article}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Qiita Detail',
      home: Scaffold(
        appBar: AppBar(
          elevation: 0.0,
          backgroundColor: Colors.teal[400],
          title: Text(
            'Qiita client',
            style: appBarTextStyle,
          ),
        ),
        body: Center(
          child: WebView(
            initialUrl: article.url,
          ),
        ),
      ),
    );
  }
}

mixin JavascriptMode {
}
