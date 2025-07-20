class NoteModel {
  final int? id;
  final String title;
  final String content;
  final String date;

  NoteModel({
    this.id,
    required this.title,
    required this.content,
    required this.date,
  });

  // لتحويل الـ Note إلى Map عند التخزين في قاعدة البيانات
  Map<String, dynamic> toMap() {
    return {'id': id, 'title': title, 'content': content, 'date': date};
  }

  // لتحويل Map إلى Note عند القراءة من قاعدة البيانات
  factory NoteModel.fromMap(Map<String, dynamic> map) {
    return NoteModel(
      id: map['id'],
      title: map['title'],
      content: map['content'],
      date: map['date'],
    );
  }
}
