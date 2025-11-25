import 'package:flutter/material.dart';

import 'widgets/subpurpose_header.dart';
import 'widgets/subpurpose_search_field.dart';
import 'widgets/subpurpose_list.dart';

Future<T?> showSubPurposeBottomSheet<T>(BuildContext context) {
  return showModalBottomSheet<T>(
    context: context,
    isScrollControlled: true,
    backgroundColor: Colors.white,
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

class _SubPurposeContent extends StatefulWidget {
  final MediaQueryData mq;
  // ignore: unused_element_parameter
  const _SubPurposeContent({super.key, required this.mq});

  @override
  State<_SubPurposeContent> createState() => _SubPurposeContentState();
}

class _SubPurposeContentState extends State<_SubPurposeContent> {
  final TextEditingController _ctrl = TextEditingController();
  final List<String> _subs = List<String>.generate(6, (i) => 'Sub-purpose ${i + 1}');

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
    final iconSize = w * 0.045;

    return SafeArea(
      child: Padding(
        padding: const EdgeInsets.fromLTRB(18, 12, 8, 24),
        child: SizedBox(
          width: contentWidth,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              /// Header
              SubpurposeHeader(handleWidth: w * 0.12),

              SizedBox(height: h * 0.018),

              /// Search bar container
              Container(
                height: searchHeight,
                width: contentWidth,
                decoration: BoxDecoration(
                  color: Colors.grey[100],
                  borderRadius: BorderRadius.circular(25),
                  border: Border.all(color: Colors.grey.shade300),
                ),
                child: Stack(
                  alignment: Alignment.center,
                  children: [
                    SubpurposeSearchField(onSearch: (v) {}),
                    Positioned(
                      left: w * 0.23,
                      child: Icon(
                        Icons.search,
                        size: iconSize,
                        color: Colors.grey.shade600,
                      ),
                    ),
                  ],
                ),
              ),

              SizedBox(height: h * 0.012),

              /// ⭐⭐⭐ THIS WAS MISSING — LIST SECTION ⭐⭐⭐
              Expanded(
                child: SubpurposeList(items: _subs),
              )
            ],
          ),
        ),
      ),
    );
  }
}
