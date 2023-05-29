class NotificationCategoryListModel {
  NotificationCategoryListModel({
    required this.listCategories,
    required this.locale,
  });

  factory NotificationCategoryListModel.fromJson(Map<String, dynamic> json) {
    final notificationCategories_ =
        json['notificationCategories'] as List<dynamic>;

    return NotificationCategoryListModel(
      locale: json['locale'] as String,
      listCategories: notificationCategories_
          .map(
            (e) =>
                NotificationCategoryModel.fromJson(e as Map<String, dynamic>),
          )
          .toList(),
    );
  }

  final List<NotificationCategoryModel> listCategories;
  final String locale;

  Map<dynamic, dynamic> toJson() => {
        'locale': locale,
        'listCategories': listCategories,
      };

  Map<String, String> get mapCategories => {
        for (var item in listCategories) item.slug: item.name,
      };

  @override
  String toString() {
    return [
      'NotificationCategoryListModel(',
      'locale: $locale',
      'listCategories: $listCategories)'
    ].join();
  }
}

class NotificationCategoryModel {
  NotificationCategoryModel({
    required this.id,
    required this.name,
    required this.slug,
  });

  factory NotificationCategoryModel.fromJson(Map<String, dynamic> json) {
    return NotificationCategoryModel(
      id: json['id'] as String,
      name: json['name'] as String,
      slug: json['slug'] as String,
    );
  }

  //
  final String id;
  //
  final String name;
  //
  final String slug;

  Map<String, dynamic> toJson() => {
        'id': id,
        'name': name,
        'slug': slug,
      };

  @override
  String toString() {
    return [
      'NotificationCategoryModel(',
      'id: $id, ',
      'name: $name, ',
      'slug: $slug)'
    ].join();
  }
}
