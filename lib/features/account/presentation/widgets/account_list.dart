import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../data/account_providers.dart';

class AccountList extends ConsumerWidget {
  const AccountList({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final accounts = ref.watch(accountsSearchProvider);

    return ListView.separated(
      itemCount: accounts.length,
      separatorBuilder: (_, __) => const Divider(height: 1),
      itemBuilder: (context, i) {
        final a = accounts[i];
        return ListTile(
          contentPadding: const EdgeInsets.symmetric(
            horizontal: 0,
            vertical: 8,
          ),
          title: Text(
            a.title,
            style: GoogleFonts.poppins(
              fontWeight: FontWeight.w600,
            ),
          ),
          subtitle: Text(
            a.subtitle,
            style: GoogleFonts.poppins(fontSize: 13),
          ),
          trailing: Text(
            a.balance,
            style: GoogleFonts.poppins(
              fontWeight: FontWeight.w600,
            ),
          ),
          onTap: () => Navigator.of(context).pop(a),
        );
      },
    );
  }
}
