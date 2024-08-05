import 'dart:math';

/// An extension on [List] that provides a quick sort algorithm.
extension QuickSortString on List<String> {
  /// Sorts the list using the QuickSort algorithm.
  ///
  /// Returns a new sorted list.
  List<String> quickSort() {
    if (length < 2) {
      return this;
    } else {
      String pivot = this[Random().nextInt(length)];
      List<String> left = [
        for (String element in this)
          if (element.compareTo(pivot) < 0) element
      ];
      List<String> equal = [
        for (String element in this)
          if (element.compareTo(pivot) == 0) element
      ];
      List<String> right = [
        for (String element in this)
          if (element.compareTo(pivot) > 0) element
      ];

      return left.quickSort() + equal + right.quickSort();
    }
  }
}
