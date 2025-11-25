import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class SubpurposeSearchField extends StatelessWidget {
  final Function(String) onSearch;
  const SubpurposeSearchField({super.key, required this.onSearch});

  @override
  Widget build(BuildContext context) {
    return TextField(
      onChanged: onSearch,
      textAlign: TextAlign.center,     
      style: GoogleFonts.poppins(
        fontSize: 13,
        color: Colors.black,
      ),
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
