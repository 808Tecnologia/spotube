import 'package:shadcn_flutter/shadcn_flutter.dart';

class SpotubeColor extends Color {
  final String name;

  const SpotubeColor(super.color, {required this.name});

  const SpotubeColor.from(super.value, {required this.name});

  factory SpotubeColor.fromString(String string) {
    final slices = string.split(":");
    return SpotubeColor(int.parse(slices.last), name: slices.first);
  }

  @override
  String toString() {
    return "$name:${toARGB32()}";
  }
}

final Set<SpotubeColor> colorsMap = {
  SpotubeColor(Colors.slate.value, name: "slate"),
  SpotubeColor(Colors.gray.value, name: "gray"),
  SpotubeColor(Colors.zinc.value, name: "zinc"),
  SpotubeColor(Colors.neutral.value, name: "neutral"),
  SpotubeColor(Colors.stone.value, name: "stone"),
  SpotubeColor(Colors.red.value, name: "red"),
  SpotubeColor(Colors.orange.value, name: "orange"),
  SpotubeColor(Colors.yellow.value, name: "yellow"),
  SpotubeColor(Colors.green.value, name: "green"),
  SpotubeColor(Colors.blue.value, name: "blue"),
  SpotubeColor(Colors.violet.value, name: "violet"),
  SpotubeColor(Colors.rose.value, name: "rose"),
};

final colorSchemeMap = {
  "slate": LegacyColorSchemes.slate,
  "gray": LegacyColorSchemes.gray,
  "zinc": LegacyColorSchemes.zinc,
  "neutral": LegacyColorSchemes.neutral,
  "stone": LegacyColorSchemes.stone,
  "red": LegacyColorSchemes.red,
  "orange": LegacyColorSchemes.orange,
  "yellow": LegacyColorSchemes.yellow,
  "green": LegacyColorSchemes.green,
  "blue": LegacyColorSchemes.blue,
  "violet": LegacyColorSchemes.violet,
  "rose": LegacyColorSchemes.rose,
};
