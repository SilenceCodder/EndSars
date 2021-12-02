class AddReportModel{
  final String id, time, title, body, city, state;

  AddReportModel({this.id, this.time, this.city, this.title, this.body, this.state});

  AddReportModel.fromData(Map<String, dynamic> data)
      : id = data['id'],
       time = data['time'],
       city = data['city'],
       title = data['title'],
       body = data['body'],
       state = data['state'];

  Map<String, dynamic> toJson() {
    return {
       'id': id,
       'time': time,
       'city': city,
       'title' : title,
       'body' : body,
       'state' : state
       };
  }
}