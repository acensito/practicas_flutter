import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:widgetsapp/config/theme/app_theme.dart';

//estado darkmode
final isDarkModeProvider = StateProvider<bool>((ref) => false);
//estado lista de colores del theme
final colorListProvider = Provider((ref) => colorList);
//color seleccionado del theme
final selectedColorProvider = StateProvider<int>((ref) => 0);

//un objeto de tupo AppTheme que contiene el estado del theme
final appThemeProvider = StateNotifierProvider<ThemeNotifier, AppTheme>(
  (ref) => ThemeNotifier(),
);

// controller o notifier para manejar el estado del tema
class ThemeNotifier extends StateNotifier<AppTheme> {
  ThemeNotifier() : super(AppTheme());

  void toggleDarkMode() {
    state = state.copyWith(isDarkMode: !state.isDarkMode);
  }

  void setSelectedColor(int colorIndex) {
    state = state.copyWith(selectedColor: colorIndex);
  }
}
