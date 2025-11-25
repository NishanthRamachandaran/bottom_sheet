import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:bottom_sheet/core/constants/colors.dart';

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
        color: DefaultColors.blueLightSteel,
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
                  color: active == "beneficiaries" ? DefaultColors.blue9D : DefaultColors.transparent,
                  borderRadius: BorderRadius.circular(26),
                ),
                alignment: Alignment.center,
                child: Text(
                  "Beneficiaries ($filteredCount)",
                  style: GoogleFonts.poppins(
                    color: active == "beneficiaries" ? DefaultColors.white : DefaultColors.blue9D,
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
                  color: active == "contacts" ? DefaultColors.blue9D : DefaultColors.transparent,
                  borderRadius: BorderRadius.circular(26),
                ),
                alignment: Alignment.center,
                child: Text(
                  "Contacts (3)",
                  style: GoogleFonts.poppins(
                    color: active == "contacts" ? DefaultColors.white : DefaultColors.blue9D,
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