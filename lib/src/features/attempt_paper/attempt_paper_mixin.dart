part of 'attempt_paper_view.dart';

mixin AttemptPaperMixin on State<AttemptPaperView> {
  late AttemptPaperViewModel viewModel;

  @override
  void initState() {
    super.initState();
    viewModel = AttemptPaperViewModel();
    _loadData();
  }

  Future<void> _loadData() async {
    try {
      await viewModel.fetchAllData(examID: widget.paper.exam.id, paperID: widget.paper.id);
    } catch (e) {
      AppLogs.warning('Failed to load paper data: $e');
    }
  }

  Future<void> onRefresh() async {
    await viewModel.refreshData(examID: widget.paper.exam.id, paperID: widget.paper.id);
  }

  @override
  void dispose() {
    viewModel.dispose();
    super.dispose();
  }
}
