import 'package:collection/collection.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:shadcn_flutter/shadcn_flutter.dart';
import 'package:shadcn_flutter/shadcn_flutter_extension.dart';
import 'package:spotube/design_system/theme/colors.dart';
import 'package:spotube/extensions/context.dart';

import 'package:spotube/provider/user_preferences/user_preferences_provider.dart';

class ColorSchemePickerDialog extends HookConsumerWidget {
  const ColorSchemePickerDialog({super.key});

  @override
  Widget build(BuildContext context, ref) {
    final preferences = ref.watch(userPreferencesProvider);
    final preferencesNotifier = ref.watch(userPreferencesProvider.notifier);

    final scheme = preferences.accentColorScheme;
    final active = useState<String?>(
      colorsMap.firstWhereOrNull(
        (element) {
          return scheme.name == element.name;
        },
      )?.name,
    );

    return AlertDialog(
      title: Text(
        context.l10n.pick_color_scheme,
        style: TextStyle(color: context.theme.colorScheme.foreground),
      ).large(),
      actions: [
        Button.outline(
          child: Text(context.l10n.cancel),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
        Button.primary(
          onPressed: () {
            Navigator.pop(context);
          },
          child: Text(context.l10n.save),
        ),
      ],
      content: SizedBox(
        height: 200,
        width: 400,
        child: Wrap(
          spacing: 8,
          runSpacing: 8,
          children: colorsMap.map(
            (color) {
              return ColorChip(
                name: color.name,
                color: color,
                isActive: color.name == active.value,
                onPressed: () {
                  active.value = color.name;
                  preferencesNotifier.setAccentColorScheme(
                    colorsMap.firstWhere(
                      (element) {
                        return element.name == color.name;
                      },
                    ),
                  );
                },
              );
            },
          ).toList(),
        ),
      ),
    );
  }
}

class ColorChip extends StatelessWidget {
  final String name;
  final Color color;
  final bool isActive;
  final VoidCallback onPressed;
  const ColorChip({
    super.key,
    required this.name,
    required this.color,
    required this.isActive,
    required this.onPressed,
  });

  @override
  Widget build(BuildContext context) {
    return Chip(
      leading: Container(
        width: 20,
        height: 20,
        decoration: BoxDecoration(
          color: color,
          borderRadius: BorderRadius.circular(10),
        ),
      ),
      onPressed: onPressed,
      style: isActive ? ButtonVariance.primary : ButtonVariance.outline,
      child: Text(name),
    );
  }
}
