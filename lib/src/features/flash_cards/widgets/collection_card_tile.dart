import 'package:flutter/material.dart';
import 'package:root/src/core/extensions/context_extension.dart';

class CollectionCardTile extends StatelessWidget {
  final String title;
  final String tag;
  final Color accentColor;
  final int cardCount;
  final VoidCallback? onTap;

  const CollectionCardTile({
    super.key,
    required this.title,
    required this.tag,
    required this.accentColor,
    required this.cardCount,
    this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    final isDark = context.isDarkMode;

    // Color Logic
    final bgTopColor = isDark ? accentColor.withValues(alpha: 0.30) : accentColor.withValues(alpha: 0.12);

    final bgBottomColor = isDark ? accentColor.withValues(alpha: 0.20) : accentColor.withValues(alpha: 0.48);

    final borderColor = isDark ? accentColor.withValues(alpha: 0.3) : Colors.white.withValues(alpha: 0.4);

    final titleColor = isDark ? Colors.white.withValues(alpha: 0.95) : Colors.black.withValues(alpha: 0.8);

    final decoIconColor = isDark ? accentColor.withValues(alpha: 0.15) : accentColor.withValues(alpha: 0.65);

    final pillBgColor = isDark ? Colors.black.withValues(alpha: 0.3) : Colors.white.withValues(alpha: 0.7);

    final pillTextColor = isDark ? accentColor : accentColor;

    return Material(
      color: Colors.transparent,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(24),
        side: BorderSide(color: borderColor),
      ),
      child: InkWell(
        onTap: onTap,
        borderRadius: BorderRadius.circular(24),
        splashColor: accentColor.withValues(alpha: isDark ? 0.2 : 0.1),
        highlightColor: accentColor.withValues(alpha: isDark ? 0.1 : 0.05),
        child: Container(
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(24),
            gradient: LinearGradient(begin: Alignment.topLeft, end: Alignment.bottomRight, colors: [bgTopColor, bgBottomColor]),
          ),
          child: ClipRRect(
            borderRadius: BorderRadius.circular(24),
            child: Stack(
              children: [
                // Background Decorative Icon
                Positioned(
                  right: -15,
                  bottom: -20,
                  child: Transform.rotate(angle: -0.2, child: Icon(Icons.style, size: 90, color: decoIconColor)),
                ),
                // Main Content
                Padding(
                  padding: const EdgeInsets.all(18),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      // Top Pill (Card Count)
                      Container(
                        padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 6),
                        decoration: BoxDecoration(color: pillBgColor, borderRadius: BorderRadius.circular(20)),
                        child: Text(
                          '$cardCount cards',
                          style: TextStyle(fontWeight: FontWeight.w700, fontSize: 11, color: pillTextColor),
                        ),
                      ),
                      // Bottom Title
                      Text(
                        title,
                        maxLines: 2,
                        overflow: TextOverflow.ellipsis,
                        style: TextStyle(
                          fontSize: 19,
                          fontWeight: FontWeight.w800,
                          color: titleColor,
                          height: 1.1,
                          letterSpacing: -0.3,
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
