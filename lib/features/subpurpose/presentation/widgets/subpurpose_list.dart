import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class SubpurposeList extends StatelessWidget {
  final List<String> items;
  const SubpurposeList({super.key, required this.items});

  @override
  Widget build(BuildContext context) {
    final mq = MediaQuery.of(context);
    final w = mq.size.width;
    final h = mq.size.height;

    return SizedBox(
      height: h * 0.40, // Uses MediaQuery height (padding not changed)
      width: w,
      child: ListView.separated(
        itemCount: items.length,
        separatorBuilder: (_, __) =>
            Divider(height: 1, color: Colors.grey.shade300),
        itemBuilder: (context, i) {
          final s = items[i];
          return ListTile(
            title: Text(
              s,
              style: GoogleFonts.poppins(
                fontWeight: FontWeight.w500,
                fontSize: 14, // untouched (your rule)
              ),
            ),
          );
        },
      ),
    );
  }
}
