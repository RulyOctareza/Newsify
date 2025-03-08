class LocalNewsModel {
  int? id;
  String? title;
  String? imageUrl;
  DateTime? date;
  String? author;
  String? content;

  LocalNewsModel({
    this.id,
    this.title,
    this.imageUrl,
    this.date,
    this.author,
    this.content,
  });

  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'author': author,
      'content': content,
      'date': date?.toIso8601String(),
      'imageUrl': imageUrl,
      'title': title,
    };
  }

  factory LocalNewsModel.fromMap(Map<String, dynamic> map) {
    return LocalNewsModel(
      id: map['id'],
      author: map['author'],
      content: map['content'],
      date: map['date'] != null ? DateTime.parse(map['date']) : null,
      imageUrl: map['imageUrl'],
      title: map['title'],
    );
  }
}
