import 'package:flutter/material.dart';

class ThemesUtils {
  static final light = ThemeData(
    useMaterial3: true,
    fontFamily: 'SF Pro Display',
    colorScheme: const ColorScheme.light(
      background: Color(0xFFF0F2FA),
      onBackground: Color(0xFF000000),
      primary: Color(0xFFF35B04),
      inversePrimary: Color(0xFFFF8A00),
      primaryContainer: Color(0xFFFFFFFF),
      onPrimary: Color(0xFFFFFFFF),
      surfaceVariant: Color(0xFF4F5262),
      onSurfaceVariant: Color(0xFF83879E),
      outline: Color(0xFF7A829C),
      outlineVariant: Color(0xFFCADCE0),
      scrim: Color(0xFF10B60C),
      inverseSurface: Color(0xFF221F1F),
      surfaceTint: Color(0xFFC8102E),
      onInverseSurface: Color(0xFF0D3183),
      secondary: Color(0xFF05299E),
      surface: Color(0xFF7A829C),
      shadow: Color(0xFFE8E8E8),
      secondaryContainer: Color(0xFFE2E7F6),
      onSurface: Color(0xFFFFFFFF),
    ),
    textSelectionTheme: TextSelectionThemeData(
      selectionColor: const Color(0xFFF35B04).withOpacity(0.5),
      selectionHandleColor: const Color(0xFFF35B04),
    ),
  );

  static final dark = ThemeData(
    useMaterial3: true,
    fontFamily: 'SF Pro Display',
    colorScheme: const ColorScheme.dark(
      background: Color(0xFF141b42),
      onBackground: Color(0xFFFFFFFF),
      primary: Color(0xFFF35B04),
      inversePrimary: Color(0xFFFF8A00),
      primaryContainer: Color(0xFF18347E),
      onPrimary: Color(0xFFFFFFFF),
      surfaceVariant: Color(0xFFFFFFFF),
      onSurfaceVariant: Color(0xFF9095B0),
      outline: Color(0xFF05299E),
      outlineVariant: Color(0xFFCADCE0),
      scrim: Color(0xFF10B60C),
      inverseSurface: Color(0xFF221F1F),
      surfaceTint: Color(0xFFC8102E),
      onInverseSurface: Color(0xFF0D3183),
      secondary: Color(0xFFFFFFFF),
      surface: Color(0xFFFFFFFF),
      shadow: Color(0xFF00003F),
      secondaryContainer: Color(0xFF000C3A),
      onSurface: Color(0xFF000000),
    ),
  );
}
