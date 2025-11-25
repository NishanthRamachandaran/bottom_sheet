import 'package:flutter/material.dart';

class PurposeList extends StatelessWidget {
  final List items;
  const PurposeList({super.key, required this.items});

  @override
  Widget build(BuildContext context) {
    return ListView.separated(
      itemCount: items.length,
      separatorBuilder: (_, __) => Divider(height: 1, color: Colors.grey.shade300),
      itemBuilder: (context, i) {
        final p = items[i];
        return ListTile(
          title: Text(p.title),
          trailing: Icon(Icons.chevron_right, color: Colors.grey.shade600),
          onTap: () {},
        );
      },
    );
  }
}
