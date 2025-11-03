import 'package:flutter/material.dart';
import 'package:loading_indicator/loading_indicator.dart';

class CommonLoadingIndicator {
  static OverlayEntry? _overlayEntry;

  // ⭐ Show loading indicator
  static void show(
    BuildContext context, {
    Indicator? indicatorType,
    List<Color>? colors,
    bool barrierDismissible = false,
  }) {
    // Remove existing overlay if present
    hide();

    _overlayEntry = OverlayEntry(
      builder: (context) => _LoadingOverlay(
        indicatorType: indicatorType,
        colors: colors,
        barrierDismissible: barrierDismissible,
      ),
    );

    Overlay.of(context).insert(_overlayEntry!);
  }

  // ⭐ Hide loading indicator
  static void hide() {
    _overlayEntry?.remove();
    _overlayEntry = null;
  }

  // ⭐ Check if loading is showing
  static bool get isShowing => _overlayEntry != null;
}

class _LoadingOverlay extends StatelessWidget {
  const _LoadingOverlay({
    this.indicatorType,
    this.colors,
    this.barrierDismissible = false,
  });

  final Indicator? indicatorType;
  final List<Color>? colors;
  final bool barrierDismissible;

  @override
  Widget build(BuildContext context) {
    final isDark = Theme.of(context).brightness == Brightness.dark;

    return Material(
      color: Colors.black54,
      child: GestureDetector(
        onTap: barrierDismissible ? CommonLoadingIndicator.hide : null,
        child: ColoredBox(
          color: Colors.transparent,
          child: Center(
            child: Container(
              padding: const EdgeInsets.all(24),
              decoration: BoxDecoration(
                color: isDark ? Colors.grey.shade900 : Colors.white,
                borderRadius: BorderRadius.circular(12),
              ),
              child: SizedBox(
                height: 48,
                width: 48,
                child: LoadingIndicator(
                  colors: colors ?? (isDark ? [Colors.white] : [Colors.grey]),
                  indicatorType: indicatorType ?? Indicator.ballPulse,
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
