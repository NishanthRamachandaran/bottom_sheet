// ignore_for_file: unused_local_variable

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:google_fonts/google_fonts.dart';

import 'features/account/presentation/account_bottom_sheet.dart';
import 'features/beneficiary/presentation/beneficiary_bottom_sheet.dart';
import 'features/purpose/presentation/purpose_bottom_sheet.dart';
import 'features/subpurpose/presentation/subpurpose_bottom_sheet.dart';
import 'core/constants/colors.dart';

void main() {
  runApp(const ProviderScope(child: MyApp()));
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        textTheme: GoogleFonts.poppinsTextTheme(),
        scaffoldBackgroundColor: DefaultColors.white,
      ),
      home: const HomeScreen(),
    );
  }
}

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final mq = MediaQuery.of(context);
    final btnWidth = mq.size.width * 0.9; 

    return Scaffold(
      appBar: AppBar(
        title: Text(
          "Bottom Sheet Demo",
          style: GoogleFonts.poppins(fontWeight: FontWeight.w600),
        ),
        backgroundColor: DefaultColors.blue,
      ),
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            SizedBox(
              width: btnWidth,
              child: ElevatedButton(
                onPressed: () async {
                  final result = await showAccountBottomSheet(context);
                  print("Selected Account: \$result");
                },
                child: const Text("Open Account Bottom Sheet"),
              ),
            ),
            const SizedBox(height: 16),
            SizedBox(
              width: btnWidth,
              child: ElevatedButton(
                onPressed: () async {
                  final result = await showBeneficiaryBottomSheet(context);
                  print("Selected Beneficiary: \$result");
                },
                child: const Text("Open Beneficiary Bottom Sheet"),
              ),
            ),
            const SizedBox(height: 16),
            SizedBox(
              width: btnWidth,
              child: ElevatedButton(
                onPressed: () async {
                  await showPurposeBottomSheet(context);
                  print("Selected Purpose: \$result");
                },
                child: const Text("Open Purpose Bottom Sheet"),
              ),
            ),
            const SizedBox(height: 16),
            SizedBox(
              width: btnWidth,
              child: ElevatedButton(
                onPressed: () async {
                  final result = await showSubPurposeBottomSheet(context);
                  print("Selected Sub Purpose: \$result");
                },
                child: const Text("Open Sub Purpose Bottom Sheet"),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
