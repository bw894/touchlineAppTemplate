import 'package:flutter/material.dart';

/// Widget list extensions ported from [flutter_flow_util.dart].
extension ListDivideExt<T extends Widget> on Iterable<T> {
  Iterable<MapEntry<int, Widget>> get _enumerate =>
      toList().asMap().entries;

  /// Inserts [separator] between every element.
  ///
  /// If [filterFn] is supplied it is called with the index of each element;
  /// the separator is omitted when it returns `false`.
  List<Widget> divide(Widget separator, {bool Function(int)? filterFn}) =>
      isEmpty
          ? []
          : (_enumerate
                .map((e) => [
                      e.value,
                      if (filterFn == null || filterFn(e.key)) separator,
                    ])
                .expand((i) => i)
                .toList()
              ..removeLast());

  /// Wraps the list with [separator] at both ends.
  List<Widget> around(Widget separator) =>
      addToStart(separator).addToEnd(separator);

  /// Prepends [separator] to the list.
  List<Widget> addToStart(Widget separator) =>
      _enumerate.map((e) => e.value).toList()..insert(0, separator);

  /// Appends [separator] to the list.
  List<Widget> addToEnd(Widget separator) =>
      _enumerate.map((e) => e.value).toList()..add(separator);
}

/// Generic iterable extensions ported from [flutter_flow_util.dart].
extension IterableExt<T> on Iterable<T> {
  List<T> sortedList<S extends Comparable>({
    S Function(T)? keyOf,
    bool desc = false,
  }) {
    final sorted = toList()
      ..sort(keyOf == null ? null : (a, b) => keyOf(a).compareTo(keyOf(b)));
    return desc ? sorted.reversed.toList() : sorted;
  }

  List<S> mapIndexed<S>(S Function(int index, T value) fn) => toList()
      .asMap()
      .map((i, v) => MapEntry(i, fn(i, v)))
      .values
      .toList();
}
