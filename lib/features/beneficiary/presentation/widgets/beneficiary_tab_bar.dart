import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class BeneficiaryTabBar extends StatelessWidget {
  final int filteredCount;
  final String active;
  final void Function(String) onTabSelected;
  final double height;
  final double cornerRadius;

  const BeneficiaryTabBar({
    super.key,
    required this.filteredCount,
    required this.active,
    required this.onTabSelected,
    required this.height,
    required this.cornerRadius,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      height: height,
      decoration: BoxDecoration(
        color: const Color(0xFFEEF6FF),
        borderRadius: BorderRadius.circular(cornerRadius),
      ),
      padding: const EdgeInsets.all(4),
      child: Row(
        children: [
          Expanded(
            child: GestureDetector(
              onTap: () => onTabSelected("beneficiaries"),
              child: Container(
                decoration: BoxDecoration(
                  color: active == "beneficiaries" ? const Color(0xFF2F8CFF) : Colors.transparent,
                  borderRadius: BorderRadius.circular(26),
                ),
                alignment: Alignment.center,
                child: Text(
                  "Beneficiaries ($filteredCount)",
                  style: GoogleFonts.poppins(
                    color: active == "beneficiaries" ? Colors.white : const Color(0xFF1F4A85),
                    fontWeight: FontWeight.w600,
                    fontSize: 13,
                  ),
                ),
              ),
            ),
          ),
          const SizedBox(width: 6),
          Expanded(
            child: GestureDetector(
              onTap: () => onTabSelected("contacts"),
              child: Container(
                decoration: BoxDecoration(
                  color: active == "contacts" ? const Color(0xFF2F8CFF) : Colors.transparent,
                  borderRadius: BorderRadius.circular(26),
                ),
                alignment: Alignment.center,
                child: Text(
                  "Contacts (3)",
                  style: GoogleFonts.poppins(
                    color: active == "contacts" ? Colors.white : const Color(0xFF1F4A85),
                    fontWeight: FontWeight.w600,
                    fontSize: 13,
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
