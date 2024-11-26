class TodoModel {
  final int? id;
  final String? todo;
  final bool? completed;
  final int? userId;

  TodoModel({
    this.id,
    this.todo,
    this.completed,
    this.userId,
  });

  TodoModel copyWith({
    int? id,
    String? todo,
    bool? completed,
    int? userId,
  }) =>
      TodoModel(
        id: id ?? this.id,
        todo: todo ?? this.todo,
        completed: completed ?? this.completed,
        userId: userId ?? this.userId,
      );

  factory TodoModel.fromJson(Map<String, dynamic> json) => TodoModel(
        id: json['id'],
        todo: json['todo'],
        completed: json['completed'],
        userId: json['userId'],
      );

  Map<String, dynamic> toJson() => {
        'id': id,
        'todo': todo,
        'completed': completed,
        'userId': userId,
      };
}
