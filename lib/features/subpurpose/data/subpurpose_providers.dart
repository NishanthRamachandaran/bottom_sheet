import 'package:bottom_sheet/features/subpurpose/data/subpurpose_model.dart';
import 'package:bottom_sheet/features/subpurpose/data/subpurpose_search_notifier.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_riverpod/legacy.dart';


final subpurposeListProvider = Provider<List<SubpurposeModel>>((ref) {
  return [
    SubpurposeModel(id: "s1", title: "Sub-Purpose 1"),
    SubpurposeModel(id: "s2", title: "Sub-Purpose 2"),
    SubpurposeModel(id: "s3", title: "Sub-Purpose 3"),
    SubpurposeModel(id: "s4", title: "Sub-Purpose 4"),
    SubpurposeModel(id: "s5", title: "Sub-Purpose 5"),
    SubpurposeModel(id: "s6", title: "Sub-Purpose 6"),
  ];
});

/// Search Provider
final subpurposeSearchProvider =
    StateNotifierProvider<SubpurposeSearchNotifier, List<SubpurposeModel>>(
        (ref) {
  final data = ref.read(subpurposeListProvider); // original list
  return SubpurposeSearchNotifier(data);
});
