import 'package:bottom_sheet/core/constants/colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../data/subpurpose_providers.dart';
import 'widgets/subpurpose_header.dart';
import 'widgets/subpurpose_search_field.dart';
import 'widgets/subpurpose_list.dart';

Future<T?> showSubPurposeBottomSheet<T>(BuildContext context) {
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
        heightFactor: 0.55,
        child: _SubPurposeContent(mq: mq),
      );
    },
  );
}

class _SubPurposeContent extends ConsumerStatefulWidget {
  final MediaQueryData mq;
  const _SubPurposeContent({super.key, required this.mq});

  @override
  ConsumerState<_SubPurposeContent> createState() => _SubPurposeContentState();
}

class _SubPurposeContentState extends ConsumerState<_SubPurposeContent> {
  final TextEditingController _ctrl = TextEditingController();

  @override
  void dispose() {
    _ctrl.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final w = widget.mq.size.width;
    final h = widget.mq.size.height;

    final contentWidth = w * 0.94;
    final searchHeight = h * 0.065;
    //final iconSize = w * 0.045;

    /// LIST FROM PROVIDER (auto updates when searching)
    final subpurposeList = ref.watch(subpurposeSearchProvider);

    return SafeArea(
      child: Padding(
        padding: const EdgeInsets.fromLTRB(18, 12, 8, 24),
        child: SizedBox(
          width: contentWidth,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              /// Header drag handle + title
              SubpurposeHeader(handleWidth: w * 0.12),

              SizedBox(height: h * 0.020),

              /// Search container
              Container(
                height: searchHeight,
                width: contentWidth,
                decoration: BoxDecoration(
                  color: DefaultColors.whiteF3,
                  borderRadius: BorderRadius.circular(25),
                  border: Border.all(color: DefaultColors.grayMedBase),
                ),
                child: Stack(
                  alignment: Alignment.center,
                  children: [
                 
                    SizedBox(
                      width: contentWidth,
                      height: searchHeight,
                      child: SubpurposeSearchField(
                        onSearch: (v) {
                          ref.read(subpurposeSearchProvider.notifier).search(v);
                        },
                      ),
                    ),

                   
                  ],
                ),
              ),

              SizedBox(height: h * 0.012),

              /// LIST OF SUB-PURPOSE ITEMS
              Expanded(
                child: SubpurposeList(items: subpurposeList),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
