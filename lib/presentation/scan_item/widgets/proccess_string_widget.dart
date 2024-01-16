import 'package:fitpage_stock_scan_parser/core/colors/custom_colors.dart';
import 'package:fitpage_stock_scan_parser/presentation/scan_item_params/scan_item_param_screen.dart';
import 'package:flutter/material.dart';

class ProccessStringWidget extends StatelessWidget {
  const ProccessStringWidget({super.key, required this.text, required this.creteriaListItem, required this.title});
  final String title;
  final String text;
  final Map<String, dynamic> creteriaListItem;

  @override
  Widget build(BuildContext context) {
    List<Widget> widgets = [];
    for (String part in text.split(' ')) {
      if (part.startsWith('\$')) {
        List<String> values = getValue(part, creteriaListItem);
        String convertedValue = "(${values[0]})";
        widgets.add(
          GestureDetector(
            onTap: () {
              String key = values[1];
              Map<String, dynamic> dollarMap = creteriaListItem['variable'][key];
              List<dynamic> paramList = [];
              bool isValues = false;
              String type = creteriaListItem['variable'][key]['type'];
              if (type == 'value') {
                paramList = creteriaListItem['variable'][key]['values'];
                isValues = true;
              } else {
                paramList.add(creteriaListItem['variable'][key]['default_value']);
                isValues = false;
              }
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => ScanItemParamsScreen(
                    title: title,
                    paramList: paramList,
                    dollarMap: dollarMap,
                    isValues: isValues,
                  ),
                ),
              );
            },
            child: Text(
              "$convertedValue ",
              style: TextStyle(
                fontSize: 18,
                color: CustomColors.highlightColor,
                fontWeight: FontWeight.w600,
              ),
            ),
          ),
        );
      } else {
        widgets.add(
          Text(
            "$part ",
            style: TextStyle(
              fontSize: 18,
              color: CustomColors.primaryColor,
              fontWeight: FontWeight.w600,
            ),
          ),
        );
      }
    }
    return Wrap(
      direction: Axis.horizontal,
      children: widgets,
    );
  }
}

getValue(String placeholder, Map<String, dynamic> creteriaListItem) {
  switch (placeholder) {
    case "\$1":
      final String type = creteriaListItem[creteriaListItem['type']]['\$1']['type'] == 'value'
          ? 'values'
          : creteriaListItem[creteriaListItem['type']]['\$1']['type'];
      return type == 'values'
          ? [creteriaListItem[creteriaListItem['type']]['\$1'][type][0].toString(), "\$1"]
          : [creteriaListItem[creteriaListItem['type']]['\$1']['default_value'].toString(), "\$1"];
    case "\$2":
      final String type = creteriaListItem[creteriaListItem['type']]['\$2']['type'] == 'value'
          ? 'values'
          : creteriaListItem[creteriaListItem['type']]['\$2']['type'];
      return type == 'values'
          ? [creteriaListItem[creteriaListItem['type']]['\$2'][type][0].toString(), "\$2"]
          : [creteriaListItem[creteriaListItem['type']]['\$2']['default_value'].toString(), "\$2"];
    case "\$3":
      final String type = creteriaListItem[creteriaListItem['type']]['\$3']['type'] == 'value'
          ? 'values'
          : creteriaListItem[creteriaListItem['type']]['\$3']['type'];
      return type == 'values'
          ? [creteriaListItem[creteriaListItem['type']]['\$3'][type][0].toString(), "\$3"]
          : [creteriaListItem[creteriaListItem['type']]['\$3']['default_value'].toString(), "\$3"];
    case "\$4":
      final String type = creteriaListItem[creteriaListItem['type']]['\$4']['type'] == 'value'
          ? 'values'
          : creteriaListItem[creteriaListItem['type']]['\$4']['type'];
      return type == 'values'
          ? [creteriaListItem[creteriaListItem['type']]['\$4'][type][0].toString(), "\$4"]
          : [creteriaListItem[creteriaListItem['type']]['\$4']['default_value'].toString(), "\$4"];
    default:
  }
}
