import 'package:flutter/material.dart' as material;
import 'package:shadcn_flutter/shadcn_flutter.dart';
import 'package:spotube/design_system/theme/colors.dart';

class SpotubeTheme {
  static ThemeData light() {
    return ThemeData(
      radius: .5,
      iconTheme: const IconThemeProperties(),
      colorScheme: LegacyColorSchemes.lightSlate(),
      surfaceOpacity: .8,
      surfaceBlur: 10,
    );
  }

  static ThemeData dark() {
    return ThemeData(
      radius: .5,
      iconTheme: const IconThemeProperties(),
      colorScheme: LegacyColorSchemes.darkSlate(),
      surfaceOpacity: .8,
      surfaceBlur: 10,
    );
  }

  static material.ThemeData materialTheme(Brightness brightness, material.ColorScheme? colorScheme) {
    return material.ThemeData(
      brightness: brightness,
      splashFactory: material.NoSplash.splashFactory,
      appBarTheme: const material.AppBarTheme(
        surfaceTintColor: Colors.transparent,
        scrolledUnderElevation: 0,
        shadowColor: Colors.transparent,
        elevation: 0,
      ),
      colorScheme: colorScheme,
    );
  }
}
