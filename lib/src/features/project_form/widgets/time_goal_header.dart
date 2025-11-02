import 'package:flutter/material.dart';
import 'package:root/src/core/extensions/context_extension.dart';

class TimeGoalHeader extends StatelessWidget {
  final bool isEnabled;

  final ValueChanged<bool> onToggle;

  const TimeGoalHeader({
    required this.isEnabled,
    required this.onToggle,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Container(
          width: 36,
          height: 36,
          decoration: BoxDecoration(
            color: const Color(0xFF2D7A6B),
            borderRadius: BorderRadius.circular(12),
          ),
          child: const Icon(
            Icons.track_changes,
            color: Colors.white,
            size: 24,
          ),
        ),
        const SizedBox(width: 16),
        Text('Time Goal', style: context.titleLarge),
        const Spacer(),
        Switch(
          value: isEnabled,
          onChanged: onToggle,
          activeThumbColor: Colors.white,
          activeTrackColor: const Color(0xFF34C759),
          inactiveThumbColor: Colors.white,
          inactiveTrackColor: Colors.grey.shade700,
        ),
      ],
    );
  }
}
