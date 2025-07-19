
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:widgetsapp/config/theme/app_theme.dart';

//estado darkmode
final isDarkModeProvider = StateProvider<bool>((ref) => false );
//estado lista de colores del theme
final colorListProvider = Provider((ref) => colorList);