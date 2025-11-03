extension StringExtension on String {
  String get extractMessage {
    if (startsWith('Exception: ')) {
      return replaceFirst('Exception: ', '');
    }
    return this;
  }
}

extension StringExtensions on String {
  String capitalizeFirst() {
    if (isEmpty) return this;
    return this[0].toUpperCase() + substring(1);
  }

  String capitalizeEachWord() {
    if (isEmpty) return this;
    return split(' ').map((word) => word.capitalizeFirst()).join(' ');
  }
}
