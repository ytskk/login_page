class NotificationItemModel {
  NotificationItemModel({
    required this.id,
    required this.description,
    required this.date,
    required this.categorySlug,
    required this.isNew,
  });

  factory NotificationItemModel.fromJson(Map<String, dynamic> json) {
    return NotificationItemModel(
      id: json['id'] as String,
      description: json['description'] as String,
      date: json['date'] as String,
      categorySlug: json['categorySlug'] as String,
      isNew: json['isNew'] as bool,
    );
  }

  final String id;
  final String description;
  final String date;
  final String categorySlug;
  bool isNew;

  Map<String, dynamic> toJson() => {
        'id': id,
        'description': description,
        'date': date,
        'categorySlug': categorySlug,
        'isNew': isNew,
      };

  @override
  String toString() {
    return <String>[
      'NotificationItemModel(',
      'id: $id, ',
      'description: $description,',
      'date: $date,',
      'categorySlug: $categorySlug',
      'isNew: $isNew)',
    ].join();
  }
}
