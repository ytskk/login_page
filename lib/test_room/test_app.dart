import 'package:flutter/material.dart';
import 'package:training_and_testing/constants/app_strings.dart';
import 'package:training_and_testing/constants/app_styles.dart';
import 'package:training_and_testing/theme/theme.dart';
import 'package:training_and_testing/widgets/widgets.dart';

class TestApp extends StatelessWidget {
  const TestApp({super.key});

  @override
  Widget build(BuildContext context) {
    final theme = BrandThemeData.dark();

    return MaterialApp(
      theme: theme.themeData(),
      themeMode: ThemeMode.light,
      home: Scaffold(
        appBar: AppBar(
          title: const Text('Test App'),
        ),
        body: ListView(
          padding: const EdgeInsets.all(padding16),
          children: [
            const TestAppTheme(),
          ],
        ),
      ),
    );
  }
}

class TestAppTheme extends StatelessWidget {
  const TestAppTheme({super.key});

  @override
  Widget build(BuildContext context) {
    final isDark = Theme.of(context).brightness == Brightness.dark;
    final appTypography = getAppTypography(context);
    final theme = Theme.of(context);

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          'App Theme: ${appThemeModeName(isDark)}',
          style: appTypography.h1,
        ),
        const SizedBox(height: 32),
        Text(
          'Buttons',
          style: appTypography.h2,
        ),
        const SizedBox(height: 16),
        const Text('Primary Button'),
        const SizedBox(height: 8),
        Wrap(
          spacing: spacing16,
          runSpacing: spacing16,
          children: [
            BrandButton(
              type: ButtonType.primary,
              onPressed: () => print('Get Bonuses'),
              child: const Text(AppStrings.getBonuses),
            ),
            BrandButton(
              type: ButtonType.primary,
              size: ButtonSize.large,
              backgroundColor: theme.colorScheme.secondary,
              foregroundColor: theme.colorScheme.onSecondary,
              onPressed: () => print('Get Bonuses'),
              child: const Text(AppStrings.getBonuses),
            ),
            BrandButton.icon(
              type: ButtonType.primary,
              backgroundColor: theme.colorScheme.secondary,
              foregroundColor: theme.colorScheme.onSecondary,
              // onPressed: () => print('Get Bonuses'),
              icon: const Icon(Icons.add_home),
              child: const Text(AppStrings.getBonuses),
            ),
            BrandButton(
              size: ButtonSize.large,
              child: const Text(AppStrings.getBonuses),
            ),
          ],
        ),
        const SizedBox(height: 16),
        const Text('Secondary Button'),
        const SizedBox(height: 8),
        Wrap(
          spacing: spacing16,
          runSpacing: spacing16,
          children: [
            BrandButton.icon(
              icon: const Icon(Icons.tiktok_rounded),
              type: ButtonType.secondary,
              foregroundColor: theme.colorScheme.secondary,
              onPressed: () => print('Get Bonuses'),
              child: const Text(AppStrings.getBonuses),
            ),
            BrandButton.icon(
              size: ButtonSize.large,
              type: ButtonType.secondary,
              gap: spacing8,
              onPressed: () => print('Get Bonuses'),
              backgroundColor: theme.colorScheme.onSurface,
              icon: const Icon(Icons.tiktok_rounded),
              child: const Text(AppStrings.getBonuses),
            ),
          ],
        ),
        const SizedBox(height: 32),
        Text(
          'Color palette',
          style: appTypography.h2,
        ),
        const SizedBox(height: 16),
        _buildColorSchemePalette(context),
      ],
    );
  }

  Widget _buildColorSchemePalette(BuildContext context) {
    final colors = Theme.of(context).colorScheme;

    return GridView.count(
      primary: false,
      crossAxisCount: 4,
      crossAxisSpacing: spacing8,
      mainAxisSpacing: spacing16,
      shrinkWrap: true,
      childAspectRatio: 0.8,
      children: [
        _buildColorBox(colors.primary, 'primary'),
        _buildColorBox(colors.onPrimary, 'onPrimary'),
        _buildColorBox(colors.secondary, 'secondary'),
        _buildColorBox(colors.onSecondary, 'onSecondary'),
        _buildColorBox(colors.surface, 'surface'),
        _buildColorBox(colors.onSurface, 'onSurface'),
        _buildColorBox(colors.surfaceVariant, 'surface variant'),
        _buildColorBox(colors.onSurfaceVariant, 'onSurface variant'),
        _buildColorBox(colors.background, 'background'),
        _buildColorBox(colors.onBackground, 'onBackground'),
      ],
    );
  }

  Widget _buildColorBox(Color color, String name) {
    return Column(
      children: [
        Container(
          decoration: BoxDecoration(
            color: color,
            borderRadius: BorderRadius.circular(borderRadius8),
            border: Border.all(
              color: Colors.grey,
              width: 2,
            ),
          ),
          height: 64,
        ),
        const SizedBox(height: spacing4),
        Text(
          name,
          textAlign: TextAlign.center,
          style: const TextStyle(fontSize: 12),
          maxLines: 2,
          overflow: TextOverflow.ellipsis,
        ),
      ],
    );
  }

  String appThemeModeName(bool isDark) {
    return isDark ? 'Dark' : 'Light';
  }
}
