part of 'pomodoro_view.dart';

mixin PomodoroMixin on State<PomodoroView> {
  // late PomodoroViewModel _pomodoroViewModel;

  // @override
  // void initState() {
  //   WidgetsBinding.instance.addPostFrameCallback((_) {
  //     _pomodoroViewModel = context.pomodoroViewModel;
  //     _pomodoroViewModel.productivityState.addListener(
  //       _handlePomodoroViewStateChange,
  //     );
  //   });
  //   super.initState();
  // }

  // Future<void> _handlePomodoroViewStateChange() async {
  //   final state = context.pomodoroViewModel.productivityState.value;
  //   AppLogs.debug('Status: ${state.status} - Data: ${state.data}');
  // }

  // @override
  // void dispose() {
  //   _projectNameController.dispose();
  //   super.dispose();
  // }
}
