import 'package:bottom_sheet/features/subpurpose/data/subpurpose_model.dart';
import 'package:flutter_riverpod/legacy.dart';

class SubpurposeSearchNotifier extends StateNotifier<List<SubpurposeModel>> {
  final List<SubpurposeModel> _original;

  SubpurposeSearchNotifier(this._original) : super(_original);

  void search(String query) {
    if (query.trim().isEmpty) {
      state = _original;
      return;
    }

    final low = query.toLowerCase();
    state = _original
        .where((e) => e.title.toLowerCase().contains(low))
        .toList();
  }
}
