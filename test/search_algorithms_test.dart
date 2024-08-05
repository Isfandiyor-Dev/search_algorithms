import 'package:test/test.dart';
import 'package:search_algorithms/search_algorithms.dart'; // O'zingizning paket yo'lingizni kiriting

void main() {
  group('SearchAlgorithms', () {
    List<String> sortedList = ['apple', 'banana', 'cherry', 'date', 'fig', 'grape'];
    List<String> unsortedList = ['grape', 'fig', 'apple', 'cherry', 'banana', 'date'];

    test('linearSearch finds the correct index', () {
      expect(SearchAlgorithms.linearSearch(sortedList, 'cherry'), equals(2));
      expect(SearchAlgorithms.linearSearch(sortedList, 'banana'), equals(1));
      expect(SearchAlgorithms.linearSearch(sortedList, 'grape'), equals(5));
      expect(SearchAlgorithms.linearSearch(sortedList, 'kiwi'), equals(-1));
    });

    test('binarySearch finds the correct index in sorted list', () {
      expect(SearchAlgorithms.binarySearch(list: sortedList, target: 'cherry', isSorted: true), equals(2));
      expect(SearchAlgorithms.binarySearch(list: sortedList, target: 'banana', isSorted: true), equals(1));
      expect(SearchAlgorithms.binarySearch(list: sortedList, target: 'grape', isSorted: true), equals(5));
      expect(SearchAlgorithms.binarySearch(list: sortedList, target: 'kiwi', isSorted: true), equals(-1));
    });

    test('binarySearch sorts and finds the correct index in unsorted list', () {
      expect(SearchAlgorithms.binarySearch(list: unsortedList, target: 'cherry', isSorted: false), equals(2));
      expect(SearchAlgorithms.binarySearch(list: unsortedList, target: 'banana', isSorted: false), equals(1));
      expect(SearchAlgorithms.binarySearch(list: unsortedList, target: 'grape', isSorted: false), equals(5));
      expect(SearchAlgorithms.binarySearch(list: unsortedList, target: 'kiwi', isSorted: false), equals(-1));
    });

    test('jumpSearch finds the correct index in sorted list', () {
      expect(SearchAlgorithms.jumpSearch(list: sortedList, target: 'cherry', isSorted: true), equals(2));
      expect(SearchAlgorithms.jumpSearch(list: sortedList, target: 'banana', isSorted: true), equals(1));
      expect(SearchAlgorithms.jumpSearch(list: sortedList, target: 'grape', isSorted: true), equals(5));
      expect(SearchAlgorithms.jumpSearch(list: sortedList, target: 'kiwi', isSorted: true), equals(-1));
    });

    test('jumpSearch sorts and finds the correct index in unsorted list', () {
      expect(SearchAlgorithms.jumpSearch(list: unsortedList, target: 'cherry', isSorted: false), equals(2));
      expect(SearchAlgorithms.jumpSearch(list: unsortedList, target: 'banana', isSorted: false), equals(1));
      expect(SearchAlgorithms.jumpSearch(list: unsortedList, target: 'grape', isSorted: false), equals(5));
      expect(SearchAlgorithms.jumpSearch(list: unsortedList, target: 'kiwi', isSorted: false), equals(-1));
    });
  });
}
