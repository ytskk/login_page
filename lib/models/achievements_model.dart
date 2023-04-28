import 'package:training_and_testing/models/achievement_item_model.dart';

class AchievementsModel {
  const AchievementsModel({
    required this.receivedAchievements,
    required this.achievements,
  });

  factory AchievementsModel.fromJson(Map<String, dynamic> json) {
    return AchievementsModel(
      receivedAchievements: json['receivedAchievements'] as int,
      // !!!
      achievements: List<AchievementItemModel>.from(
        (json['items'] as List<Map<String, dynamic>>).map(
          AchievementItemModel.fromJson,
        ),
      ),
    );
  }

  final int receivedAchievements;
  final List<AchievementItemModel> achievements;

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
