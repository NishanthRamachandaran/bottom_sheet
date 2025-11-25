import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class BeneficiaryList extends StatelessWidget {
  final List display;
  final double iconSize;
  const BeneficiaryList({super.key, required this.display, required this.iconSize});

  String initials(String name) {
    final parts = name.trim().split(RegExp(r'\s+'));
    if (parts.isEmpty) return '';
    if (parts.length == 1) return parts[0][0].toUpperCase();
    return (parts[0][0] + parts[1][0]).toUpperCase();
  }

  @override
  Widget build(BuildContext context) {
    final mq = MediaQuery.of(context);
    final h = mq.size.height;

    // First Aliya index (if exists)
    final firstAliyaIndex = display.indexWhere(
      (b) => b.name.trim().toLowerCase() == 'aliya khan',
    );

    return ListView.separated(
      padding: const EdgeInsets.only(top: 8),
      itemCount: display.length,
      separatorBuilder: (_, __) =>
          Divider(height: 1, color: Colors.grey.shade300),
      itemBuilder: (_, i) {
        final item = display[i];
        final init = initials(item.name);

        final isAliya = item.name.trim().toLowerCase() == 'aliya khan';
        final isFirstAliya = isAliya && i == firstAliyaIndex;
        final isSecondAliya = isAliya && i != firstAliyaIndex;

        // ---------------------------
        // LEADING (Avatar)
        // ---------------------------
        Widget leading;

        if (isSecondAliya) {
          // SECOND ALIYA → IMAGE
          leading = CircleAvatar(
            radius: h * 0.025,
            backgroundColor: Colors.grey.shade200,
            backgroundImage: const AssetImage("assets/images/sara.png"),
          );
        } else if (init == 'SR' || init == 'YN') {
          leading = CircleAvatar(
            radius: h * 0.025,
            backgroundColor: const Color(0xFFEAF4FF),
            child: Text(
              init,
              style: GoogleFonts.poppins(
                fontWeight: FontWeight.w600,
                color: const Color(0xFF1F4A85),
              ),
            ),
          );
        } else {
          leading = CircleAvatar(
            radius: h * 0.025,
            backgroundColor: Colors.grey.shade200,
            child: Icon(Icons.person, color: Colors.black54, size: iconSize),
          );
        }

        // ---------------------------
        // TITLE STYLE
        // ---------------------------
        bool isLightAliya = isFirstAliya;
        bool isUsualAliya = isSecondAliya;

        final titleStyle = GoogleFonts.poppins(
          fontWeight: isUsualAliya ? FontWeight.w600 : FontWeight.w500,
          fontSize: 15,
          color: isLightAliya ? Colors.grey.shade700 : Colors.grey.shade900,
        );

        final subtitleStyle =
            GoogleFonts.poppins(fontSize: 12, color: Colors.grey.shade600);

        // ---------------------------
        // TRAILING ONLY FOR FIRST ALIYA
        // ---------------------------
        final Widget? trailing = isLightAliya
            ? Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.end,
                children: [
                  Text("Active in",
                      style: GoogleFonts.poppins(
                          fontSize: 10, color: Colors.grey.shade500)),
                  SizedBox(height: h * 0.008),
                  Text("1h 55m",
                      style: GoogleFonts.poppins(
                          fontSize: 12,
                          color: Colors.grey.shade700,
                          fontWeight: FontWeight.w500)),
                ],
              )
            : null;

        return ListTile(
          leading: leading,
          title: Text(item.name, style: titleStyle),
          subtitle: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(height: h * 0.005),
              Text("XXXX1827", style: subtitleStyle),
              SizedBox(height: h * 0.005),
              Text(item.sub, style: subtitleStyle),
            ],
          ),
          trailing: trailing,
          onTap: () => Navigator.pop(context, item),
        );
      },
    );
  }
}
