import 'package:fitpage_stock_scan_parser/core/colors/custom_colors.dart';
import 'package:fitpage_stock_scan_parser/presentation/sock_market_scan.dart/stock_market_scan_screen.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Stock Scans App',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        fontFamily: GoogleFonts.instrumentSerif().fontFamily,
        colorScheme: ColorScheme.fromSeed(seedColor: CustomColors.primaryColor),
        scaffoldBackgroundColor: CustomColors.primaryColor,
        useMaterial3: true,
      ),
      home: const StockMarketScanScreen(),
    );
  }
}
