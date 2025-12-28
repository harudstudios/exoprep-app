import 'dart:ui';
import 'package:flutter/material.dart';

class CreateDeckWidget extends StatefulWidget {
  final Function(String deckName) onCreate;

  const CreateDeckWidget({required this.onCreate, super.key});

  @override
  State<CreateDeckWidget> createState() => _CreateDeckWidgetState();
}

class _CreateDeckWidgetState extends State<CreateDeckWidget> with SingleTickerProviderStateMixin {
  final TextEditingController _deckController = TextEditingController();
  bool _isValid = false;
  late AnimationController _animController;
  late Animation<double> _fadeAnimation;
  late Animation<Offset> _slideAnimation;

  @override
  void initState() {
    super.initState();
    _deckController.addListener(() {
      setState(() {
        _isValid = _deckController.text.trim().isNotEmpty;
      });
    });

    _animController = AnimationController(vsync: this, duration: const Duration(milliseconds: 600));
    _fadeAnimation = Tween<double>(begin: 0, end: 1).animate(CurvedAnimation(parent: _animController, curve: Curves.easeOut));
    _slideAnimation = Tween<Offset>(
      begin: const Offset(0, 0.1),
      end: Offset.zero,
    ).animate(CurvedAnimation(parent: _animController, curve: Curves.easeOutCubic));
    _animController.forward();
  }

