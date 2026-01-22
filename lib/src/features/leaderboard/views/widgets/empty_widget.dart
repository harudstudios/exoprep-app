import 'package:lottie/lottie.dart';
import 'package:flutter/material.dart';
import 'package:root/src/core/extensions/context_extension.dart';

class LeaderboardEmptyWidget extends StatelessWidget {
  final VoidCallback? onActionPressed;
  final String title;
  final String subtitle;
  final String? actionButtonText;

  const LeaderboardEmptyWidget({
    super.key,
    this.onActionPressed,
    this.title = "Nothing here yet",
    this.subtitle = "Compete in exams to start appearing on the leaderboard.",
    this.actionButtonText,
  });

  @override
  Widget build(BuildContext context) {
    final bool isDark = context.isDarkMode;
    final Color textColor = isDark ? Colors.white : Colors.black;
    // YouTube's specific interaction blue
    const Color youtubeLinkBlue = Color(0xFF3EA6FF);

    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 50),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          // --- LOTTIE ANIMATION ---
          Lottie.asset('assets/lottie/empty_asset.json', width: 300, height: 300, fit: BoxFit.cover),

          const SizedBox(height: 24),

          // --- YOUTUBE STYLE TEXT ---
          Text(
            title,
            textAlign: TextAlign.center,
            style: TextStyle(
              color: textColor,
              fontSize: 18,
              fontWeight: FontWeight.w500, // YouTube uses medium weight for titles
            ),
          ),
          const SizedBox(height: 8),
          Text(
            subtitle,
            textAlign: TextAlign.center,
            style: TextStyle(color: textColor.withValues(alpha: 0.6), fontSize: 14, height: 1.4),
          ),

          const SizedBox(height: 20),

          // --- ACTION BUTTON ---
          if (onActionPressed != null)
            TextButton(
              onPressed: onActionPressed,
              style: TextButton.styleFrom(padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8)),
              child: Text(
                (actionButtonText ?? "START NOW").toUpperCase(),
                style: const TextStyle(color: youtubeLinkBlue, fontWeight: FontWeight.bold, letterSpacing: 0.5, fontSize: 14),
              ),
            ),
        ],
      ),
    );
  }
}
