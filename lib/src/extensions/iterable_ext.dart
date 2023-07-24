// Copyright (c) 2019, Google Inc. Please see the AUTHORS file for details.
// All rights reserved. Use of this source code is governed by a BSD-style
// license that can be found in the LICENSE file.

import 'dart:math';

/// Utility extension methods for the native [Iterable] class.
extension VxIterableBasics<E> on Iterable<E> {
  /// Alias for [Iterable]`.every`.
  bool all(bool Function(E element) test) => every(test);

  /// Returns `true` if no element of [this] satisfies [test].
  ///
  /// Example:
  /// ```dart
  /// [1, 2, 3].none((e) => e > 4); // true
  /// [1, 2, 3].none((e) => e > 2); // false
  /// ```
  bool none(bool Function(E element) test) => !any(test);

  /// Returns `true` if there is exactly one element of [this] which satisfies
  /// [test].
  ///
  /// Example:
  /// ```dart
  /// [1, 2, 3].one((e) => e == 2); // 1 element satisfies. Returns true.
  /// [1, 2, 3].one((e) => e > 4); // No element satisfies. Returns false.
  /// [1, 2, 3].one((e) => e > 1); // >1 element satisfies. Returns false.
  /// ```
  bool one(bool Function(E element) test) {
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
      if (countInThis < otherElementCounts[element]!) {
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

extension IterableBasics2<T> on Iterable<T> {
  /// Returns the sum of all values produced by the [selector] function that is
  /// applied to each element.
  ///
  /// Example:
  /// ```dart
  /// [2, 4, 6].sumBy((n) => n);                   // 12
  /// ['hello', 'flutter'].sumBy((s) => s.length); // 12
  /// ```
  int sumBy(int Function(T) selector) {
    ArgumentError.checkNotNull(selector, 'selector');
    return map(selector).fold(0, (prev, curr) => prev + curr);
  }

  /// Returns the sum of all values produced by the [selector] function that is
  /// applied to each element.
  ///
  /// Example:
  /// ```dart
  /// [1.5, 2.5].sumByDouble((d) => 0.5 * d); // 2.0
  /// ```
  double sumByDouble(num Function(T) selector) {
    ArgumentError.checkNotNull(selector, 'selector');
    return map(selector).fold(0.0, (prev, curr) => prev + curr);
  }

  /// Returns the average value (arithmetic mean) of all values produces by the
  /// [selector] function that is applied to each element.
  ///
  /// Example:
  /// ```dart
  /// [1, 2, 3].averageBy((n) => n);               // 2.0
  /// ['cat', 'horse'].averageBy((s) => s.length); // 4.0
  /// ```
  double? averageBy(num Function(T) selector) {
    ArgumentError.checkNotNull(selector, 'selector');
    if (isEmpty) {
      return null;
    }

    return sumByDouble(selector) / length;
  }

  /// Splits the elements into lists of the specified [size].
  ///
  /// You can specify an optional [fill] function that produces values
  /// that fill up the last chunk to match the chunk size.
  ///
  /// Example:
  /// ```dart
  /// [1, 2, 3, 4, 5, 6].chunked(2);        // [[1, 2], [3, 4], [5, 6]]
  /// [1, 2, 3].chunked(2);                 // [[1, 2], [3]]
  /// [1, 2, 3].chunked(2, fill: () => 99); // [[1, 2], [3, 99]]
  /// ```
  Iterable<List<T>> chunked(int size, {T Function()? fill}) {
    ArgumentError.checkNotNull(size, 'chunkSize');
    if (size <= 0) {
      throw ArgumentError('chunkSize must be positive integer greater than 0.');
    }

    if (isEmpty) {
      return const Iterable.empty();
    }

    final countOfChunks = (length / size.toDouble()).ceil();

    return Iterable.generate(countOfChunks, (int index) {
      final chunk = skip(index * size).take(size).toList();

      if (fill != null) {
        while (chunk.length < size) {
          chunk.add(fill());
        }
      }

      return chunk;
    });
  }

  /// Returns the number of elements that matches the [test].
  ///
  /// If not [test] is specified it will count every element.
  ///
  /// Example:
  /// ```dart
  /// [1, 2, 3, 13, 14, 15].count();             // 6
  /// [1, 2, 3, 13, 14, 15].count((n) => n > 9); // 3
  /// ```
  int count([bool Function(T element)? test]) {
    test ??= (_) => true;

    if (isEmpty) {
      return 0;
    }

    return map((element) => test!(element) ? 1 : 0)
        .reduce((value, element) => value + element);
  }

  /// Returns a new [Iterable] with all elements that satisfy the
  /// predicate [test].
  ///
  /// Example:
  /// ```dart
  /// [1, 2, 3, 4].filter((n) => n < 3).toList(); // [1,2]
  /// ```
  ///
  /// This method is an alias for [where].
  Iterable<T> filter(bool Function(T element) test) {
    ArgumentError.checkNotNull(test, 'test');
    return where(test);
  }

  /// Applies the function [funcIndexValue] to each element of this collection
  /// in iteration order. The function receives the element index as first
  /// parameter [index] and the [element] as the second parameter.
  ///
  /// Example:
  /// ```dart
  /// ['a', 'b', 'c'].forEachIndex((index, value) {
  ///   print('$index : $value'); // '0 : a', '1: b', '2: c'
  /// });
  /// ```
  void forEachIndexed(void Function(int index, T element) funcIndexValue) {
    ArgumentError.checkNotNull(funcIndexValue, 'funcIndexValue');
    var index = 0;
    final iter = iterator;
    while (iter.moveNext()) {
      funcIndexValue(index++, iter.current);
    }
  }

  /// Returns the [index]th element. If the index is out of bounds the [orElse]
  /// supplier function is called to provide a value.
  ///
  /// Example:
  /// ```dart
  /// ['a', 'b'].elementAtOrElse(2, () => ''); // ''
  /// ```
  T elementAtOrElse(int index, T Function() orElse) {
    RangeError.checkNotNegative(index, 'index');
    ArgumentError.checkNotNull(index);
    ArgumentError.checkNotNull(orElse, 'orElse');

    try {
      return elementAt(index);
    } catch (error) {
      return orElse();
    }
  }

  /// Returns the first element. If there is no first element the [orElse]
  /// supplier function is called to provide a value.
  ///
  /// Example:
  /// ```dart
  /// ['a', 'b'].firstOrElse(() => ''); // 'a'
  /// [].firstOrElse(() => '');         // ''
  /// ```
  T firstOrElse(T Function() orElse) {
    ArgumentError.checkNotNull(orElse, 'orElse');
    return firstWhere((_) => true, orElse: orElse);
  }

  /// Returns the first element. If there is no first element it will
  /// return [null].
  ///
  /// Example:
  /// ```dart
  /// ['a', 'b'].firstOrNull(); // 'a'
  /// [].firstOrNull();         // null
  /// ```
  T firstOrNull() {
    return firstOrElse(() => null as T);
  }

  /// Returns the last element. If there is no last element the [orElse]
  /// supplier function is called to provide a value.
  ///
  /// Example:
  /// ```dart
  /// ['a', 'b'].lastOrElse(() => ''); // 'a'
  /// [].lastOrElse(() => '');         // ''
  /// ```
  T lastOrElse(T Function() orElse) {
    ArgumentError.checkNotNull(orElse, 'orElse');
    return lastWhere((_) => true, orElse: orElse);
  }

  /// Returns the last element. If there is no last element it will
  /// return [null].
  ///
  /// Example:
  /// ```dart
  /// ['a', 'b'].lastOrElse(); // 'a'
  /// [].lastOrElse();         // null
  /// ```
  T lastOrNull() {
    return lastOrElse(() => null as T);
  }

  /// Groups the elements of the list into a map by a key
  /// that is defined by a [keySelector] function.
  ///
  /// The optional [valueTransform] function can be used to
  /// remap your elements.
  ///
  /// Example:
  /// ```dart
  /// var map = [1, 2, 3, 97, 98, 99].groupBy((n) => n < 10 ? 'smallNumbers' : 'largeNumbers')
  /// // map = {'smallNumbers': [1, 2, 3], 'largeNumbers': [97, 98, 99]}
  /// ```
  ///
  /// ```dart
  /// List<Person> persons = [
  ///     Person(name: 'John', age: 21),
  ///     Person(name: 'Carl', age: 18),
  ///     Person(name: 'Peter', age: 56),
  ///     Person(name: 'Sarah', age: 61)
  /// ];
  /// var map = persons.groupBy((p) => p.age < 40 ? 'young' : 'old',
  ///        valueTransform: (p) => p.name);
  /// // map = {'young': ['John', 'Carl'], 'old': ['Peter', 'Sarah']}
  /// ```
  Map<K, List<V>> groupBy<K, V>(K Function(T element) keySelector,
      {V Function(T element)? valueTransform}) {
    ArgumentError.checkNotNull(keySelector);

    valueTransform ??= (element) => element as V;

    final map = <K, List<V>>{};

    forEach((element) {
      final key = keySelector(element);

      if (!map.containsKey(key)) {
        map[key] = [];
      }
      map[key]!.add(valueTransform!(element));
    });

    return map;
  }

  /// Returns a map that contains [MapEntry]s provided by a [transform] function.
  ///
  /// If two elements share the same key, the last one gets added to the map.
  ///
  /// Example:
  /// ```dart
  /// [1, 2, 3].associate((e) => MapEntry('key_$e', e * 100)); // {'key_1': 100, 'key_2': 200, 'key_3': 300}
  /// ```
  Map<K, V> associate<K, V>(MapEntry<K, V> Function(T element) transform) {
    ArgumentError.checkNotNull(transform, 'transform');
    return Map.fromEntries(map(transform));
  }

  /// Returns a map where every [element] is associated by a key produced from
  /// the [keySelector] function.
  ///
  /// If two elements share the same key, the last one gets added to the map.
  ///
  /// Example:
  /// ```dart
  /// ['a', 'ab', 'abc'].associateBy((e) => e.length); // {1: 'a', 2: 'ab', 3: 'abc'}
  /// ```
  Map<K, T> associateBy<K>(K Function(T element) keySelector) {
    ArgumentError.checkNotNull(keySelector, 'keySelector');
    final map = <K, T>{};
    forEach((element) {
      final key = keySelector(element);
      map[key] = element;
    });
    return map;
  }

  /// Returns a map where every [element] is used as a key that is associated
  /// with a value produced by the [valueSelector] function.
  ///
  /// Example:
  /// ```dart
  /// [1, 2, 3].associateWith((e) => e * 1000); // {1: 1000, 2: 2000, 3: 3000}
  /// ```
  Map<T, V> associateWith<V>(V Function(T element) valueSelector) {
    ArgumentError.checkNotNull(valueSelector, 'valueSelector');
    final map = <T, V>{};
    forEach((element) {
      map[element] = valueSelector(element);
    });
    return map;
  }

  /// Returns the minimal value based on the [comparator] function.
  ///
  /// Example:
  /// ```dart
  /// [1, 0, 2].minBy((a, b) => a.compareTo(b));       // 0
  /// persons.minBy((a, b) => a.age.compareTo(b.age)); // the youngest person
  /// ```
  T? minimumBy(Comparator<T> comparator) {
    ArgumentError.checkNotNull(comparator, 'comparator');
    if (isEmpty) {
      return null;
    }
    return reduce(
        (value, element) => comparator(value, element) < 0 ? value : element);
  }

  /// Returns the maximum value based on the [comparator] function.
  ///
  /// Example:
  /// ```dart
  /// [90, 10, 20, 30].maxBy((a, b) => a.compareTo(b)); // 90
  /// persons.maxBy((a, b) => a.age.compareTo(b.age));  // the oldest person
  /// ```
  T? maximumBy(Comparator<T> comparator) {
    ArgumentError.checkNotNull(comparator, 'comparator');
    if (isEmpty) {
      return null;
    }
    return reduce(
        (value, element) => comparator(value, element) > 0 ? value : element);
  }

  /// Returns this as sorted list using the [comparator] function.
  ///
  /// Example:
  /// ```dart
  /// [3, 1, 5, 9, 7].sortedBy((a,b) => a.compareTo(b)); // [1, 3, 5, 7, 9]
  /// ```
  List<T> sortedBy(Comparator<T> comparator) {
    ArgumentError.checkNotNull(comparator, 'comparator');
    final list = toList();
    list.sort(comparator);
    return list;
  }

  /// Returns this as sorted list using the [valueProvider] function that produces
  /// numerical values as base for sorting.
  ///
  /// Example:
  /// ```dart
  /// [2, 1, 3].sortedByNum((n) => n); // [1, 2, 3]
  /// persons.sortedByNum((p) => p.age).reversed; // oldest persons first
  /// ```
  List<T> sortedByNum(num Function(T element) valueProvider) {
    ArgumentError.checkNotNull(valueProvider, 'valueProvider');
    return sortedBy((a, b) => valueProvider(a).compareTo(valueProvider(b)));
  }

  /// Returns this as sorted list using the [valueProvider] function that produces
  /// character values as base for sorting.
  ///
  /// Example:
  /// ```dart
  /// ['c', 'b', 'a'].sortedByNum((c) => c); // ['a', 'b', 'c']
  /// persons.sortedByString((p) => p.name); // sort persons alphabetically
  /// ```
  List<T> sortedByString(String Function(T element) valueProvider) {
    ArgumentError.checkNotNull(valueProvider, 'valueProvider');
    return sortedBy((a, b) => valueProvider(a).compareTo(valueProvider(b)));
  }

  /// Returns the last accessible index. If collection is empty this returns
  /// `null`.
  ///
  /// Example:
  /// ```dart
  /// var list = ['a', 'b', 'c'];
  /// list.lastIndex; // 2
  /// list[list.lastIndex]; // 'c'
  /// ```
  int? get lastIndex {
    if (isNotEmpty) {
      return length - 1;
    } else {
      return null;
    }
  }

  /// Lazily returns all values without the first one.
  ///
  /// Example:
  /// ```dart
  /// [1, 2, 3].withoutFirst(); // [2, 3]
  /// [].withoutFirst(); // [];
  /// ```
  Iterable<T> withoutFirst() sync* {
    final iter = iterator;

    iter.moveNext(); // eat the first

    while (iter.moveNext()) {
      yield iter.current;
    }
  }

  /// Lazily returns all values without the last one.
  ///
  /// Example:
  /// ```dart
  /// [1, 2, 3].withoutLast(); // [1, 2]
  /// [].withoutLast(); // [];
  /// ```
  Iterable<T> withoutLast() sync* {
    final iter = iterator;

    final hasFirst = iter.moveNext();

    if (!hasFirst) {
      return;
    }

    while (true) {
      final value = iter.current;
      final isLastOne = !iter.moveNext();
      if (!isLastOne) {
        yield value;
      } else {
        break;
      }
    }
  }

  /// Replaces every element that matches the [comparator] with [newValue].
  ///
  /// Example:
  /// ```dart
  /// [1, 2, 3].replaceWhere((n) => n < 3, 0); // [0, 0, 3]
  /// ```
  Iterable<T> replaceWhere(
    bool Function(T currentValue) comparator,
    T newValue,
  ) sync* {
    final it = iterator;
    while (it.moveNext()) {
      if (comparator(it.current)) {
        yield newValue;
      } else {
        yield it.current;
      }
    }
  }

  /// Replaces the first element that matches the [comparator] with [newValue].
  ///
  /// Example:
  /// ```dart
  /// [1, 2, 3].replaceFirstWhere((n) => n < 3, 0); // [0, 2, 3]
  /// ```
  Iterable<T> replaceFirstWhere(
    bool Function(T currentValue) comparator,
    T newValue,
  ) sync* {
    final it = iterator;
    while (it.moveNext()) {
      if (comparator(it.current)) {
        yield newValue;
        while (it.moveNext()) {
          yield it.current;
        }
      } else {
        yield it.current;
      }
    }
  }

  /// Just like [map], but with access to the element's current index.
  ///
  /// Example
  /// ```dart
  /// [1, 2, 3].mapIndexed((number, index) => number * 2); // [2, 4, 6]
  /// ```
  Iterable<U> mapIndexed<U>(
    U Function(T currentValue, int index) transformer,
  ) sync* {
    final it = iterator;
    var index = 0;
    while (it.moveNext()) {
      yield transformer(it.current, index++);
    }
  }

  /// Applies the given [action] on each element and also returns the
  /// whole [Iterable] without modifying it.
  ///
  /// Example:
  /// ```dart
  /// var sum = [1, 2, 3].onEach(print).sum(); // sum = 6 (also prints each number)
  /// ```
  Iterable<T> onEach(void Function(T element) action) sync* {
    ArgumentError.checkNotNull(action, 'action');
    final it = iterator;
    while (it.moveNext()) {
      action(it.current);
      yield it.current;
    }
  }

  /// Applies the given [action] on each element and also returns the
  /// whole [Iterable] without modifying it. The [action] takes a second
  /// parameter [index] matching the element index.
  ///
  /// Example:
  /// ```dart
  /// var sum = [1, 2, 3].onEach(print).sum(); // sum = 6 (also prints each number)
  /// ```
  Iterable<T> onEachIndexed(void Function(T element, int index) action) sync* {
    ArgumentError.checkNotNull(action, 'action');
    final it = iterator;
    var index = 0;
    while (it.moveNext()) {
      action(it.current, index++);
      yield it.current;
    }
  }

  /// Returns a random item.
  /// The randomness can be customized by setting [random].
  ///
  /// Example:
  /// ```dart
  /// [1, 2, 3].pickOne(); // 2 (or 1 or 3)
  /// ```
  T pickOne([Random? random]) {
    final list = toList();
    list.shuffle(random);
    return list.first;
  }

  /// Returns an [List] of [count] random items.
  /// The randomness can be customized by setting [random].
  ///
  /// Example:
  /// ```dart
  /// [1, 2, 3].pickSome(2); // [1, 2] or [3, 2] and so on...
  /// ```
  List<T> pickSome(int count, [Random? random]) {
    ArgumentError.checkNotNull(count, 'count');
    final list = toList();
    list.shuffle(random);
    return list.take(min(count, length)).toList();
  }
}

extension IterableOfIntSC on Iterable<int> {
  /// Returns the sum of all elements.
  ///
  /// Example:
  /// ```dart
  /// [2, 6, 4, 8].sum(); // 20
  /// ```
  int sum() {
    return sumBy((n) => n);
  }

  /// Returns the average value (arithmetic mean) of all elements.
  ///
  /// Example:
  /// ```dart
  /// [2, 4, 6, 8].average(); // 5.0
  /// ```
  double? average() {
    return averageBy((n) => n);
  }

  /// Returns the largest value of all elements
  ///
  /// Example:
  /// ```dart
  /// [9, 42, 3].max(); // 42
  /// ```
  int? max() {
    return maximumBy((a, b) => a.compareTo(b));
  }

  /// Returns the lowest value of all elements
  ///
  /// Example:
  /// ```dart
  /// [17, 13, 92].min(); // 13
  /// ```
  int? min() {
    return minimumBy((a, b) => a.compareTo(b));
  }
}

extension IterableOfDoubleSC on Iterable<double> {
  /// Returns the sum of all elements.
  ///
  /// Example:
  /// ```dart
  /// [2.0, 6.0, 4.0, 8.0].sum(); // 20.0
  /// ```
  double sum() {
    return sumByDouble((n) => n);
  }

  /// Returns the average value (arithmetic mean) of all elements.
  ///
  /// Example:
  /// ```dart
  /// [2.0, 4.0, 6.0, 8.0].average(); // 5.0
  /// ```
  double? average() {
    return averageBy((n) => n);
  }

  /// Returns the largest value of all elements
  ///
  /// Example:
  /// ```dart
  /// [9.0, 42.0, 3.0].max(); // 42.0
  /// ```
  double? max() {
    return maximumBy((a, b) => a.compareTo(b));
  }

  /// Returns the lowest value of all elements
  ///
  /// Example:
  /// ```dart
  /// [17.0, 13.0, 92.0].min(); // 13.0
  /// ```
  double? min() {
    return minimumBy((a, b) => a.compareTo(b));
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
  num sum([num Function(E)? addend]) {
    if (isEmpty) {
      return 0;
    }
    return addend == null
        ? reduce((a, b) => a + b as E)
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

extension VxExtensionMap<K, V> on Map<K, V> {
  List<K> keysList({bool growable = true}) => keys.toList(growable: growable);

  List<V> valuesList({bool growable = true}) =>
      values.toList(growable: growable);

  List<E> builderEntry<E>(E Function(MapEntry<K, V>) builder) =>
      entries.map((MapEntry<K, V> entry) => builder(entry)).toList();

  /// addAll map and return new map
  Map<K, V> addAllT(Map<K, V> iterable, {bool isAdd = true}) {
    if (isAdd) {
      addAll(iterable);
    }
    return this;
  }

  /// update map and return new map
  Map<K, V> updateAllT(V Function(K key, V value) update,
      {bool isUpdate = true}) {
    if (isUpdate) {
      updateAll(update);
    }
    return this;
  }

  /// update map and return new map
  Map<K, V> updateT(K key, V Function(V value) update,
      {V Function()? ifAbsent, bool isUpdate = true}) {
    if (isUpdate) {
      this.update(key, update, ifAbsent: ifAbsent);
    }
    return this;
  }
}
