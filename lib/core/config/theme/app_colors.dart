import 'package:flutter/material.dart';

class AppColors {
  // Colores primarios
  static const Color primary = Color(0xFF3498DB);
  static const Color primaryLight = Color(0xFF5DADE2);
  static const Color primaryDark = Color(0xFF2874A6);

  // Colores secundarios
  static const Color secondary = Color(0xFFFF6B6B);
  static const Color secondaryLight = Color(0xFFFFA8A8);
  static const Color secondaryDark = Color(0xFFC74747);

  // Colores neutros
  static const Color background = Color(0xFFF5F5F5);
  static const Color backgroundDark = Color(0xFF1E1E1E);
  static const Color text = Color(0xFF333333);
  static const Color textLight = Color(0xFF666666);

  // Colores de estado
  static const Color success = Color(0xFF2ECC71);
  static const Color warning = Color(0xFFF39C12);
  static const Color error = Color(0xFFE74C3C);
  static const Color info = Color(0xFF3498DB);

  // Colores para modo oscuro
  static const ColorScheme darkColorScheme = ColorScheme.dark(
    primary: primary,
    secondary: secondary,
    surface: Color(0xFF121212),
    error: error,
  );

  // Colores para modo claro
  static const ColorScheme lightColorScheme = ColorScheme.light(
    primary: primary,
    secondary: secondary,
    surface: Colors.white,
    error: error,
  );

  static const Color white = Color(0xFFFFFFFF);
}
