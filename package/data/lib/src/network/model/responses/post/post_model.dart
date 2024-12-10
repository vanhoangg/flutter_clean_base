import '../../base_model.dart';
import 'reaction_model.dart';

class PostModel extends BaseModel {
  final int? id;
  final String? title;
  final String? body;
  final List<String>? tags;
  final ReactionsModel? reactions;
  final int? views;
  final int? userId;

  PostModel({
    this.id,
    this.title,
    this.body,
    this.tags,
    this.reactions,
    this.views,
    this.userId,
  });

  PostModel copyWith({
    int? id,
    String? title,
    String? body,
    List<String>? tags,
    ReactionsModel? reactions,
    int? views,
    int? userId,
  }) =>
      PostModel(
        id: id ?? this.id,
        title: title ?? this.title,
        body: body ?? this.body,
        tags: tags ?? this.tags,
        reactions: reactions ?? this.reactions,
        views: views ?? this.views,
        userId: userId ?? this.userId,
      );

  factory PostModel.fromJson(Map<String, dynamic> json) => PostModel(
        id: json['id'],
        title: json['title'],
        body: json['body'],
        tags: json['tags'] == null
            ? []
            : List<String>.from(json['tags']?.map((x) => x)),
        reactions: json['reactions'] == null
            ? null
            : ReactionsModel.fromJson(json['reactions']),
        views: json['views'],
        userId: json['userId'],
      );

  Map<String, dynamic> toJson() => {
        'id': id,
        'title': title,
        'body': body,
        'tags':
            tags == null ? [] : List<dynamic>.from(tags?.map((x) => x) ?? []),
        'reactions': reactions?.toJson(),
        'views': views,
        'userId': userId,
      };

  @override
  String get keyMap => 'posts';
}
