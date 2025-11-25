import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_riverpod/legacy.dart';
import 'account_model.dart';
import 'search_notifier.dart';

final accountsProvider = Provider<List<AccountModel>>((ref) => [
      AccountModel(id: 'a1', title: 'Savings Account', subtitle: 'xxxx2088', balance: '889,200.00 QAR'),
      AccountModel(id: 'a2', title: 'Current Account', subtitle: 'xxxx6238', balance: '7,540.00 QAR'),
    ]);

final accountsSearchProvider =
    StateNotifierProvider<SearchNotifier<AccountModel>, List<AccountModel>>((ref) {
  final list = ref.read(accountsProvider);

  // search across title + subtitle
  return SearchNotifier<AccountModel>(
    list,
    (a) => '${a.title} ${a.subtitle}',
  );
});
