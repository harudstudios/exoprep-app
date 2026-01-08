import 'package:flutter/material.dart';
import 'package:root/src/features/flash_cards/models/data_model/decks_data_model.dart';

class DeckTileWidget extends StatefulWidget {
  final DeckDataModel deck;
  final VoidCallback onTap;

  const DeckTileWidget({required this.deck, required this.onTap, super.key});

  @override
  State<DeckTileWidget> createState() => _DeckTileWidgetState();
}

class _DeckTileWidgetState extends State<DeckTileWidget> with SingleTickerProviderStateMixin {
  bool _isPressed = false;
  late AnimationController _animController;
  late Animation<double> _scaleAnimation;

  final List<List<Color>> _gradients = [
    const [Color(0xFF6366F1), Color(0xFF8B5CF6)], // Indigo-Purple
    const [Color(0xFFEC4899), Color(0xFFF97316)], // Pink-Orange
    const [Color(0xFF10B981), Color(0xFF06B6D4)], // Emerald-Cyan
    const [Color(0xFFF59E0B), Color(0xFFEF4444)], // Amber-Red
    const [Color(0xFF8B5CF6), Color(0xFFEC4899)], // Purple-Pink
    const [Color(0xFF06B6D4), Color(0xFF3B82F6)], // Cyan-Blue
  ];

  @override
  void initState() {
    super.initState();
    _animController = AnimationController(vsync: this, duration: const Duration(milliseconds: 150));

    _scaleAnimation = Tween<double>(
      begin: 1.0,
      end: 0.95,
    ).animate(CurvedAnimation(parent: _animController, curve: Curves.easeInOut));
  }

  @override
  void dispose() {
    _animController.dispose();
    super.dispose();
  }

  List<Color> _getGradientForDeck() {
    final hash = widget.deck.name?.hashCode ?? 0;
    return _gradients[hash.abs() % _gradients.length];
  }

  @override
  Widget build(BuildContext context) {
    final isDark = Theme.of(context).brightness == Brightness.dark;
    final gradient = _getGradientForDeck();

    return ScaleTransition(
      scale: _scaleAnimation,
      child: GestureDetector(
        onTapDown: (_) {
          setState(() => _isPressed = true);
          _animController.forward();
        },
        onTapUp: (_) {
          setState(() => _isPressed = false);
          _animController.reverse();
          widget.onTap();
        },
        onTapCancel: () {
          setState(() => _isPressed = false);
          _animController.reverse();
        },
        child: Container(
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(20),
            gradient: LinearGradient(
              begin: Alignment.topLeft,
              end: Alignment.bottomRight,
              colors: isDark
                  ? [Colors.white.withValues(alpha: 0.08), Colors.white.withValues(alpha: 0.04)]
                  : [Colors.black.withValues(alpha: 0.04), Colors.black.withValues(alpha: 0.02)],
            ),
            border: Border.all(
              color: isDark ? Colors.white.withValues(alpha: 0.12) : Colors.black.withValues(alpha: 0.08),
              width: 1.5,
            ),
            boxShadow: [
              BoxShadow(
                color: gradient[0].withValues(alpha: _isPressed ? 0.15 : 0.1),
                blurRadius: _isPressed ? 15 : 20,
                offset: Offset(0, _isPressed ? 4 : 8),
              ),
            ],
          ),
          child: ClipRRect(
            borderRadius: BorderRadius.circular(20),
            child: Stack(
              children: [
                // Gradient accent bar at top
                Positioned(
                  top: 0,
                  left: 0,
                  right: 0,
                  child: Container(
                    height: 4,
                    decoration: BoxDecoration(gradient: LinearGradient(colors: gradient)),
                  ),
                ),

                // Content
                Padding(
                  padding: const EdgeInsets.all(16),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      // Icon
                      Container(
                        padding: const EdgeInsets.all(12),
                        decoration: BoxDecoration(
                          gradient: LinearGradient(colors: gradient),
                          borderRadius: BorderRadius.circular(14),
                          boxShadow: [
                            BoxShadow(color: gradient[0].withValues(alpha: 0.3), blurRadius: 12, offset: const Offset(0, 4)),
                          ],
                        ),
                        child: const Icon(Icons.style_rounded, color: Colors.white, size: 24),
                      ),

                      const Spacer(),

                      // Deck name
                      Text(
                        widget.deck.name ?? 'Untitled Deck',
                        style: TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.bold,
                          color: isDark ? Colors.white : Colors.black87,
                          height: 1.3,
                        ),
                        maxLines: 2,
                        overflow: TextOverflow.ellipsis,
                      ),

                      const SizedBox(height: 8),

                      // Card count placeholder
                      Row(
                        children: [
                          Icon(Icons.credit_card_rounded, size: 14, color: isDark ? Colors.grey.shade400 : Colors.grey.shade600),
                          const SizedBox(width: 4),
                          Text(
                            widget.deck.cardsCount != null ? widget.deck.cardsCount.toString() : '0',
                            style: TextStyle(
                              fontSize: 12,
                              color: isDark ? Colors.grey.shade400 : Colors.grey.shade600,
                              fontWeight: FontWeight.w500,
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),

                // Shimmer overlay on press
                if (_isPressed)
                  Positioned.fill(
                    child: Container(
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(20),
                        color: Colors.white.withValues(alpha: 0.1),
                      ),
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
