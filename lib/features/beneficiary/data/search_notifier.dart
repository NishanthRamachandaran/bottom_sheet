import 'package:flutter_riverpod/legacy.dart';

/// Search notifier for beneficiary feature.
/// Filters beneficiary list by a searchable string produced by `toSearchable`.
class SearchNotifier<T> extends StateNotifier<List<T>> {
  final List<T> _original;
  final String Function(T) toSearchable;
  SearchNotifier(this._original, this.toSearchable) : super(_original);

  void search(String q) {
    if (q.trim().isEmpty) {
      state = _original;
      return;
    }
    final low = q.toLowerCase();
    state = _original.where((e) => toSearchable(e).toLowerCase().contains(low)).toList();
  }
}
