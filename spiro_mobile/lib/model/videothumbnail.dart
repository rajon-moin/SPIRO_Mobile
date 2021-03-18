class videothumbnail {
  int id;
  String title;
  String author;
  String url;

  videothumbnail({this.id, this.title, this.url, this.author});

  videothumbnail.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    author = json['author'];
    title = json['title'];
    url = json['url'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['author'] = this.author;
    data['id'] = this.id;
    data['title'] = this.title;
    data['url'] = this.url;

    return data;
  }
}
