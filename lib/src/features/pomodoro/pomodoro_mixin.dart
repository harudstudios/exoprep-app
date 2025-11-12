part of 'pomodoro_view.dart';

mixin PomodoroMixin on State<PomodoroView> {
  late PomodoroViewModel _pomodoroViewModel;
  late ProductivityProjectRepository productivityProjectRepository;

  @override
  void initState() {
    WidgetsBinding.instance.addPostFrameCallback((_) {
      productivityProjectRepository = ProductivityProjectRepository();
      _pomodoroViewModel = PomodoroViewModel(
        repository: productivityProjectRepository,
      );
      _pomodoroViewModel.productivityState.addListener(
        _handlePomodoroViewStateChange,
      );
    });
    super.initState();
  }

  Future<void> _handlePomodoroViewStateChange() async {
    final state = _pomodoroViewModel.productivityState.value;
    AppLogs.debug('Status: ${state.status} - Data: ${state.data}');
  }

  @override
  void dispose() {
    _pomodoroViewModel.dispose();
    super.dispose();
  }
}
