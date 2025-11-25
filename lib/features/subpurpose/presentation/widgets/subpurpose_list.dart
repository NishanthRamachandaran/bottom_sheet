import 'package:bottom_sheet/features/subpurpose/data/subpurpose_model.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';


class SubpurposeList extends StatelessWidget {
  final List<SubpurposeModel> items;
  const SubpurposeList({super.key, required this.items});

  @override
  Widget build(BuildContext context) {
    return ListView.separated(
      itemCount: items.length,
      separatorBuilder: (_, __) =>
          Divider(height: 1, color: Colors.grey.shade300),
      itemBuilder: (_, i) {
        return ListTile(
          title: Text(
            items[i].title,
            style: GoogleFonts.poppins(fontWeight: FontWeight.w500),
          ),
        );
      },
    );
  }
}
