import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:bottom_sheet/core/constants/colors.dart';

class BeneficiaryHeader extends StatelessWidget {
  final double handleWidth;
  const BeneficiaryHeader({super.key, required this.handleWidth});

  @override
  Widget build(BuildContext context) {
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
        const SizedBox(height: 12),
        Text(
          "Select Beneficiary/Contact",
          style: GoogleFonts.poppins(
            fontSize: 18,
            fontWeight: FontWeight.w600,
          ),
        ),
      ],
    );
  }
}