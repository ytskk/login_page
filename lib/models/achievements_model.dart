import 'achievement_item_model.dart';

class AchievementsModel {
  const AchievementsModel({
    required this.receivedAchievements,
    required this.achievements,
  });

  final int receivedAchievements;
  final List<AchievementItemModel> achievements;

  factory AchievementsModel.fromJson(Map<String, dynamic> json) {
    return AchievementsModel(
      receivedAchievements: json['receivedAchievements'],
      achievements: List<AchievementItemModel>.from(
        json['items'].map(
          (achievement) => AchievementItemModel.fromJson(achievement),
        ),
      ),
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'receivedAchievements': receivedAchievements,
      'items': achievements.map((achievement) => achievement.toJson()),
    };
  }

  @override
  String toString() {
    return 'AchievementsModel(receivedAchievements: $receivedAchievements, achievements: $achievements)';
  }
}
