import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

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
              color: Colors.grey[300],
              borderRadius: BorderRadius.circular(2),
            ),
          ),
        ),
        const SizedBox(height: 14),
        Text(
          'Select from account',
          style: GoogleFonts.poppins(
            fontSize: 18,
            fontWeight: FontWeight.w600,
          ),
        ),
        const SizedBox(height: 6),
        Text(
          "Choose the account you'd like to transfer from",
          style: GoogleFonts.poppins(
            fontSize: 13,
            color: Colors.grey[600],
            fontWeight: FontWeight.w400,
          ),
        ),
      ],
    );
  }
}
