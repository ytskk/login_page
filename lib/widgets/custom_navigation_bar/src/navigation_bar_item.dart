class AppNavigationBarItem {
  /// Create a Custom Navigationbar Item.
  ///
  /// the [selectedIcon] must not be null.
  AppNavigationBarItem({
    required this.icon,
    String? selectedIcon,
    this.title,
    String? selectedTitle,
    this.badgeCount = 0,
    this.showBadge = false,
  })  : selectedIcon = selectedIcon ?? icon,
        selectedTitle = selectedTitle ?? title;

  ///
  /// Item icon asset name
  /// 
  final String icon;

  /// An alternative icon displayed when this bottom navigation item is
  /// selected.
  ///
  /// If this icon is not provided, the bottom navigation bar will display
  /// [icon] in either state.
  final String selectedIcon;

  ///
  /// Item title under icon
  ///
  final String? title;

  ///
  /// Item selected title under icon
  ///
  final String? selectedTitle;

  /// Notification badge count
  final int badgeCount;

  /// hide or show badge
  final bool showBadge;
}
