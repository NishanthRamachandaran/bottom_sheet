// ignore_for_file: unused_local_variable

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:bottom_sheet/core/constants/colors.dart';
import 'widgets/account_header.dart';
import 'widgets/account_list.dart';

Future<T?> showAccountBottomSheet<T>(BuildContext context) {
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
        heightFactor: 0.30,
        child: _AccountBottomSheetContent(mq: mq),
      );
    },
  );
}

class _AccountBottomSheetContent extends ConsumerWidget {
  final MediaQueryData mq;
  // ignore: unused_element_parameter
  const _AccountBottomSheetContent({super.key, required this.mq});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final w = mq.size.width;
    final h = mq.size.height;
    final contentWidth = w * 0.94;
    final searchHeight = h * 0.055;
    final handleWidth = w * 0.12;

    return SafeArea(
      child: Padding(
        padding: const EdgeInsets.fromLTRB(16, 12, 16, 24),
        child: SizedBox(
          width: contentWidth,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // header uses responsive handle width
              AccountHeader(handleWidth: handleWidth),

              //SizedBox(height: h * 0.018),

              // AccountSearchField(
              //   width: contentWidth,
              //   height: searchHeight,
              //   onSearch: (value) =>
              //       ref.read(accountsSearchProvider.notifier).search(value),
              // ),

              //SizedBox(height: h * 0.018),

              const Expanded(
                child: AccountList(),
              ),
            ],
          ),
        ),
      ),
    );
  }
}