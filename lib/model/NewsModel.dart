class NewsModel{
  final String id, time, title, body, src, image;

  NewsModel({this.id, this.time, this.title, this.body, this.src, this.image});

  NewsModel.fromData(Map<String, dynamic> data)
      : id = data['id'],
       time = data['time'],
       title = data['title'],
       body = data['body'],
       src = data['src'],
       image = data['image'];

  Map<String, dynamic> toJson() {
    return {
       'id': id,
       'time': time,
       'title': title,
       'body' : body,
       'src' : src,
       'image' : image
       };
  }
}