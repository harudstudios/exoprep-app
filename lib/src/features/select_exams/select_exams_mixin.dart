part of 'select_exams_view.dart';

mixin SelectExamsMixin on State<SelectExamsView> {
  late final SelectExamsViewModel _viewModel;
  final Set<String> selectedExamIds = {};
  List<Exam> exams = [];

  @override
  void initState() {
    super.initState();
    _viewModel = SelectExamsViewModel();
    WidgetsBinding.instance.addPostFrameCallback((_) => _viewModel.selectExamState.addListener(_handleExamStateChange));
    _fetchExams();
  }

  Future<void> _handleExamStateChange() async {
    final state = _viewModel.selectExamState.value;

    if (state.status == ViewModelStatus.success && state.type == SelectExamSuccessType.examUpdated.toString()) {
      context.go(AppRoute.home.path);
    } else if (state.status == ViewModelStatus.error && state.type == SelectExamErrorType.examUpdateError.toString()) {
      AppToasts.showError(
        context,
        title: "Update Failed",
        description: "We couldn’t update your exam. Please try again in a moment.",
      );
    }
  }

  Future<void> _fetchExams() async {
    await _viewModel.getExams();
    if (mounted) setState(() => exams = _viewModel.exams);
  }

  void toggleExam(String id) {
    setState(() {
      if (selectedExamIds.contains(id)) {
        selectedExamIds.remove(id);
      } else {
        selectedExamIds.add(id);
      }
    });
  }

  bool isSelected(String id) => selectedExamIds.contains(id);

  @override
  void dispose() {
    super.dispose();
  }
}
