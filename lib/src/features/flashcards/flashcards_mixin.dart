//
// ignore_for_file: deprecated_member_use

part of 'flashcards_view.dart';

mixin FlashcardsMixin<T extends StatefulWidget> on State<T> {
  final FlashcardViewModel _viewModel = FlashcardViewModel();
  @override
  void dispose() {
    super.dispose();
  }

  void onFabPressed() {
    showDialog(
      context: context,
      builder: (context) => CreateFlashCardsCollectionWidget(
        onCreate: (title, tag, color) {
          log("Creating set: $title, $tag, $color");

          final dataModel = FlashCardsCollectionDataModel(title: title, tag: tag, color: color.value);

          _viewModel.createFlashCardsCollection(dataModel);
        },
      ),
    );
  }
}

extension ColorExtension on Color {
  String toHex() {
    return '#${value.toRadixString(16).padLeft(8, '0').toUpperCase()}';
  }
}
