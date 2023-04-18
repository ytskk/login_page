class AchievementItemModel {
  const AchievementItemModel({
    required this.icon,
    required this.title,
    this.dateReceived,
    required this.isReceived,
  });

  final String icon;
  final String title;
  final String? dateReceived;
  final bool isReceived;

  factory AchievementItemModel.fromJson(Map<String, dynamic> json) {
    return AchievementItemModel(
      icon: json['icon'],
      title: json['title'],
      dateReceived: json['dateReceived'],
      isReceived: json['isReceived'],
    );
  }

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
