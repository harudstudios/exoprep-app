import 'package:expandable/expandable.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:root/src/core/common/ui/widgets/cupertino_time_picker.dart';
import 'package:root/src/core/common/ui/widgets/dotted_line.dart';
import 'package:root/src/core/extensions/context_extension.dart';
import 'package:root/src/features/productivity/project_form/project_frequency.dart';
import 'package:root/src/features/productivity/project_form/time_goal_header.dart';

class TimeGoalWidget extends StatefulWidget {
  const TimeGoalWidget({super.key});

  @override
  State<TimeGoalWidget> createState() => _TimeGoalWidgetState();
}

class _TimeGoalWidgetState extends State<TimeGoalWidget> {
  bool isTimeGoalEnabled = false;
  late ExpandableController _controller;

  @override
  void initState() {
    super.initState();
    _controller = ExpandableController(initialExpanded: isTimeGoalEnabled);
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  void _toggleTimeGoal(bool value) {
    setState(() {
      isTimeGoalEnabled = value;
      _controller.expanded = value;
    });
  }

  @override
  Widget build(BuildContext context) {
    final isDarkMode = context.isDarkMode;
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 8, vertical: 12),
      padding: const EdgeInsets.all(12),
      decoration: BoxDecoration(
        color: context.isDarkMode
            ? const Color(0xFF2A2A2A)
            : Colors.grey.shade100,
        borderRadius: BorderRadius.circular(14),
      ),
      child: ExpandablePanel(
        controller: _controller,
        theme: const ExpandableThemeData(
          hasIcon: false,
          tapBodyToCollapse: false,
          tapBodyToExpand: false,
          animationDuration: Duration(milliseconds: 500),
        ),
        header: TimeGoalHeader(
          isEnabled: isTimeGoalEnabled,
          onToggle: _toggleTimeGoal,
        ),
        collapsed: const SizedBox.shrink(),
        expanded: Padding(
          padding: const EdgeInsets.only(top: 16),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const DottedLine(
                dashWidth: 10,
                dashSpace: 5,
              ),

              const SizedBox(height: 12),

              Text(
                'Duration',
                style: context.titleMedium!.copyWith(
                  fontWeight: FontWeight.w600,
                ),
              ),

              const SizedBox(height: 8),

              GestureDetector(
                onTap: () {
                  HapticFeedback.lightImpact();
                  showDurationPicker(
                    context: context,
                    initialDuration: const Duration(hours: 1, minutes: 30),
                    onDurationSelected: (duration) {
                      debugPrint(
                        'Selected duration: ${duration.inHours}h ${duration.inMinutes.remainder(60)}m',
                      );
                    },
                  );
                },
                child: Container(
                  padding: const EdgeInsets.symmetric(
                    horizontal: 20,
                    vertical: 8,
                  ),
                  decoration: BoxDecoration(
                    color: isDarkMode
                        ? const Color(0xFF3A3A3A)
                        : Colors.grey.shade300,
                    borderRadius: BorderRadius.circular(12),
                  ),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text('1h 00m', style: context.bodyLarge),
                      Icon(
                        Icons.keyboard_arrow_down,
                        color: isDarkMode
                            ? Colors.grey.shade300
                            : Colors.grey.shade500,
                        size: 28,
                      ),
                    ],
                  ),
                ),
              ),

              const SizedBox(height: 16),
              Text(
                'Frequency',
                style: context.titleMedium!.copyWith(
                  fontWeight: FontWeight.w600,
                ),
              ),
              const SizedBox(height: 8),
              const FrequencyTabBarWithContent(),
            ],
          ),
        ),
      ),
    );
  }
}
