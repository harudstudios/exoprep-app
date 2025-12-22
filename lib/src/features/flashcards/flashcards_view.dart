import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:root/src/core/extensions/context_extension.dart';
import 'package:root/src/features/flashcards/flashcards_viewmodel.dart';
import 'package:root/src/features/flash_cards/models/data_model/flash_cards_collection_data_model.dart';
import 'package:root/src/features/flash_cards/views/create_flashcard_collection_widget.dart';

part 'flashcards_mixin.dart';

class DummyFlashcard {
  final String title;
  final String tag;
  final Color color;
  final int cardCount;

  const DummyFlashcard({required this.title, required this.tag, required this.color, this.cardCount = 10});
}

const List<DummyFlashcard> demoFlashcards = [
  DummyFlashcard(title: 'Flutter Basics', tag: 'Development', color: Colors.blueAccent, cardCount: 24),
  DummyFlashcard(title: 'Spanish Vocabulary', tag: 'Language', color: Colors.orangeAccent, cardCount: 150),
  DummyFlashcard(title: 'Chemical Elements', tag: 'Science', color: Colors.purpleAccent, cardCount: 118),
  DummyFlashcard(title: 'World Capitals', tag: 'Geography', color: Colors.greenAccent, cardCount: 195),
  DummyFlashcard(title: 'Git Commands', tag: 'DevOps', color: Colors.redAccent, cardCount: 30),
  DummyFlashcard(title: 'Music Theory', tag: 'Arts', color: Colors.tealAccent, cardCount: 45),
];

class FlashcardsView extends StatefulWidget {
  const FlashcardsView({super.key});

  @override
  State<FlashcardsView> createState() => _FlashcardsViewState();
}

class _FlashcardsViewState extends State<FlashcardsView> with FlashcardsMixin {
  @override
  void initState() {
    super.initState();

    _viewModel.initialize();
  }

  @override
  void dispose() {
    _viewModel.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    return Scaffold(
      floatingActionButton: FloatingActionButton(
        onPressed: onFabPressed,
        shape: const CircleBorder(),
        child: const Icon(Icons.add),
      ),
      body: CustomScrollView(
        slivers: [
          SliverAppBar(
            floating: true,
            snap: true,
            expandedHeight: 100,
            backgroundColor: theme.scaffoldBackgroundColor,
            surfaceTintColor: theme.colorScheme.surface,
            elevation: 0,
            actions: [
              IconButton(onPressed: () {}, icon: const Icon(Icons.search)),
              IconButton(onPressed: () {}, icon: const Icon(Icons.more_vert)),
            ],
            flexibleSpace: FlexibleSpaceBar(
              titlePadding: const EdgeInsets.symmetric(horizontal: 16, vertical: 16),
              centerTitle: false,
              title: Text(
                'Flashcards',
                style: TextStyle(color: theme.textTheme.bodyLarge?.color, fontWeight: FontWeight.bold),
              ),
            ),
          ),

          ValueListenableBuilder<bool>(
            valueListenable: _viewModel.isLoadingNotifier,
            builder: (context, isLoading, child) {
              if (isLoading) {
                return const SliverFillRemaining(child: Center(child: CircularProgressIndicator()));
              }

              return SliverPadding(
                padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 20),
                sliver: SliverGrid(
                  gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 2,
                    childAspectRatio: 0.88,
                    crossAxisSpacing: 12,
                    mainAxisSpacing: 12,
                  ),
                  delegate: SliverChildBuilderDelegate((context, index) {
                    final data = demoFlashcards[index];
                    final isDark = context.isDarkMode;

                    // --- Color Logic ---
                    final bgTopColor = isDark ? data.color.withValues(alpha: 0.30) : data.color.withValues(alpha: 0.12);

                    final bgBottomColor = isDark ? data.color.withValues(alpha: 0.20) : data.color.withValues(alpha: 0.18);

                    final borderColor = isDark ? data.color.withValues(alpha: 0.3) : Colors.white.withValues(alpha: 0.4);

                    final titleColor = isDark ? Colors.white.withValues(alpha: 0.95) : Colors.black.withValues(alpha: 0.8);

                    final decoIconColor = isDark ? data.color.withValues(alpha: 0.15) : data.color.withValues(alpha: 0.25);

                    final pillBgColor = isDark ? Colors.black.withValues(alpha: 0.3) : Colors.white.withValues(alpha: 0.7);

                    final pillTextColor = isDark ? data.color : data.color.withValues(alpha: 1);

                    return Material(
                      color: Colors.transparent,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(24),
                        side: BorderSide(color: borderColor),
                      ),
                      child: InkWell(
                        onTap: () {
                          // !TODO: Handle navigation
                        },
                        borderRadius: BorderRadius.circular(24),
                        splashColor: data.color.withValues(alpha: isDark ? 0.2 : 0.1),
                        highlightColor: data.color.withValues(alpha: isDark ? 0.1 : 0.05),
                        child: Container(
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(24),
                            gradient: LinearGradient(
                              begin: Alignment.topLeft,
                              end: Alignment.bottomRight,
                              colors: [bgTopColor, bgBottomColor],
                            ),
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
                                          '${data.cardCount} cards',
                                          style: TextStyle(fontWeight: FontWeight.w700, fontSize: 11, color: pillTextColor),
                                        ),
                                      ),
                                      // Bottom Title
                                      Text(
                                        data.title,
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
                  }, childCount: demoFlashcards.length),
                ),
              );
            },
          ),
        ],
      ),
    );
  }
}
