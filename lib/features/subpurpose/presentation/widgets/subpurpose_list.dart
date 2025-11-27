import 'package:bottom_sheet/core/constants/colors.dart';
import 'package:bottom_sheet/features/subpurpose/data/subpurpose_model.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class SubpurposeList extends StatelessWidget {
  final List<SubpurposeModel> items;
  const SubpurposeList({super.key, required this.items});

  @override
  Widget build(BuildContext context) {
    final w = MediaQuery.of(context).size.width;

    return ListView.separated(
      itemCount: items.length,
      separatorBuilder: (_, __) =>
          Divider(height: 1, color: DefaultColors.grayE6), // Same divider ✔
      itemBuilder: (_, i) {
        return ListTile(
          contentPadding: EdgeInsets.symmetric(
            horizontal: w * 0.01, // LEFT aligned nicely ✔
          ),
          title: Text(
            items[i].title,
            style: GoogleFonts.poppins(
              fontSize: w * 0.038,  // Responsive ✔
              fontWeight: FontWeight.w500,
              color: DefaultColors.black, // Updated color ✔
            ),
          ),
       
          onTap: () => Navigator.pop(context, items[i]),
        );
      },
    );
  }
}
