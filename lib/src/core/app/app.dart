import 'package:adaptive_theme/adaptive_theme.dart';
import 'package:flutter/material.dart';
import 'package:root/src/core/app/app_di.dart';
import 'package:root/src/core/navigation/router.dart';
import 'package:root/src/core/theme/theme.dart';
import 'package:toastification/toastification.dart';

class MyApp extends StatelessWidget {
  const MyApp({super.key, this.savedThemeMode});

  final AdaptiveThemeMode? savedThemeMode;

  @override
  Widget build(BuildContext context) {
    return AppDI(
      child: AdaptiveTheme(
        light: AppTheme.lightTheme,
        dark: AppTheme.darkTheme,
        initial: savedThemeMode ?? AdaptiveThemeMode.system,
        builder: (theme, darkTheme) => ToastificationWrapper(
          child: Builder(
            builder: (context) {
              return MaterialApp.router(
                // title: '$DISPLAY_NAME',
                debugShowCheckedModeBanner: false,
                routerConfig: router,
                darkTheme: darkTheme,
                theme: theme,
              );
            },
          ),
        ),
        // ),
      ),
    );
  }
}
