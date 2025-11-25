import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class SubpurposeHeader extends StatelessWidget {
  final double handleWidth;
  const SubpurposeHeader({super.key, required this.handleWidth});

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
          'Government Payment',
          style: GoogleFonts.poppins(
            fontSize: 18,
            fontWeight: FontWeight.w600,
          ),
        ),
      ],
    );
  }
}
