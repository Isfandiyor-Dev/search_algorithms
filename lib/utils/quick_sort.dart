import 'dart:math';

extension QuickSortString on List<String> {
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

