part of '../questions_view.dart';

class _TimerWidget extends StatelessWidget {
  const _TimerWidget({required this.viewModel});

  final QuestionsViewModel viewModel;

  @override
  Widget build(BuildContext context) {
    final isDark = context.isDarkMode;

    return ValueListenableBuilder<int>(
      valueListenable: viewModel.remainingSeconds,
      builder: (context, seconds, _) {
        final isCritical = viewModel.isTimerCritical;

        return Container(
          padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 6),
          decoration: BoxDecoration(
            color: isCritical ? Colors.red.withValues(alpha: 0.1) : (isDark ? const Color(0xFF1A1A1A) : Colors.white),
            borderRadius: BorderRadius.circular(20),
            border: Border.all(
              color: isCritical ? Colors.red : (isDark ? const Color(0xFF2A2A2A) : const Color(0xFFE5E7EB)),
              width: 1.5,
            ),
          ),
          child: Row(
            mainAxisSize: MainAxisSize.min,
            children: [
              Icon(
                Icons.timer_outlined,
                size: 18,
                color: isCritical ? Colors.red : (isDark ? const Color(0xFFE5E5E5) : const Color(0xFF1F2937)),
              ),
              const SizedBox(width: 6),
              Text(
                viewModel.getFormattedTime(),
                style: TextStyle(
                  fontSize: 14,
                  fontWeight: FontWeight.w600,
                  color: isCritical ? Colors.red : (isDark ? const Color(0xFFE5E5E5) : const Color(0xFF1F2937)),
                ),
              ),
            ],
          ),
        );
      },
    );
  }
}

class _AutoSubmitDialog extends StatelessWidget {
  const _AutoSubmitDialog();

  @override
  Widget build(BuildContext context) {
    final isDark = context.isDarkMode;

    return PopScope(
      canPop: false,
      child: AlertDialog(
        backgroundColor: isDark ? const Color(0xFF1A1A1A) : Colors.white,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
        content: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Icon(Icons.timer_off_outlined, size: 48, color: Colors.orange),
            const SizedBox(height: 16),
            Text(
              'Time\'s Up!',
              style: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.bold,
                color: isDark ? const Color(0xFFE5E5E5) : const Color(0xFF1F2937),
              ),
            ),
            const SizedBox(height: 8),
            Text(
              'Auto-submitting your test...',
              textAlign: TextAlign.center,
              style: TextStyle(fontSize: 14, color: isDark ? const Color(0xFF9CA3AF) : const Color(0xFF6B7280)),
            ),
            const SizedBox(height: 20),
            CircularProgressIndicator(color: context.colorScheme.primary),
          ],
        ),
      ),
    );
  }
}
