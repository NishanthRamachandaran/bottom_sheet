import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:bottom_sheet/core/constants/colors.dart';
import '../data/beneficiary_providers.dart';
import 'widgets/beneficiary_header.dart';
import 'widgets/beneficiary_search_field.dart';
import 'widgets/beneficiary_tab_bar.dart';
import 'widgets/beneficiary_list.dart';

Future<T?> showBeneficiaryBottomSheet<T>(BuildContext context) {
  return showModalBottomSheet<T>(
    context: context,
    isScrollControlled: true,
    backgroundColor: DefaultColors.white,
    shape: const RoundedRectangleBorder(
      borderRadius: BorderRadius.vertical(top: Radius.circular(16)),
    ),
    builder: (ctx) {
      final mq = MediaQuery.of(ctx);
      return FractionallySizedBox(
        heightFactor: 0.70,
        child: _BeneficiaryBottomSheetContent(mq: mq),
      );
    },
  );
}

class _BeneficiaryBottomSheetContent extends ConsumerStatefulWidget {
  final MediaQueryData mq;
  const _BeneficiaryBottomSheetContent({required this.mq});

  @override
  ConsumerState<_BeneficiaryBottomSheetContent> createState() =>
      _BeneficiaryBottomSheetContentState();
}

class _BeneficiaryBottomSheetContentState
    extends ConsumerState<_BeneficiaryBottomSheetContent> {
  String active = 'beneficiaries';
  final searchCtrl = TextEditingController();

  static const double _iconSize = 18;

  @override
  void dispose() {
    searchCtrl.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final w = widget.mq.size.width;
    final filtered = ref.watch(beneficiariesSearchProvider);

    final List display = List.from(filtered);
    final aliyaList =
        display.where((b) => b.name.trim().toLowerCase() == 'aliya khan').toList();
    if (aliyaList.length == 1) {
      final idx =
          display.indexWhere((b) => b.name.trim().toLowerCase() == 'aliya khan');
      if (idx != -1) {
        final original = display[idx];
        final copy = original;
        display.insert(idx + 1, copy);
      }
    }

    final handleWidth = w * 0.12;

    return SafeArea(
      child: Padding(
        padding: const EdgeInsets.fromLTRB(16, 12, 16, 20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            BeneficiaryHeader(handleWidth: handleWidth),
            const SizedBox(height: 22),
            Row(
              children: [
                Expanded(
                  child: BeneficiarySearchField(
                    iconSize: _iconSize,
                    onSearch: (v) => ref.read(beneficiariesSearchProvider.notifier).search(v),
                  ),
                ),
                const SizedBox(width: 20),
                Container(
                  height: w * 0.12,
                  width: w * 0.12,
                  decoration: BoxDecoration(
                    color: DefaultColors.white,
                    borderRadius: BorderRadius.circular(24),
                    border: Border.all(color: DefaultColors.blue9D),
                  ),
                  child: IconButton(
                    padding: EdgeInsets.zero,
                    icon: Icon(
                      Icons.add,
                      color: DefaultColors.blue9D,
                      size: _iconSize,
                    ),
                    onPressed: () {},
                  ),
                ),
              ],
            ),
            const SizedBox(height: 22),
            BeneficiaryTabBar(
              filteredCount: filtered.length,
              active: active,
              onTabSelected: (tab) => setState(() => active = tab),
              height: w * 0.11,
              cornerRadius: 30,
            ),
            const SizedBox(height: 18),
            Expanded(
              child: Container(
                decoration: BoxDecoration(
                  color: DefaultColors.white,
                  border: Border.all(color: DefaultColors.grayE6),
                  borderRadius: BorderRadius.circular(20),
                ),
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(10),
                  child: active == 'beneficiaries'
                      ? BeneficiaryList(display: display, iconSize: _iconSize)
                      : Center(
                          child: Padding(
                            padding: const EdgeInsets.all(24.0),
                            child: Text(
                              'Contacts placeholder — contacts are handled separately',
                              textAlign: TextAlign.center,
                              style: TextStyle(color: DefaultColors.gray82),
                            ),
                          ),
                        ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
