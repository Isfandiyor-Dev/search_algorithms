# search_algorithms

A Dart package providing various search algorithms with a quick sort utility for sorting lists of strings. This package includes implementations of linear search, binary search, and jump search, with an extension method for quick sort.

## Installation

Add the following to your `pubspec.yaml` file:

```yaml
dependencies:
  search_algorithms: ^1.0.0
```

Run `dart pub get` to install the package.

## Usage

### Importing the Package

```dart
import 'package:search_algorithms/search_algorithms.dart';
```

### Quick Sort Extension

This extension adds a `quickSort` method to the `List<String>` type for sorting strings using the QuickSort algorithm.

```dart
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
```

### Search Algorithms

#### Linear Search

Searches the list sequentially for the target element.

```dart
int linearSearch(List<String> list, String target) {
  for (int i = 0; i < list.length; i++) {
    if (list[i] == target) {
      return i; // Element found, return its index
    }
  }
  return -1; // Element not found, return -1
}
```

#### Binary Search

Searches the list using a divide and conquer approach. The list must be sorted. If not sorted, set `isSorted` to false and it will sort the list first.

```dart
int binarySearch({
  required List<String> list,
  required String target,
  bool isSorted = false,
}) {
  if (!isSorted) {
    list = List<String>.from(list).quickSort(); // Sort the list if not already sorted
  }

  int left = 0;
  int right = list.length - 1;

  while (left <= right) {
    int mid = left + (right - left) ~/ 2; // Calculate mid index

    if (list[mid] == target) {
      return mid; // Element found, return its index
    } else if (list[mid].compareTo(target) < 0) {
      left = mid + 1; // Search in the right half
    } else {
      right = mid - 1; // Search in the left half
    }
  }

  return -1; // Element not found, return -1
}
```

#### Jump Search

Searches the list by jumping ahead by a fixed step size. The list must be sorted. If not sorted, set `isSorted` to false and it will sort the list first.

```dart
int jumpSearch({
  required List<String> list,
  required String target,
  bool isSorted = false,
}) {
  if (!isSorted) {
    list = List<String>.from(list).quickSort(); // Sort the list if not already sorted
  }

  int n = list.length;
  int step = sqrt(n).toInt(); // Block size to be jumped
  int prev = 0;

  // Jump through the list until we find a block where the target might be
  while (list[min(step, n) - 1].compareTo(target) < 0) {
    prev = step;
    step += sqrt(n).toInt();
    if (prev >= n) {
      return -1; // Element not found, return -1
    }
  }

  // Linear search within the identified block
  for (int i = prev; i < min(step, n); i++) {
    if (list[i] == target) {
      return i; // Element found, return its index
    }
  }

  return -1; // Element not found, return -1
}
```

### Example

Here is an example of how to use the `SearchAlgorithms` class:

```dart
import 'package:search_algorithms/search_algorithms.dart';

void main() {
  List<String> list = ['apple', 'banana', 'cherry', 'date', 'fig', 'grape'];

  // Linear Search
  int linearResult = SearchAlgorithms.linearSearch(list, 'cherry');
  print('Linear Search: $linearResult'); // Output: Linear Search: 2

  // Binary Search
  int binaryResult = SearchAlgorithms.binarySearch(list: list, target: 'date');
  print('Binary Search: $binaryResult'); // Output: Binary Search: 3

  // Jump Search
  int jumpResult = SearchAlgorithms.jumpSearch(list: list, target: 'fig');
  print('Jump Search: $jumpResult'); // Output: Jump Search: 4
}
```

## License

This project is licensed under the MIT License - see the LICENSE file for details.

---
