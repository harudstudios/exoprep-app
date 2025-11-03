import 'package:flutter/material.dart';
import 'package:root/src/core/extensions/context_extension.dart';
import 'package:root/src/core/extensions/string_extensions.dart';
import 'package:root/src/models/project_model/project_model.dart';

class ProjectListTile extends StatelessWidget {
  const ProjectListTile({
    required this.projectModel,
    super.key,
  });
  final ProjectModel projectModel;

  @override
  Widget build(BuildContext context) {
    final isDarkMode = context.isDarkMode;
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 20),
      decoration: BoxDecoration(
        color: isDarkMode ? const Color(0xFF1E1E1E) : Colors.grey.shade100,
        borderRadius: BorderRadius.circular(22),
      ),

      child: Row(
        children: [
          CircleAvatar(
            radius: 28,
            backgroundColor: Color(projectModel.tagColor),
            child: const Icon(
              Icons.play_arrow,
              color: Colors.white,
              size: 36,
            ),
          ),

          ProjectTileMiddleSection(
            projectName: projectModel.projectName ?? 'N/A',
            timeSpent: '0h 00m',
            totalTime: '0h 01m',
            colorTag: projectModel.tagColor,
            progress: 0.8,
          ),
        ],
      ),
    );
  }
}

class ProjectTileMiddleSection extends StatelessWidget {
  const ProjectTileMiddleSection({
    required this.projectName,
    required this.timeSpent,
    required this.totalTime,
    required this.progress,
    required this.colorTag,
    super.key,
  });

  final String projectName;
  final String timeSpent;
  final String totalTime;
  final double progress;
  final int colorTag;

  @override
  Widget build(BuildContext context) {
    final isDarkMode = context.isDarkMode;

    return Expanded(
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisSize: MainAxisSize.min,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  projectName.capitalizeEachWord(),
                  style: context.titleMedium?.copyWith(
                    fontWeight: FontWeight.bold,
                    // color: const Color(0xFFB8935E),
                    color: Color(colorTag),
                  ),
                  maxLines: 1,
                  overflow: TextOverflow.ellipsis,
                ),

                const Icon(Icons.arrow_forward_ios),
              ],
            ),
            const SizedBox(height: 6),

            Text(
              '$timeSpent / $totalTime',
              style: context.bodyLarge?.copyWith(fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 10),

            Row(
              children: [
                Expanded(
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(8),
                    child: LinearProgressIndicator(
                      value: progress,
                      minHeight: 16,
                      backgroundColor: isDarkMode
                          ? Colors.grey.shade800
                          : Colors.grey.shade300,
                      valueColor: AlwaysStoppedAnimation<Color>(
                        // isDarkMode
                        //     ? const Color(0xFFD4AF76)
                        //     : const Color(0xFFB8935E),
                        Color(colorTag),
                      ),
                    ),
                  ),
                ),
                const SizedBox(width: 8),
                Text(
                  '${(progress * 100).toInt()}%',
                  style: context.titleMedium?.copyWith(
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
