part of 'questions_view.dart';

mixin QuestionsMixin on State<QuestionsView> {
  late final QuestionsViewModel viewModel;

  @override
  void initState() {
    super.initState();
    viewModel = QuestionsViewModel();
    viewModel.initializeQuestions(widget.questions);
  }

  void handleQuestionStates() {}

  @override
  void dispose() {
    viewModel.dispose();
    super.dispose();
  }
}
