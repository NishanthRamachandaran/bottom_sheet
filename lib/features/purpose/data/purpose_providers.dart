import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_riverpod/legacy.dart';
import 'purpose_model.dart';
import 'search_notifier.dart';

final purposesProvider = Provider<List<PurposeItem>>((ref) => [
      PurposeItem(id: 'p1', title: 'E-Payment'),
      PurposeItem(id: 'p2', title: 'Person to Person Payment'),
      PurposeItem(id: 'p3', title: 'Government Payment'),
      PurposeItem(id: 'p4', title: 'Salary Payment'),
      PurposeItem(id: 'p5', title: 'Other Payment'),
    ]);

final purposesSearchProvider =
    StateNotifierProvider<SearchNotifier<PurposeItem>, List<PurposeItem>>((ref) {
  final list = ref.read(purposesProvider);
  return SearchNotifier<PurposeItem>(list, (p) => '${p.title}');
});
