import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_riverpod/legacy.dart';
import 'beneficiary_model.dart';
import 'search_notifier.dart';

final beneficiariesProvider = Provider<List<BeneficiaryModel>>((ref) => [
      BeneficiaryModel(
        id: 'b1',
        name: 'Aliya Khan',
        sub: 'Dukhan Bank (QA)',
      
      ),
      BeneficiaryModel(
        id: 'b2',
        name: 'Sangita Raman',
        sub: 'Dukhan Bank (QA)',

      ),
      BeneficiaryModel(
        id: 'b3',
        name: 'Yasmin Noor',
        sub: 'Western Union (Cash)',
  
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
