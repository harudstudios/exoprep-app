import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:root/src/core/extensions/context_extension.dart';
import 'package:root/src/core/theme/colors.dart';
import 'package:root/src/features/leaderboard/cubit/leaderboard_cubit.dart';

class ExamSelector extends StatelessWidget {
  const ExamSelector({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            "Leaderboard",
            style: TextStyle(
              color: context.isDarkMode ? Colors.white : Colors.black87,
              fontSize: 18,
              fontWeight: FontWeight.bold,
            ),
          ),
          // THE "SHORT BUTTON" AT THE RIGHT CORNER
          GestureDetector(
            onTap: () => _showPaperPicker(context),
            child: Container(
              padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 6),
              decoration: BoxDecoration(
                color: (context.isDarkMode ? Colors.white : Colors.black).withValues(alpha: 0.08),
                borderRadius: BorderRadius.circular(20),
                border: Border.all(color: (context.isDarkMode ? Colors.white : Colors.black).withValues(alpha: 0.1)),
              ),
              child: Row(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Icon(Icons.description_outlined, size: 14, color: context.isDarkMode ? Colors.amber : Colors.blueGrey),
                  const SizedBox(width: 6),
                  ValueListenableBuilder(
                    valueListenable: context.read<LeaderboardCubit>().selectedExam,
                    builder: (context, value, child) {
                      return Text(
                        context.read<LeaderboardCubit>().selectedExam.value!.name,
                        style: TextStyle(
                          color: context.isDarkMode ? Colors.white : Colors.black87,
                          fontSize: 11,
                          fontWeight: FontWeight.w600,
                        ),
                      );
                    },
                  ),
                  Icon(Icons.keyboard_arrow_down, size: 14, color: context.isDarkMode ? Colors.white : Colors.black87),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }

  void _showPaperPicker(BuildContext context) {
    final cubit = context.read<LeaderboardCubit>();
    showModalBottomSheet(
      context: context,
      isScrollControlled: true,
      backgroundColor: Colors.transparent,
      builder: (context) {
        return StatefulBuilder(
          builder: (context, setModalState) {
            return Container(
              height: MediaQuery.of(context).size.height * 0.55,
              decoration: BoxDecoration(
                color: context.isDarkMode ? AppColors.darkBackgroundColor : AppColors.lightBackgroundColor,
                borderRadius: const BorderRadius.vertical(top: Radius.circular(30)),
                border: Border.all(color: Colors.white.withValues(alpha: 0.1)),
              ),
              child: Column(
                children: [
                  const SizedBox(height: 12),
                  Container(
                    width: 40,
                    height: 4,
                    decoration: BoxDecoration(color: Colors.grey.withValues(alpha: 0.3), borderRadius: BorderRadius.circular(2)),
                  ),
                  const Padding(
                    padding: EdgeInsets.fromLTRB(24, 20, 24, 10),
                    child: Text("Select Exam", style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
                  ),

                  Expanded(
                    child: ListView.builder(
                      padding: const EdgeInsets.symmetric(horizontal: 16),
                      itemCount: cubit.allExams.length,
                      itemBuilder: (context, index) {
                        final paper = cubit.allExams[index];
                        final bool isSelected = paper == cubit.selectedExam.value;
                        return ListTile(
                          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
                          tileColor: isSelected ? context.primaryColor.withValues(alpha: 0.1) : Colors.transparent,
                          leading: Icon(Icons.article_outlined, color: isSelected ? context.primaryColor : Colors.grey),
                          title: Text(
                            paper.name,
                            style: TextStyle(
                              fontWeight: isSelected ? FontWeight.bold : FontWeight.normal,
                              color: isSelected
                                  ? context.primaryColor
                                  : context.isDarkMode
                                  ? Colors.white
                                  : Colors.black,
                            ),
                          ),
                          trailing: isSelected ? Icon(Icons.check_circle, color: context.primaryColor, size: 20) : null,
                          onTap: () {
                            cubit.selectedExam.value = paper;
                            cubit.getLeaderboardData(paper.id, showLoading: true);
                            Navigator.pop(context);
                          },
                        );
                      },
                    ),
                  ),
                ],
              ),
            );
          },
        );
      },
    );
  }
}
