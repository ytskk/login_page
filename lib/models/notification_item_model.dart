import 'package:training_and_testing/constants/app_enums.dart';
import 'package:training_and_testing/utils/extensions/extensions.dart';

class NotificationItemModel {
  NotificationItemModel({
    required this.id,
    required this.description,
    required this.date,
    required String type,
    required this.isNew,
  }) : _type = type;

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
  final String _type;
  bool isNew;

  Enum get type =>
      _type.toEnum<NotificationType>(NotificationType.values) ??
      NotificationType.other;

  Map<String, dynamic> toJson() => {
        'id': id,
        'description': description,
        'date': date,
        'type': _type,
        'isNew': isNew,
      };

  @override
  String toString() {
    return 'NotificationItemModel(id: $id, description: $description, date: $date, type: $_type, isNew: $isNew)';
  }
}
