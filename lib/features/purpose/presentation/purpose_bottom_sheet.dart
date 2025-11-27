import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:bottom_sheet/core/constants/colors.dart';

import '../data/purpose_providers.dart';
import 'widgets/purpose_header.dart';
import 'widgets/purpose_search_field.dart';

Future<T?> showPurposeBottomSheet<T>(BuildContext context) {
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
        heightFactor: 0.50,
        child: _PurposeBottomSheetContent(mq: mq),
      );
    },
  );
}

class _PurposeBottomSheetContent extends ConsumerStatefulWidget {
  final MediaQueryData mq;
  const _PurposeBottomSheetContent({required this.mq});

  @override
  ConsumerState<_PurposeBottomSheetContent> createState() =>
      _PurposeBottomSheetContentState();
}

class _PurposeBottomSheetContentState
    extends ConsumerState<_PurposeBottomSheetContent> {
  final TextEditingController _ctrl = TextEditingController();

  @override
  Widget build(BuildContext context) {
    final w = widget.mq.size.width;
    final h = widget.mq.size.height;

    final items = ref.watch(purposesSearchProvider);
    final contentWidth = w * 0.94;

    return SafeArea(
      child: Padding(
        padding: const EdgeInsets.fromLTRB(18, 12, 8, 24),
        child: SizedBox(
          width: contentWidth,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              PurposeHeader(handleWidth: w * 0.12),

              SizedBox(height: h * 0.018),

              Center(
                child: PurposeSearchField(
                  onSearch: (v) =>
                      ref.read(purposesSearchProvider.notifier).search(v),
                ),
              ),

              SizedBox(height: h * 0.015),

              Expanded(
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(8),
                  child: ListView.separated(
                    itemCount: items.length,
                    separatorBuilder: (_, __) =>
                        Divider(height: 1, color: DefaultColors.grayE6),
                    itemBuilder: (context, i) {
                      final p = items[i];

                      return ListTile(
                        contentPadding: EdgeInsets.symmetric(
                          horizontal: w * 0.02, 
                        ),
                        title: Text(
                          p.title,
                          style: GoogleFonts.poppins(
                            fontSize: w * 0.038, 
                            fontWeight: FontWeight.w500,
                            color: DefaultColors.black, 
                          ),
                        ),
                        trailing: Icon(
                          Icons.chevron_right,
                          color: DefaultColors.black,
                        ),
                        onTap: () => Navigator.pop(context, p),
                      );
                    },
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
