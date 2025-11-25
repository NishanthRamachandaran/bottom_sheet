import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_riverpod/legacy.dart';
import 'beneficiary_model.dart';
import 'search_notifier.dart';

final beneficiariesProvider = Provider<List<BeneficiaryModel>>((ref) => [
      BeneficiaryModel(
        id: 'b1',
        name: 'Aliya Khan',
        sub: 'Dukhan Bank (QA)',
        avatarUrl: '/mnt/data/a77250e8-bb77-48e8-87cd-c9b5fbc696e3.png',
      ),
      BeneficiaryModel(
        id: 'b2',
        name: 'Sangita Raman',
        sub: 'Dukhan Bank (QA)',
        avatarUrl: '/mnt/data/df91b891-6047-431e-9681-b945edeff9e3.png',
      ),
      BeneficiaryModel(
        id: 'b3',
        name: 'Yasmin Noor',
        sub: 'Western Union (Cash)',
        avatarUrl: '/mnt/data/b9a2aabf-4bf3-4a32-9ece-b9507ac8e5de.png',
      ),
    ]);

final beneficiariesSearchProvider =
    StateNotifierProvider<SearchNotifier<BeneficiaryModel>, List<BeneficiaryModel>>((ref) {
  final list = ref.read(beneficiariesProvider);
  return SearchNotifier<BeneficiaryModel>(
    list,
    (b) => '${b.name} ${b.sub}',
  );
});
