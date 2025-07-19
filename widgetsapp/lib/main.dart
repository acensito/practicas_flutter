import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:widgetsapp/config/router/app_router.dart';
import 'package:widgetsapp/config/theme/app_theme.dart';
import 'package:widgetsapp/views/screens/providers/theme_provider.dart';

void main() {
  runApp(
    ProviderScope(child: const MainApp()),
  );
}

class MainApp extends ConsumerWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {

    // final selectedTheme = ref.watch(selectedColorProvider);
    // final isDarkMode = ref.watch(isDarkModeProvider);
    final AppTheme appTheme = ref.watch(appThemeProvider);

    return MaterialApp.router(
      routerConfig: appRouter,
      debugShowCheckedModeBanner: false,
      // theme: AppTheme(selectedColor: selectedTheme, isDarkMode: isDarkMode).getTheme(),
      theme: appTheme.getTheme(),
    );
  }
}
