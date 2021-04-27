class Article {
  String title;
  String url;
  User user;

  Article({this.title, this.url, this.user});

  Article.fromJson(Map<String, dynamic> json) {
    title = json['title'];
    url = json['url'];
    user = User.fromJson(json['user']);
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['title'] = this.title;
    data['url'] = this.url;
    if (this.user != null) {
      data['user'] = this.user.toJson();
    }
    return data;
  }
}

class User {
  String id;
  String profileImageUrl;
  String name;

  User({this.id, this.profileImageUrl, this.name});

  User.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    profileImageUrl = json['profile_image_url'];
    name = json['name'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['profile_image_url'] = this.profileImageUrl;
    data['name'] = this.name;

    return data;
  }
}
