import 'package:flutter/material.dart';
import 'package:bottom_sheet/core/constants/colors.dart';

class SubpurposeList extends StatelessWidget {
  final List<String> items;
  const SubpurposeList({super.key, required this.items});

  @override
  Widget build(BuildContext context) {
    return ListView.separated(
      itemCount: items.length,
      separatorBuilder: (_, __) => Divider(height: 1, color: DefaultColors.grayE6),
      itemBuilder: (context, i) {
        final s = items[i];
        return ListTile(
          title: Text(s),
        );
      },
    );
  }
}