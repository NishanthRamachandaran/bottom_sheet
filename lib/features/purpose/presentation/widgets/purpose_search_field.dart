import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class PurposeSearchField extends StatelessWidget {
  final Function(String) onSearch;
  const PurposeSearchField({super.key, required this.onSearch});

  @override
  Widget build(BuildContext context) {
    return TextField(
      textAlign: TextAlign.center,
      onChanged: onSearch,
      style: GoogleFonts.poppins(fontSize: 13),
      decoration: InputDecoration(
        border: InputBorder.none,
        hintText: "Type to Search",
        hintStyle: GoogleFonts.poppins(
          color: Colors.grey.shade500,
          fontSize: 13,
        ),
        contentPadding: const EdgeInsets.symmetric(horizontal: 55),
      ),
    );
  }
}
