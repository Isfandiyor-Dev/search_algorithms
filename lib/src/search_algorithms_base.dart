import 'dart:math';
import 'package:search_algorithms_dart/utils/quick_sort.dart';

class SearchAlgorithms {
  // Linear search: searches the list sequentially for the target element.
  static int linearSearch(List<String> list, String target) {
    for (int i = 0; i < list.length; i++) {
      if (list[i] == target) {
        return i; // Element found, return its index
      }
    }
    return -1; // Element not found, return -1
  }

  // Binary search: searches the list using divide and conquer approach.
  // List must be sorted. If not sorted, set isSorted to false and it will sort the list first.
  static int binarySearch({
    required List<String> list,
    required String target,
    bool isSorted = false,
  }) {
    if (!isSorted) {
      list = List<String>.from(list)
          .quickSort(); // Sort the list if not already sorted
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

  // Jump search: searches the list by jumping ahead by a fixed step size.
  // List must be sorted. If not sorted, set isSorted to false and it will sort the list first.
  static int jumpSearch({
    required List<String> list,
    required String target,
    bool isSorted = false, // Default value set to false
  }) {
    if (!isSorted) {
      list = List<String>.from(list)
          .quickSort(); // Sort the list if not already sorted
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
}
