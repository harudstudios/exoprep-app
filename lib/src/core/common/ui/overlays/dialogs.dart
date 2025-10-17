import 'package:flutter/material.dart';
import 'package:root/src/core/extensions/context_extension.dart';

class AppDialogs {
  AppDialogs._();

  static Future<void> showAppDialog(
    BuildContext context, {
    required Widget widget,
    EdgeInsets? contentPadding,
    EdgeInsets? insetPadding,
    bool onTapOutside = true,
    Color? bgColor,
  }) async {
    await showDialog<void>(
      barrierDismissible: onTapOutside,
      context: context,
      builder: (context) => AlertDialog(
        backgroundColor: bgColor ?? (context.isDarkMode ? Colors.grey.shade800 : Colors.grey.shade200),
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
        contentPadding: contentPadding ?? const EdgeInsets.all(16),
        insetPadding: insetPadding ?? const EdgeInsets.all(36),
        content: widget,
      ),
    );
  }
}
