import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:bottom_sheet/core/constants/colors.dart';

class AccountHeader extends StatelessWidget {
  final double handleWidth;
  const AccountHeader({super.key, required this.handleWidth});

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
        const SizedBox(height: 18), // Updated spacing
        Text(
          'Select from account',
          style: GoogleFonts.poppins(
            fontWeight: FontWeight.w600,
            fontSize:22,
            color: DefaultColors.black,
          ),
        ),
        const SizedBox(height: 6),
        Text(
          "Choose the account you'd like to transfer from",
          style: GoogleFonts.poppins(
            fontSize: 13,
            fontWeight: FontWeight.w400,
            color: DefaultColors.grayA7, 
          ),
        ),
      ],
    );
  }
}
