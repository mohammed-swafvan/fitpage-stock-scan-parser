import 'package:fitpage_stock_scan_parser/presentation/scan_item/scan_item_screen.dart';
import 'package:flutter/material.dart';

class StockMarketItemTileWidget extends StatelessWidget {
  const StockMarketItemTileWidget({super.key, required this.data});
  final Map<String, dynamic> data;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => ScanItemScreen(data: data),
          ),
        );
      },
      child: Container(
        padding: const EdgeInsets.only(left: 12),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              data['name'],
              style: const TextStyle(
                fontSize: 18,
                color: Colors.white,
                fontWeight: FontWeight.w600,
              ),
            ),
            Text(
              data['tag'],
              style: TextStyle(
                fontSize: 12,
                color: data['color'] == 'green' ? Colors.green : Colors.red,
                fontWeight: FontWeight.w600,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
