import 'package:dotted_line/dotted_line.dart';
import 'package:flutter/material.dart';

class Constant {

  /// height
  static SizedBox height10 = const SizedBox(height: 10);
  static SizedBox height15 = const SizedBox(height: 15);
  static SizedBox height20 = const SizedBox(height: 20);

  /// dotted line
  static Widget builDottedLine() => const Padding(
        padding: EdgeInsets.symmetric(vertical: 14),
        child: Center(
          child: DottedLine(
            direction: Axis.horizontal,
            dashColor: Colors.white,
            dashLength: 2,
            lineThickness: 2,
            dashGapLength: 2,
            dashRadius: 2,
          ),
        ),
      );
      
}
