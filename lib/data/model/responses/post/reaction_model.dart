class ReactionsModel {
  final int? likes;
  final int? dislikes;

  ReactionsModel({
    this.likes,
    this.dislikes,
  });

  ReactionsModel copyWith({
    int? likes,
    int? dislikes,
  }) =>
      ReactionsModel(
        likes: likes ?? this.likes,
        dislikes: dislikes ?? this.dislikes,
      );

  factory ReactionsModel.fromJson(Map<String, dynamic> json) => ReactionsModel(
        likes: json['likes'],
        dislikes: json['dislikes'],
      );

  Map<String, dynamic> toJson() => {
        'likes': likes,
        'dislikes': dislikes,
      };
}
