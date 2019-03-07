class DummyData {
  final int id;
  final int userId;
  final String title;
  final bool completed;


  DummyData({this.id, this.userId, this.title, this.completed});

  factory DummyData.fromJson(Map<String, dynamic> json) {
    return DummyData(
        id: json['id'],
        userId: json['userId'],
        title: json['title'],
        completed: json['completed']
    );
  }

}