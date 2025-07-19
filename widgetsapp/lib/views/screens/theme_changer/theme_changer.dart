import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:widgetsapp/views/screens/providers/theme_provider.dart';

class ThemeChanger extends ConsumerWidget {
  static const String routeName = 'theme';

  const ThemeChanger({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {

    final isDarkMode = ref.watch(isDarkModeProvider);

    return Scaffold(
      appBar: AppBar(
        title: Text('Theme Changer'),
        actions: [
          IconButton(
            icon: Icon(isDarkMode ? Icons.dark_mode : Icons.light_mode),
            onPressed: () {
              // Toggle dark mode
              final isDarkMode = ref.read(isDarkModeProvider.notifier).state;
              ref.read(isDarkModeProvider.notifier).state = !isDarkMode;
            },
          ),
        ],
      ),
      body: _ThemeChangerList(),
    );
  }
}

class _ThemeChangerList extends ConsumerWidget {

  @override
  Widget build(BuildContext context, WidgetRef ref) {

    final List<Color> colors = ref.watch(colorListProvider);
    final int selectedColor = ref.watch(selectedColorProvider);

    return ListView.builder(
      itemCount: colors.length,
      itemBuilder: (context, index) {
        final Color color = colors[index];
        return RadioListTile(
          title: Text('Color $index', style: TextStyle(color: color),),
          subtitle: Text('${color.toARGB32()}'),
          activeColor: color,
          value: index,
          groupValue: selectedColor,
          onChanged: (value) {
            ref.read(selectedColorProvider.notifier).state = index;

          },
        );
      },
    );
  }
}
