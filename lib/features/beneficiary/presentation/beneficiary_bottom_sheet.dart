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
        heightFactor: 0.62,
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
  String active = "beneficiaries";
  final searchCtrl = TextEditingController();

  @override
  void dispose() {
    searchCtrl.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final w = widget.mq.size.width;
    final h = widget.mq.size.height;
    final filtered = ref.watch(beneficiariesSearchProvider);

    // duplicate Aliya in display after filtering
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

    final contentWidth = w * 0.94;
    final handleWidth = w * 0.12;
    final searchHeight = h * 0.055;
    final iconSize = w * 0.045;

    return SafeArea(
      child: Padding(
        padding: const EdgeInsets.fromLTRB(14, 12, 14, 20),
        child: SizedBox(
          width: contentWidth,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              BeneficiaryHeader(handleWidth: handleWidth),

              SizedBox(height: h * 0.015),

              Row(
                children: [
                  Expanded(
                    child: BeneficiarySearchField(
                      width: contentWidth,
                      height: searchHeight,
                      iconSize: iconSize,
                      onSearch: (v) => ref.read(beneficiariesSearchProvider.notifier).search(v),
                    ),
                  ),
                  SizedBox(width: w * 0.025),
                  Container(
                    height: h * 0.055,
                    width: h * 0.055,
                    decoration: BoxDecoration(
                      color: DefaultColors.white,
                      borderRadius: BorderRadius.circular(20),
                      border: Border.all(color: DefaultColors.grayE6),
                    ),
                    child: IconButton(
                      padding: EdgeInsets.zero,
                      icon: Icon(Icons.add, color: DefaultColors.blue9D, size: iconSize),
                      onPressed: () {},
                    ),
                  )
                ],
              ),

              SizedBox(height: h * 0.018),

              BeneficiaryTabBar(
                filteredCount: filtered.length,
                active: active,
                onTabSelected: (tab) => setState(() => active = tab),
                height: h * 0.058,
                cornerRadius: 30,
              ),

              SizedBox(height: h * 0.018),

              Expanded(
                child: Container(
                  decoration: BoxDecoration(
                    border: Border.all(color: DefaultColors.grayE6),
                    borderRadius: BorderRadius.circular(10),
                  ),
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(10),
                    child: active == 'beneficiaries'
                        ? BeneficiaryList(display: display, iconSize: iconSize)
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
      ),
    );
  }
}