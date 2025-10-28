import 'package:adaptive_theme/adaptive_theme.dart';
import 'package:flutter/cupertino.dart';
import 'package:root/src/core/extensions/context_extension.dart';
import 'package:root/src/core/theme/colors.dart';

class ThemeToggleSwitch extends StatefulWidget {
  const ThemeToggleSwitch({this.scale = 1.0, super.key});

  final double scale;

  @override
  State<ThemeToggleSwitch> createState() => _ThemeToggleSwitchState();
}

class _ThemeToggleSwitchState extends State<ThemeToggleSwitch> {
  void _toggleTheme(_) {
    if (AdaptiveTheme.of(context).mode.isDark) {
      AdaptiveTheme.of(context).setLight();
    } else {
      AdaptiveTheme.of(context).setDark();
    }
  }

  @override
  Widget build(BuildContext context) {
    final isDark = context.isDarkMode;
    return Transform.scale(
      scale: widget.scale,
      child: CupertinoSwitch(
        value: isDark,
        onChanged: _toggleTheme,
        activeTrackColor: AppColors.primaryColor,
      ),
    );
  }
}
