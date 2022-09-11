class CustomerReview {
  final String id;
  final String name;
  final String review;

  CustomerReview({required this.id, required this.name, required this.review});

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'name': name,
      'review': review,
    };
  }
}
