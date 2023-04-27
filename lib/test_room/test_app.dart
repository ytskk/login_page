import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:training_and_testing/constants/app_styles.dart';
import 'package:training_and_testing/constants/generated/app_strings.dart';
import 'package:training_and_testing/theme/theme.dart';
import 'package:training_and_testing/widgets/widgets.dart';

class TestApp extends StatefulWidget {
  const TestApp({super.key});

  @override
  State<TestApp> createState() => _TestAppState();
}

class _TestAppState extends State<TestApp> {
  ThemeMode _themeMode = ThemeMode.system;

  // prevents the theme recreations from rebuilding when the themeMode changes
  // this is only for the test app.
  final lightTheme = BrandThemeData.light();
  final darkTheme = BrandThemeData.dark();

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: lightTheme,
      darkTheme: darkTheme,
      themeMode: _themeMode,
      home: TestPage(
        isDark: _themeMode == ThemeMode.dark,
        onThemeChanged: (newValue) => setState(
          () => _themeMode = newValue ? ThemeMode.dark : ThemeMode.light,
        ),
      ),
    );
  }
}

class TestPage extends StatefulWidget {
  const TestPage({
    required this.isDark,
    required this.onThemeChanged,
    super.key,
  });

  final bool isDark;
  final dynamic Function(bool newValue) onThemeChanged;

  @override
  State<TestPage> createState() => _TestPageState();
}

class _TestPageState extends State<TestPage> {
  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    return Scaffold(
      appBar: AppBar(
        title: const Text('Test App'),
        actions: [
          Icon(
            Icons.square_rounded,
            size: iconSize32,
            color: CupertinoTheme.of(context).scaffoldBackgroundColor,
          ),
          Icon(
            Icons.square_rounded,
            size: iconSize32,
            color: theme.colorScheme.blue50,
          ),
        ],
      ),
      body: ListView(
        padding: const EdgeInsets.all(padding16),
        children: [
          TestAppTheme(
            isDark: widget.isDark,
            onThemeChanged: widget.onThemeChanged,
          ),
          const TestAppComponents(),
        ],
      ),
    );
  }
}

class TestAppTheme extends StatelessWidget {
  const TestAppTheme({
    required this.isDark,
    required this.onThemeChanged,
    super.key,
  });

  final bool isDark;
  final dynamic Function(bool newValue) onThemeChanged;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final isDark = theme.brightness == Brightness.dark;

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          children: [
            Expanded(
              child: Text(
                'App Theme: ${appThemeModeName(isDark)}',
              ),
            ),
            Switch(
              value: isDark,
              onChanged: onThemeChanged,
            ),
          ],
        ),
        const SizedBox(height: 32),
        const Text(
          'Color palette',
        ),
        const SizedBox(height: 16),
        _buildColorSchemePalette(context),
      ],
    );
  }

  Widget _buildColorSchemePalette(BuildContext context) {
    final colors = Theme.of(context).colorScheme;
    final theme = Theme.of(context);

    return GridView.count(
      primary: false,
      crossAxisCount: 4,
      crossAxisSpacing: spacing8,
      mainAxisSpacing: spacing16,
      shrinkWrap: true,
      childAspectRatio: 0.7,
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
        _buildColorBox(colors.onPrimaryContainer, 'onPrimaryContainer'),
        _buildColorBox(colors.onSecondaryContainer, 'onPrimaryContainer'),
        _buildColorBox(theme.textTheme.bodyMedium?.color, 'default text color'),
      ],
    );
  }

  Widget _buildColorBox(Color? color, String name) {
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
        Text(
          '${color?.value.toRadixString(16).substring(2).toUpperCase()}',
        ),
      ],
    );
  }

  String appThemeModeName(bool isDark) {
    return isDark ? 'Dark' : 'Light';
  }
}

class TestAppComponents extends StatelessWidget {
  const TestAppComponents({super.key});

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const SizedBox(height: 32),
        const Text('Buttons'),
        const SizedBox(height: 16),
        const Text('Primary Button'),
        const SizedBox(height: 8),
        Wrap(
          spacing: spacing16,
          runSpacing: spacing16,
          children: [
            ElevatedButton(
              onPressed: () {},
              child: const Text('1'),
            ),
            ElevatedButton(
              onPressed: () {},
              child: const Text('2'),
            ),
            ElevatedButton(
              onPressed: () {},
              child: const Text('3'),
            ),
            BrandButton(
              onPressed: () => print('Get Bonuses'),
              child: const Text(AppStrings.getBonuses),
            ),
            BrandButton(
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
            const BrandButton(
              size: ButtonSize.large,
              child: Text(AppStrings.getBonuses),
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
              child: const Text(AppStrings.getBonuses),
            ),
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
      ],
    );
  }
}
