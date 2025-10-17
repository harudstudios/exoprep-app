// import 'package:go_router/go_router.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:root/src/core/extensions/context_extension.dart';

// import 'dialogs.dart';

class AppSheets {
  AppSheets._();

  static Future<void> showCupertinoBottomSheet(BuildContext context, Widget widget) async {
    await showCupertinoSheet<void>(context: context, builder: (_) => widget);
  }

  static Future<void> showBottomSheet(BuildContext context, Widget widget) async {
    await showModalBottomSheet<void>(context: context,
        showDragHandle: true,
        isScrollControlled: true,
        backgroundColor: context.isDarkMode ? const Color(0xFF111111) : Colors.white,
        shape: RoundedRectangleBorder(
          side: BorderSide(color: context.isDarkMode ? Colors.black : Colors.white),
          borderRadius: const BorderRadius.vertical(top: Radius.circular(12)),
        ),
        builder: (_) => widget);
  }
}