  @override
  void dispose() {
    _deckController.dispose();
    _animController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final isDark = theme.brightness == Brightness.dark;
    const accentColor = Color(0xFF6366F1);

    return FadeTransition(
      opacity: _fadeAnimation,
      child: SlideTransition(
        position: _slideAnimation,
        child: Dialog(
          backgroundColor: Colors.transparent,
          elevation: 0,
          insetPadding: const EdgeInsets.symmetric(horizontal: 24, vertical: 24),
          child: Stack(
            children: [
              // Blurred background
              Positioned.fill(
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(32),
                  child: BackdropFilter(
                    filter: ImageFilter.blur(sigmaX: 30, sigmaY: 30),
                    child: Container(
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(32),
                        gradient: LinearGradient(
                          begin: Alignment.topLeft,
                          end: Alignment.bottomRight,
                          colors: isDark
                              ? [Colors.grey.shade900.withValues(alpha: 0.95), Colors.grey.shade900.withValues(alpha: 0.85)]
                              : [Colors.white.withValues(alpha: 0.95), Colors.white.withValues(alpha: 0.85)],
                        ),
                        border: Border.all(
                          color: isDark ? Colors.white.withValues(alpha: 0.1) : Colors.black.withValues(alpha: 0.08),
                          width: 1.5,
                        ),
                        boxShadow: [
                          BoxShadow(color: accentColor.withValues(alpha: 0.2), blurRadius: 60, spreadRadius: 20),
                          BoxShadow(
                            color: Colors.black.withValues(alpha: isDark ? 0.5 : 0.1),
                            blurRadius: 40,
                            offset: const Offset(0, 20),
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
              ),

              // Content
              ClipRRect(
                borderRadius: BorderRadius.circular(32),
                child: Container(
                  constraints: const BoxConstraints(maxWidth: 420),
                  padding: const EdgeInsets.all(28),
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      // Header
                      Row(
                        children: [
                          TweenAnimationBuilder<double>(
                            tween: Tween(begin: 0, end: 1),
                            duration: const Duration(milliseconds: 800),
                            curve: Curves.elasticOut,
                            builder: (context, value, child) {
                              return Transform.scale(
                                scale: value,
                                child: Container(
                                  padding: const EdgeInsets.all(14),
                                  decoration: BoxDecoration(
                                    gradient: const LinearGradient(colors: [accentColor, Color(0xFF8B5CF6)]),
                                    borderRadius: BorderRadius.circular(18),
                                    boxShadow: [
                                      BoxShadow(
                                        color: accentColor.withValues(alpha: 0.4),
                                        blurRadius: 20,
                                        offset: const Offset(0, 8),
                                      ),
                                    ],
                                  ),
                                  child: const Icon(Icons.auto_stories_rounded, color: Colors.white, size: 28),
                                ),
                              );
                            },
                          ),
                          const SizedBox(width: 16),
                          Expanded(
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  'Create Deck',
                                  style: TextStyle(
                                    fontSize: 24,
                                    fontWeight: FontWeight.bold,
                                    color: isDark ? Colors.white : Colors.black87,
                                    height: 1.2,
                                  ),
                                ),
                                const SizedBox(height: 2),
                                Text(
                                  'Start your learning journey',
                                  style: TextStyle(fontSize: 14, color: isDark ? Colors.grey.shade400 : Colors.grey.shade600),
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),

                      const SizedBox(height: 28),

                      // Deck Name Input
                      Text(
                        'Deck Name',
                        style: TextStyle(
                          fontSize: 13,
                          fontWeight: FontWeight.w700,
                          letterSpacing: 0.3,
                          color: isDark ? Colors.grey.shade300 : Colors.grey.shade700,
                        ),
                      ),
                      const SizedBox(height: 8),
                      Container(
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(14),
                          gradient: LinearGradient(
                            colors: isDark
                                ? [Colors.white.withValues(alpha: 0.07), Colors.white.withValues(alpha: 0.03)]
                                : [Colors.black.withValues(alpha: 0.03), Colors.black.withValues(alpha: 0.01)],
                          ),
                          border: Border.all(
                            color: isDark ? Colors.white.withValues(alpha: 0.1) : Colors.black.withValues(alpha: 0.08),
                            width: 1.5,
                          ),
                        ),
                        child: TextField(
                          controller: _deckController,
                          autofocus: true,
                          style: TextStyle(
                            fontSize: 15,
                            fontWeight: FontWeight.w500,
                            color: isDark ? Colors.white : Colors.black87,
                          ),
                          decoration: InputDecoration(
                            hintText: 'e.g., Spanish Vocabulary, Chemistry',
                            hintStyle: TextStyle(color: isDark ? Colors.grey.shade600 : Colors.grey.shade400),
                            border: InputBorder.none,
                            contentPadding: const EdgeInsets.all(16),
                            prefixIcon: const Icon(Icons.style_rounded, color: accentColor, size: 20),
                          ),
                          textCapitalization: TextCapitalization.sentences,
                        ),
                      ),

                      const SizedBox(height: 28),

                      // Action Buttons
                      Row(
                        children: [
                          Expanded(
                            child: _buildButton(
                              onPressed: () => Navigator.pop(context),
                              text: 'Cancel',
                              isPrimary: false,
                              isDark: isDark,
                            ),
                          ),
                          const SizedBox(width: 12),
                          Expanded(
                            flex: 2,
                            child: _buildButton(
                              onPressed: _isValid
                                  ? () {
                                      widget.onCreate(_deckController.text.trim());
                                      Navigator.pop(context);
                                    }
                                  : null,
                              text: 'Create Deck',
                              isPrimary: true,
                              isDark: isDark,
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildButton({required VoidCallback? onPressed, required String text, required bool isPrimary, required bool isDark}) {
    const accentColor = Color(0xFF6366F1);

    if (isPrimary) {
      return Container(
        decoration: BoxDecoration(
          gradient: onPressed != null ? const LinearGradient(colors: [accentColor, Color(0xFF8B5CF6)]) : null,
          color: onPressed == null ? Colors.grey : null,
          borderRadius: BorderRadius.circular(14),
          boxShadow: onPressed != null
              ? [BoxShadow(color: accentColor.withValues(alpha: 0.4), blurRadius: 16, offset: const Offset(0, 6))]
              : null,
        ),
        child: Material(
          color: Colors.transparent,
          child: InkWell(
            onTap: onPressed,
            borderRadius: BorderRadius.circular(14),
            child: Container(
              padding: const EdgeInsets.symmetric(vertical: 16),
              alignment: Alignment.center,
              child: Text(
                text,
                style: const TextStyle(color: Colors.white, fontSize: 15, fontWeight: FontWeight.bold, letterSpacing: 0.3),
              ),
            ),
          ),
        ),
      );
    } else {
      return Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(14),
          border: Border.all(color: isDark ? Colors.grey.shade700 : Colors.grey.shade300, width: 2),
        ),
        child: Material(
          color: Colors.transparent,
          child: InkWell(
            onTap: onPressed,
            borderRadius: BorderRadius.circular(14),
            child: Container(
              padding: const EdgeInsets.symmetric(vertical: 16),
              alignment: Alignment.center,
              child: Text(
                text,
                style: TextStyle(
                  color: isDark ? Colors.grey.shade300 : Colors.grey.shade700,
                  fontSize: 15,
                  fontWeight: FontWeight.w600,
                  letterSpacing: 0.3,
                ),
              ),
            ),
          ),
        ),
      );
    }
  }
}
