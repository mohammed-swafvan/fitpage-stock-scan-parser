import 'package:fitpage_stock_scan_parser/core/colors/custom_colors.dart';
import 'package:fitpage_stock_scan_parser/core/contance/constant.dart';
import 'package:fitpage_stock_scan_parser/presentation/scan_item_params/widgets/set_parameter_widget.dart';
import 'package:flutter/material.dart';

class ScanItemParamsScreen extends StatefulWidget {
  const ScanItemParamsScreen({
    super.key,
    required this.title,
    required this.paramList,
    required this.isValues,
    required this.dollarMap,
  });
  final String title;
  final List<dynamic> paramList;
  final bool isValues;
  final Map<String, dynamic> dollarMap;

  @override
  State<ScanItemParamsScreen> createState() => _ScanItemParamsScreenState();
}

class _ScanItemParamsScreenState extends State<ScanItemParamsScreen> {
  TextEditingController controller = TextEditingController();
  List<dynamic> data = [];
  @override
  void initState() {
    if (!widget.isValues) {
      String item = widget.paramList[0].toString();
      controller = TextEditingController(text: item);
    } else {
      sortList();
    }
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final double screenHeight = MediaQuery.of(context).size.height;
    return Scaffold(
      body: SafeArea(
        child: Container(
          padding: const EdgeInsets.symmetric(horizontal: 12),
          child: Column(
            children: [
              Row(
                children: [
                  IconButton(
                    onPressed: () {
                      Navigator.of(context).pop();
                    },
                    icon: const Icon(
                      Icons.arrow_back_ios_new_rounded,
                      color: Colors.black38,
                    ),
                  ),
                  Expanded(
                    child: Text(
                      widget.title,
                      style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 24),
                      overflow: TextOverflow.ellipsis,
                    ),
                  ),
                ],
              ),
              Expanded(
                child: Center(
                  child: Container(
                    padding: const EdgeInsets.symmetric(horizontal: 12),
                    color: CustomColors.secondaryColor,
                    height: screenHeight / 2,
                    width: double.infinity,
                    child: widget.isValues
                        ? ListView.separated(
                            shrinkWrap: true,
                            padding: const EdgeInsets.only(top: 24),
                            itemBuilder: (context, index) {
                              return Padding(
                                padding: const EdgeInsets.only(left: 12.0),
                                child: Text(
                                  widget.paramList[index].toString(),
                                  style: TextStyle(
                                    fontSize: 18,
                                    color: CustomColors.primaryColor,
                                    fontWeight: FontWeight.w600,
                                  ),
                                ),
                              );
                            },
                            separatorBuilder: (context, index) => Constant.builDottedLine(),
                            itemCount: widget.paramList.length,
                          )
                        : SetParameterWidget(
                            title: widget.title,
                            dollarMap: widget.dollarMap,
                            controller: controller,
                          ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  sortList() {
    if (widget.title == "Open = High") {
      widget.paramList.sort((a, b) => b.compareTo(a));
    } else {
      widget.paramList.sort();
    }
    setState(() {});
  }
}
