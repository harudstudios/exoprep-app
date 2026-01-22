part of '../questions_view.dart';

class _QuitPaperDialog extends StatelessWidget {
  const _QuitPaperDialog({required this.attemptedCount, required this.totalQuestions});

  final int attemptedCount;
  final int totalQuestions;

  @override
  Widget build(BuildContext context) {
    final isDark = context.isDarkMode;

    return AlertDialog(
      backgroundColor: isDark ? const Color(0xFF1A1A1A) : Colors.white,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
      title: Row(
        children: [
          Icon(Icons.warning_amber_rounded, color: Colors.orange, size: 28),
          const SizedBox(width: 12),
          Text(
            'Quit Test?',
            style: TextStyle(
              fontSize: 20,
              fontWeight: FontWeight.bold,
              color: isDark ? const Color(0xFFE5E5E5) : const Color(0xFF1F2937),
            ),
          ),
        ],
      ),
      content: Column(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            'Are you sure you want to quit this test?',
            style: TextStyle(fontSize: 15, color: isDark ? const Color(0xFFD1D5DB) : const Color(0xFF4B5563)),
          ),
          const SizedBox(height: 16),
          Container(
            padding: const EdgeInsets.all(12),
            decoration: BoxDecoration(
              color: isDark ? const Color(0xFF0F0F0F) : const Color(0xFFF9FAFB),
              borderRadius: BorderRadius.circular(8),
              border: Border.all(color: isDark ? const Color(0xFF2A2A2A) : const Color(0xFFE5E7EB)),
            ),
            child: Column(
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      'Attempted:',
                      style: TextStyle(fontSize: 14, color: isDark ? const Color(0xFF9CA3AF) : const Color(0xFF6B7280)),
                    ),
                    Text(
                      '$attemptedCount / $totalQuestions',
                      style: TextStyle(
                        fontSize: 14,
                        fontWeight: FontWeight.w600,
                        color: isDark ? const Color(0xFFE5E5E5) : const Color(0xFF1F2937),
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
          const SizedBox(height: 12),
          Row(
            children: [
              Icon(Icons.info_outline, size: 16, color: Colors.orange),
              const SizedBox(width: 8),
              Expanded(
                child: Text(
                  'Your progress will be lost',
                  style: TextStyle(fontSize: 13, color: Colors.orange, fontWeight: FontWeight.w500),
                ),
              ),
            ],
          ),
        ],
      ),
      actions: [
        TextButton(
          onPressed: () => Navigator.of(context).pop(false),
          style: TextButton.styleFrom(padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 12)),
          child: Text(
            'Cancel',
            style: TextStyle(fontSize: 15, color: isDark ? const Color(0xFF9CA3AF) : const Color(0xFF6B7280)),
          ),
        ),
        FilledButton(
          onPressed: () => Navigator.of(context).pop(true),
          style: FilledButton.styleFrom(
            backgroundColor: Colors.red,
            padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 12),
          ),
          child: const Text('Quit Test', style: TextStyle(fontSize: 15, color: Colors.white)),
        ),
      ],
    );
  }
}
