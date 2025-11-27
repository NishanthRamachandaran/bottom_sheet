import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:bottom_sheet/core/constants/colors.dart';

class PurposeSearchField extends StatelessWidget {
  final Function(String) onSearch;
  const PurposeSearchField({super.key, required this.onSearch});

  @override
  Widget build(BuildContext context) {
    final w = MediaQuery.of(context).size.width;
    final h = MediaQuery.of(context).size.height;

    return Container(
      width: w * 0.90, 
      height: h * 0.055,
      decoration: BoxDecoration(
        color: DefaultColors.whiteFA,
        borderRadius: BorderRadius.circular(25),
        border: Border.all(color: DefaultColors.grey_05),
      ),
      child: Stack(
        alignment: Alignment.center,
        children: [
          TextField(
            onChanged: onSearch,
            textAlign: TextAlign.center,
            style: GoogleFonts.poppins(
              fontSize: w * 0.038,
              color: DefaultColors.black24,
            ),
            decoration: InputDecoration(
              border: InputBorder.none,
              hintText: "Type to Search",
              hintStyle: GoogleFonts.poppins(
                fontSize: w * 0.038,
                color: DefaultColors.gray82,
              ),
              contentPadding: EdgeInsets.zero,
            ),
          ),
          Positioned(
            left: w * 0.25,
            child: Icon(
              Icons.search,
              size: w * 0.045,
              color: DefaultColors.gray82,
            ),
          ),
        ],
      ),
    );
  }
}
