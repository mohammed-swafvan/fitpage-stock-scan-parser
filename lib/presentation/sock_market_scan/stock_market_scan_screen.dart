import 'package:fitpage_stock_scan_parser/core/colors/custom_colors.dart';
import 'package:fitpage_stock_scan_parser/core/contance/constant.dart';
import 'package:fitpage_stock_scan_parser/infrastructure/api_service.dart';
import 'package:fitpage_stock_scan_parser/presentation/sock_market_scan/widgets/stock_market_item_tile_widget.dart';
import 'package:flutter/material.dart';

class StockMarketScanScreen extends StatelessWidget {
  const StockMarketScanScreen({super.key});

  @override
  build(BuildContext context) {
    return Scaffold(
      body: SizedBox(
        width: double.infinity,
        height: double.infinity,
        child: FutureBuilder<List>(
          future: ApiService().fetchData(),
          builder: (context, snapshot) {
            if (snapshot.hasData) {
              return Center(
                child: Container(
                  margin: const EdgeInsets.symmetric(horizontal: 12),
                  padding: const EdgeInsets.symmetric(horizontal: 12).copyWith(bottom: 24),
                  decoration: BoxDecoration(
                    color: CustomColors.secondaryColor,
                  ),
                  child: ListView.separated(
                    shrinkWrap: true,
                    itemBuilder: (context, index) {
                      final Map<String, dynamic> data = snapshot.data![index];
                      return StockMarketItemTileWidget(data: data);
                    },
                    separatorBuilder: (context, index) => Constant.builDottedLine(),
                    itemCount: snapshot.data!.length,
                  ),
                ),
              );
            } else if (snapshot.connectionState == ConnectionState.waiting) {
              return const Center(
                child: CircularProgressIndicator(),
              );
            } else if (!snapshot.hasData || snapshot.data!.isEmpty) {
              return const Center(
                child: Text('No data available'),
              );
            } else if (snapshot.hasError) {
              return Center(
                child: Text("${snapshot.error}"),
              );
            }
            return const Center(
              child: Text('Something went wrong'),
            );
          },
        ),
      ),
    );
  }
}
