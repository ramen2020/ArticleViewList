import 'package:flutter/material.dart';
import 'package:qiita_client/bloc/article_bloc.dart';
import 'package:qiita_client/bloc/article_events.dart';
import 'package:qiita_client/models/article_tag.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class ArticleTagBar extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 80.0,
      child: ListView.builder(
        itemBuilder: buildItem,
        itemCount: tags.length,
        scrollDirection: Axis.horizontal,
      ),
    );
  }

  Widget buildItem(context, index) {
    return InkWell(
      onTap: () {
        BlocProvider.of<ArticleBloc>(context)
            .add(ArticleTagSelectedEvent(articleTagModel: tags[index]));
      },
      child: Container(
        width: 70.0,
        height: 70.0,
        decoration: BoxDecoration(
          shape: BoxShape.circle,
          image: DecorationImage(
            image: AssetImage(tags[index].imagePath),
          ),
        ),
        margin: EdgeInsets.symmetric(horizontal: 16.0),
      ),
    );
  }

  Widget buildSeparator(context, index) {
    return VerticalDivider(
      width: 32.0,
      color: Colors.transparent,
    );
  }
}
