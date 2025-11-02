part of 'project_form_view.dart';

mixin ProductivityMixin on State<ProjectFormView> {
  late ProductivityViewModel _productivityViewModel;

  final TextEditingController _projectNameController = TextEditingController();
  // Add this getter
  TextEditingController get projectNameController => _projectNameController;
  // final _projectService = ProjectLocalService();
  @override
  void initState() {
    WidgetsBinding.instance.addPostFrameCallback((_) {
      _productivityViewModel = context.productivityViewModel;
      _productivityViewModel.productivityState.addListener(
        _handleProductivityStateChange,
      );
    });
    _initService();
    super.initState();
  }

  Future<void> _initService() async {
    // await _projectService.initialize();
    setState(() {});
  }

  Future<void> _handleProductivityStateChange() async {
    final state = context.productivityViewModel.productivityState.value;
    AppLogs.debug('Status: ${state.status} - Data: ${state.data}');
  }

  @override
  void dispose() {
    _projectNameController.dispose();
    super.dispose();
  }
}
