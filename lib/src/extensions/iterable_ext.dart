// Copyright (c) 2019, Google Inc. Please see the AUTHORS file for details.
// All rights reserved. Use of this source code is governed by a BSD-style
// license that can be found in the LICENSE file.

/// Utility extension methods for the native [Iterable] class.
extension IterableBasics<E> on Iterable<E> {
  /// Alias for [Iterable]`.every`.
  bool all(bool test(E element)) => every(test);

  /// Returns `true` if no element of [this] satisfies [test].
  ///
  /// Example:
  /// ```dart
  /// [1, 2, 3].none((e) => e > 4); // true
  /// [1, 2, 3].none((e) => e > 2); // false
  /// ```
  bool none(bool test(E element)) => !any(test);

  /// Returns `true` if there is exactly one element of [this] which satisfies
  /// [test].
  ///
  /// Example:
  /// ```dart
  /// [1, 2, 3].one((e) => e == 2); // 1 element satisfies. Returns true.
  /// [1, 2, 3].one((e) => e > 4); // No element satisfies. Returns false.
  /// [1, 2, 3].one((e) => e > 1); // >1 element satisfies. Returns false.
  /// ```
  bool one(bool test(E element)) {
    bool foundOne = false;
    for (final e in this) {
      if (test(e)) {
        if (foundOne) {
          return false;
        }
        foundOne = true;
      }
    }
    return foundOne;
  }

  /// Returns `true` if [this] contains at least one element also contained in
  /// [other].
  ///
  /// Example:
  /// ```dart
  /// [1, 2, 3].containsAny([5, 2]); // true
  /// [1, 2, 3].containsAny([4, 5, 6]); // false
  /// ```
  bool containsAny(Iterable<E> other) => any(other.contains);

  /// Returns true if every element in [other] also exists in [this].
  ///
  /// Example:
  /// ```dart
  /// [1, 2, 3].containsAll([1, 2]); // true
  /// [1, 2].containsAll([1, 2, 3]); // false
  /// ```
  ///
  /// If [collapseDuplicates] is true, only the presence of a value will be
  /// considered, not the number of times it occurs. If [collapseDuplicates] is
  /// false, the number of occurrences of a given value in [this] must be
  /// greater than or equal to the number of occurrences of that value in
  /// [other] for the result to be true.
  ///
  /// Example:
  /// ```
  /// [1, 2, 3].containsAll([1, 1, 1, 2]); // true
  /// [1, 2, 3].containsAll([1, 1, 1, 2], collapseDuplicates: false); // false
  /// [1, 1, 2, 3].containsAll([1, 1, 2], collapseDuplicates: false); // true
  /// ```
  bool containsAll(Iterable<E> other, {bool collapseDuplicates = true}) {
    if (other.isEmpty) {
      return true;
    }
    if (collapseDuplicates) {
      return Set<E>.from(this).containsAll(Set<E>.from(other));
    }

    final thisElementCounts = _elementCountsIn<E>(this);
    final otherElementCounts = _elementCountsIn<E>(other);

    for (final element in otherElementCounts.keys) {
      final countInThis = thisElementCounts[element] ?? 0;
      if (countInThis < otherElementCounts[element]) {
        return false;
      }
    }
    return true;
  }

  /// Returns the sum of all the values in this iterable, as defined by
  /// [addend].
  ///
  /// Returns 0 if [this] is empty.
  ///
  /// Example:
  /// ```dart
  /// ['a', 'aa', 'aaa'].sum((s) => s.length); // 6.
  /// ```
  num sum(num Function(E) addend) {
    if (isEmpty) {
      return 0;
    }
    return fold(0, (prev, element) => prev + addend(element));
  }
}

/// Utility extension methods for [Iterable]s containing [num]s.
extension NumIterableBasics<E extends num> on Iterable<E> {
  /// Returns the sum of all the values in this iterable.
  ///
  /// If [addend] is provided, it will be used to compute the value to be
  /// summed.
  ///
  /// Returns 0 if [this] is empty.
  ///
  /// Example:
  /// ```dart
  /// [1, 2, 3].sum(); // 6.
  /// [1, 2, 3].sum((i) => i * 3); // 18.
  /// [].sum() // 0.
  /// ```
  num sum([num Function(E) addend]) {
    if (isEmpty) {
      return 0;
    }
    return addend == null
        ? reduce((a, b) => a + b)
        : fold(0, (prev, element) => prev + addend(element));
  }
}

Map<E, int> _elementCountsIn<E>(Iterable<E> iterable) {
  final counts = <E, int>{};
  for (final element in iterable) {
    final currentCount = counts[element] ?? 0;
    counts[element] = currentCount + 1;
  }
  return counts;
}
