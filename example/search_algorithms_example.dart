import 'package:search_algorithms/search_algorithms.dart';

void main() {
  // Linear search example. List does not need to be sorted.
  List<String> list = [
    'fig',
    'grape',
    'date',
    'banana',
    'cherry',
    'apple',
  ];
  print(SearchAlgorithms.linearSearch(list, 'banana')); // Output: 3

  /*
  Binary search example. The list must be sorted.
  If your list is already sorted, set isSorted to true.
  If the list is not sorted, set isSorted to false and it will sort the list before searching.
  This helps improve the search efficiency.
  */
  List<String> listSorted = [
    'apple',
    'banana',
    'cherry',
    'date',
    'fig',
    'grape'
  ];

  print(
    SearchAlgorithms.binarySearch(
      list: listSorted,
      target: 'banana',
      isSorted: true,
    ),
  ); // Output: 1

  /*
  Jump search example. The list must be sorted.
  If your list is already sorted, set isSorted to true.
  If the list is not sorted, set isSorted to false and it will sort the list before searching.
  */
  print(
    SearchAlgorithms.jumpSearch(
      list: listSorted,
      target: 'banana',
      isSorted: true,
    ),
  ); // Output: 1
}
