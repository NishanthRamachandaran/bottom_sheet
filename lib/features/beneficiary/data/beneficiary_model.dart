/// Beneficiary model kept inside beneficiary feature folder.
class BeneficiaryModel {
  final String id;
  final String name;
  final String sub;
  final String? avatarUrl;
  BeneficiaryModel({
    required this.id,
    required this.name,
    required this.sub,
    this.avatarUrl,
  });
}
