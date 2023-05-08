class NotificationItemModel {
  NotificationItemModel({
    required this.id,
    required this.description,
    required this.date,
    required this.type,
    required this.isNew,
  });

  factory NotificationItemModel.fromJson(Map<String, dynamic> json) {
    return NotificationItemModel(
      id: json['id'] as String,
      description: json['description'] as String,
      date: json['date'] as String,
      type: json['type'] as String,
      isNew: json['isNew'] as bool,
    );
  }

  final String id;
  final String description;
  final String date;
  final String type;
  bool isNew;

  Map<String, dynamic> toJson() => {
        'id': id,
        'description': description,
        'date': date,
        'type': type,
        'isNew': isNew,
      };

  @override
  String toString() {
    return 'NotificationItemModel(id: $id, description: $description, date: $date, type: $type, isNew: $isNew)';
  }
}
