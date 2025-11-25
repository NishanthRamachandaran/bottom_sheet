import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:bottom_sheet/core/constants/colors.dart';

// import '../../subpurpose/presentation/subpurpose_bottom_sheet.dart';
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

class _PurposeBottomSheetContentState extends ConsumerState<_PurposeBottomSheetContent> {
  // ignore: unused_field
  final TextEditingController _ctrl = TextEditingController();

  @override
  Widget build(BuildContext context) {
    final w = widget.mq.size.width;
    final h = widget.mq.size.height;
    final items = ref.watch(purposesSearchProvider);
    final contentWidth = w * 0.94;
    final searchHeight = h * 0.065;
    final iconSize = w * 0.045;

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

              Container(
                height: searchHeight,
                width: contentWidth,
                decoration: BoxDecoration(
                  color: DefaultColors.whiteF3,
                  borderRadius: BorderRadius.circular(25),
                  border: Border.all(color: DefaultColors.grayE6),
                ),
                child: Stack(
                  alignment: Alignment.center,
                  children: [
                    PurposeSearchField(onSearch: (v) => ref.read(purposesSearchProvider.notifier).search(v)),
                    Positioned(
                      left: w * 0.23,
                      child: Icon(Icons.search, size: iconSize, color: DefaultColors.gray82),
                    ),
                  ],
                ),
              ),

              SizedBox(height: h * 0.012),
              Expanded(
                child: Container(
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(8),
                  ),
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(8),
                    child: ListView.separated(
                      itemCount: items.length,
                      separatorBuilder: (_, __) => Divider(height: 1, color: DefaultColors.grayE6),
                      itemBuilder: (context, i) {
                        final p = items[i];
                        return ListTile(
                          title: Text(p.title),
                          trailing: Icon(Icons.chevron_right, color: DefaultColors.gray82),
                          onTap: () async {
                            if (p.title.toLowerCase().contains('government')) {
                            //  final sub = await showSubPurposeBottomSheet<String>(context);
                             // Navigator.of(context).pop(sub ?? p);
                            } else {
                              Navigator.of(context).pop(p);
                            }
                          },
                        );
                      },
                    ),
                  ),
                ),
              ),
            ],
         
        ),
      ),
    ));
  }
}