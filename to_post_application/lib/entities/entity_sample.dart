import 'dart:convert';

class MemoModel {
  final int id;
  final String title;
  final String content;

  MemoModel({this.id, this.title, this.content});

  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'title': title,
      'content': content,
    };
  }

  factory MemoModel.fromMap(Map<String, dynamic> map) {
    if (map == null) return null;

    return MemoModel(
      id: map['id'],
      title: map['title'],
      content: map['content'],
    );
  }

  String toJson() => json.encode(toMap());

  factory MemoModel.fromJson(String source) => MemoModel.fromMap(json.decode(source));
}
