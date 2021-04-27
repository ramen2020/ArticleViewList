import 'package:meta/meta.dart';

class ArticleTagModel {
  final String tagName;
  final String imagePath;

  ArticleTagModel({@required this.tagName, @required this.imagePath});
}

List<ArticleTagModel> tags = [
  ArticleTagModel(tagName: "aws", imagePath: "images/flags/aws.png"),
  ArticleTagModel(tagName: "docker", imagePath: "images/flags/docker.png"),
  ArticleTagModel(tagName: "flutter", imagePath: "images/flags/flutter.png"),
  ArticleTagModel(tagName: "kotlin", imagePath: "images/flags/kotlin.png"),
  ArticleTagModel(tagName: "laravel", imagePath: "images/flags/laravel.png"),
  ArticleTagModel(tagName: "python", imagePath: "images/flags/python.png"),
  ArticleTagModel(tagName: "swift", imagePath: "images/flags/swift.png")
];
