import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:bottom_sheet/core/constants/colors.dart';

class PurposeHeader extends StatelessWidget {
  final double handleWidth;
  const PurposeHeader({super.key, required this.handleWidth});

  @override
  Widget build(BuildContext context) {
    final w = MediaQuery.of(context).size.width;

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Center(
          child: Container(
            width: handleWidth,
            height: 4,
            decoration: BoxDecoration(
              color: DefaultColors.grayE6,
              borderRadius: BorderRadius.circular(2),
            ),
          ),
        ),
        const SizedBox(height: 14),
        Text(
          'Select Purpose',
          style: GoogleFonts.poppins(
            fontSize: w * 0.06, 
            fontWeight: FontWeight.w600,
            color: DefaultColors.black,
          ),
        ),
      ],
    );
  }
}
