import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:root/src/core/extensions/app_scope_extension.dart';
import 'package:root/src/core/extensions/context_extension.dart';

import 'package:root/src/core/logger/logger.dart';
import 'package:root/src/core/navigation/routes.dart';
import 'package:root/src/features/productivity/productivity_viewmodel.dart';
import 'package:root/src/features/productivity/widgets/horizontal_date_picker.dart';
import 'package:root/src/features/productivity/widgets/project_list_tile.dart';
import 'package:root/src/models/project_model/project_model.dart';

part 'productivity_mixin.dart';

class ProductivityView extends StatefulWidget {
  const ProductivityView({super.key});

  @override
  State<ProductivityView> createState() => _ProductivityViewState();
}

class _ProductivityViewState extends State<ProductivityView>
    with ProductivityMixin {
  @override
  Widget build(BuildContext context) {
    final viewModel = context.productivityViewModel;

    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Productivity',
          style: context.headlineSmall?.copyWith(
            fontWeight: FontWeight.w600,
          ),
        ),
        centerTitle: false,
        actions: [
          IconButton(
            icon: const Icon(Icons.settings_outlined),
            onPressed: () {
              // Settings action
            },
          ),
        ],
      ),
      body: SafeArea(
        child: CustomScrollView(
          // physics: const NeverScrollableScrollPhysics(),
          slivers: [
            const SliverToBoxAdapter(child: SizedBox(height: 12)),

            // Horizontal Date Picker
            SliverToBoxAdapter(
              child: HorizontalDatePicker(
                onDateSelected: viewModel.updateSelectedDate,
              ),
            ),

            const SliverToBoxAdapter(child: SizedBox(height: 20)),

            // "Your Projects" Title
            SliverPadding(
              padding: const EdgeInsets.symmetric(horizontal: 12),
              sliver: SliverToBoxAdapter(
                child: Text(
                  'Your Projects',
                  style: context.titleLarge?.copyWith(
                    fontWeight: FontWeight.w600,
                  ),
                ),
              ),
            ),

            const SliverToBoxAdapter(child: SizedBox(height: 12)),
            // ⭐ Project List with StreamBuilder
            ValueListenableBuilder<DateTime>(
              valueListenable: viewModel.selectedDate,
              builder: (context, selectedDate, child) {
                return StreamBuilder<List<ProjectModel>>(
                  stream: viewModel.watchProjectsForSelectedDate(),
                  builder: (context, snapshot) {
                    if (snapshot.connectionState == ConnectionState.waiting) {
                      return const SliverToBoxAdapter(
                        child: Center(
                          child: Padding(
                            padding: EdgeInsets.all(20),
                            child: CircularProgressIndicator(),
                          ),
                        ),
                      );
                    }

                    if (snapshot.hasError) {
                      return SliverToBoxAdapter(
                        child: Center(
                          child: Padding(
                            padding: const EdgeInsets.all(20),
                            child: Text(
                              'Error: ${snapshot.error}',
                              style: const TextStyle(color: Colors.red),
                            ),
                          ),
                        ),
                      );
                    }

                    final projects = snapshot.data ?? [];

                    if (projects.isEmpty) {
                      return SliverToBoxAdapter(
                        child: Center(
                          child: Padding(
                            padding: const EdgeInsets.all(40),
                            child: Column(
                              children: [
                                Icon(
                                  Icons.folder_off_outlined,
                                  size: 64,
                                  color: Colors.grey.shade400,
                                ),
                                const SizedBox(height: 16),
                                Text(
                                  'No projects found',
                                  style: context.titleMedium?.copyWith(
                                    color: Colors.grey.shade600,
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                      );
                    }

                    return SliverPadding(
                      padding: const EdgeInsets.symmetric(horizontal: 12),
                      sliver: SliverList(
                        delegate: SliverChildBuilderDelegate(
                          (context, index) {
                            final project = projects[index];
                            return Padding(
                              padding: const EdgeInsets.only(bottom: 12),
                              child: ProjectListTile(projectModel: project),
                            );
                          },
                          childCount: projects.length,
                        ),
                      ),
                    );
                  },
                );
              },
            ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadiusGeometry.circular(22),
        ),
        child: const Icon(
          Icons.add,
          color: Colors.white,
        ),
        onPressed: () {
          context.pushNamed(AppRoute.createProjectForm.name);
        },
      ),
      // floatingActionButton: const ThemeToggleSwitch(),
    );
  }
}
