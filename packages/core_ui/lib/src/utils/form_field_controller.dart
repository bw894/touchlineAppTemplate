import 'package:flutter/foundation.dart';

/// A [ValueNotifier] subclass used to drive form field widgets such as
/// [AppChoiceChips] and [AppDropdown].
class FormFieldController<T> extends ValueNotifier<T?> {
  FormFieldController(this.initialValue) : super(initialValue);

  final T? initialValue;

  void reset() => value = initialValue;
  void update() => notifyListeners();
}

/// Variant of [FormFieldController] for multi-select lists.
///
/// Stores a defensive copy of the initial value so that [reset] always
/// restores the original list rather than the (possibly mutated) reference.
class FormListFieldController<T> extends FormFieldController<List<T>> {
  final List<T>? _initialListValue;

  FormListFieldController(super.initialValue)
      : _initialListValue = List<T>.from(initialValue ?? []);

  @override
  void reset() => value = List<T>.from(_initialListValue ?? []);
}
