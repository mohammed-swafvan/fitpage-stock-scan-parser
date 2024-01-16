import 'package:fitpage_stock_scan_parser/core/colors/custom_colors.dart';
import 'package:fitpage_stock_scan_parser/core/contance/constant.dart';
import 'package:flutter/material.dart';

class SetParameterWidget extends StatelessWidget {
  const SetParameterWidget({super.key, required this.title, required this.dollarMap, required this.controller});
  final String title;
  final Map<String, dynamic> dollarMap;
  final TextEditingController controller;

  @override
  Widget build(BuildContext context) {
    final double screenHeight = MediaQuery.of(context).size.height;
    final double screenWidth = MediaQuery.of(context).size.width;
    return Padding(
      padding: const EdgeInsets.only(top: 16),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            title.split(' ')[0],
            style: TextStyle(
              fontSize: 18,
              color: CustomColors.primaryColor,
              fontWeight: FontWeight.bold,
            ),
          ),
          Constant.height15,
          Text(
            'Set Parameters',
            style: TextStyle(
              fontSize: 16,
              color: CustomColors.primaryColor,
              fontWeight: FontWeight.w600,
            ),
          ),
          Constant.height10,
          Container(
            padding: const EdgeInsets.symmetric(horizontal: 12).copyWith(top: 12),
            height: screenHeight / 7,
            color: CustomColors.primaryColor,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  dollarMap['parameter_name'],
                  style: TextStyle(
                    fontSize: 18,
                    color: CustomColors.secondaryColor,
                    fontWeight: FontWeight.w600,
                  ),
                ),
                Container(
                  padding: const EdgeInsets.only(left: 8),
                  width: screenWidth / 3.5,
                  decoration: BoxDecoration(
                    border: Border.all(
                      color: CustomColors.secondaryColor,
                      width: 1,
                    ),
                    borderRadius: BorderRadius.circular(4),
                  ),
                  child: TextField(
                    controller: controller,
                    style: const TextStyle(fontWeight: FontWeight.bold),
                    keyboardType: TextInputType.number,
                    decoration: const InputDecoration(
                      contentPadding: EdgeInsets.symmetric(vertical: 2),
                      border: InputBorder.none,
                      isDense: true,
                    ),
                    maxLines: null,
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
