import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:bottom_sheet/core/constants/colors.dart';

class BeneficiarySearchField extends StatelessWidget {
  final double width;
  final double height;
  final double iconSize;
  final Function(String) onSearch;
  const BeneficiarySearchField({super.key, required this.width, required this.height, required this.iconSize, required this.onSearch});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: height,
      width: width,
      decoration: BoxDecoration(
        color: DefaultColors.whiteFA,
        borderRadius: BorderRadius.circular(25),
        border: Border.all(color: DefaultColors.grayE6),
      ),
      child: Stack(
        alignment: Alignment.center,
        children: [
          TextField(
            onChanged: onSearch,
            textAlign: TextAlign.center,
            style: GoogleFonts.poppins(fontSize: 13),
            decoration: InputDecoration(
              border: InputBorder.none,
              hintText: "Type to Search",
              hintStyle: GoogleFonts.poppins(
                color: DefaultColors.gray82,
                fontSize: 13,
              ),
              contentPadding: const EdgeInsets.symmetric(horizontal: 55),
            ),
          ),
          Positioned(
            left: width * 0.20,
            child: Icon(Icons.search, size: iconSize, color: DefaultColors.gray82),
          ),
        ],
      ),
    );
  }
}