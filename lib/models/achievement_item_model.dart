class AchievementItemModel {
  const AchievementItemModel({
    required this.icon,
    required this.title,
    required this.isReceived,
    this.dateReceived,
  });

  factory AchievementItemModel.fromJson(Map<String, dynamic> json) {
    return AchievementItemModel(
      icon: json['icon'] as String,
      title: json['title'] as String,
      dateReceived: json['dateReceived'] as String?,
      isReceived: json['isReceived'] as bool,
    );
  }

  final String icon;
  final String title;
  final String? dateReceived;
  final bool isReceived;

  Map<String, dynamic> toJson() {
    return {
      'icon': icon,
      'title': title,
      'dateReceived': dateReceived,
      'status': isReceived,
    };
  }

  @override
  String toString() {
    return 'AchievementItemModel(icon: $icon, title: $title, dateReceived: $dateReceived, isReceived: $isReceived)';
  }
}
