class ReviewModel {
  final int? rating;
  final String? comment;
  final DateTime? date;
  final String? reviewerName;
  final String? reviewerEmail;

  ReviewModel({
    this.rating,
    this.comment,
    this.date,
    this.reviewerName,
    this.reviewerEmail,
  });

  ReviewModel copyWith({
    int? rating,
    String? comment,
    DateTime? date,
    String? reviewerName,
    String? reviewerEmail,
  }) =>
      ReviewModel(
        rating: rating ?? this.rating,
        comment: comment ?? this.comment,
        date: date ?? this.date,
        reviewerName: reviewerName ?? this.reviewerName,
        reviewerEmail: reviewerEmail ?? this.reviewerEmail,
      );

  factory ReviewModel.fromJson(Map<String, dynamic> json) => ReviewModel(
        rating: json['rating'],
        comment: json['comment'],
        date: json['date'] == null ? null : DateTime.parse(json['date']),
        reviewerName: json['reviewerName'],
        reviewerEmail: json['reviewerEmail'],
      );

  Map<String, dynamic> toJson() => {
        'rating': rating,
        'comment': comment,
        'date': date?.toIso8601String(),
        'reviewerName': reviewerName,
        'reviewerEmail': reviewerEmail,
      };
}
