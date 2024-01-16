import 'package:flutter/material.dart';

class ProccessStringWidget extends StatelessWidget {
  const ProccessStringWidget({super.key, required this.text, required this.creteriaListItem});
  final String text;
  final Map<String, dynamic> creteriaListItem;

  @override
  Widget build(BuildContext context) {
    List<Widget> widgets = [];
    for (String part in text.split(' ')) {
      if (part.startsWith('\$')) {
        String value = getValue(part, creteriaListItem);
        value = "($value)";
        widgets.add(
          GestureDetector(
            onTap: () {
              print('Tapped on $value');
            },
            child: Text(
              "$value ",
              style: const TextStyle(
                fontSize: 18,
                color: Color.fromARGB(255, 117, 39, 176),
                fontWeight: FontWeight.w600,
              ),
            ),
          ),
        );
      } else {
        widgets.add(
          Text(
            "$part ",
            style: const TextStyle(
              fontSize: 18,
              color: Colors.white,
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
          ? creteriaListItem[creteriaListItem['type']]['\$1'][type][0].toString()
          : creteriaListItem[creteriaListItem['type']]['\$1']['default_value'].toString();
    case "\$2":
      final String type = creteriaListItem[creteriaListItem['type']]['\$2']['type'] == 'value'
          ? 'values'
          : creteriaListItem[creteriaListItem['type']]['\$2']['type'];
      return type == 'values'
          ? creteriaListItem[creteriaListItem['type']]['\$2'][type][0].toString()
          : creteriaListItem[creteriaListItem['type']]['\$2']['default_value'].toString();
    case "\$3":
      final String type = creteriaListItem[creteriaListItem['type']]['\$3']['type'] == 'value'
          ? 'values'
          : creteriaListItem[creteriaListItem['type']]['\$3']['type'];
      return type == 'values'
          ? creteriaListItem[creteriaListItem['type']]['\$3'][type][0].toString()
          : creteriaListItem[creteriaListItem['type']]['\$3']['default_value'].toString();
    case "\$4":
      final String type = creteriaListItem[creteriaListItem['type']]['\$4']['type'] == 'value'
          ? 'values'
          : creteriaListItem[creteriaListItem['type']]['\$4']['type'];
      return type == 'values'
          ? creteriaListItem[creteriaListItem['type']]['\$4'][type][0].toString()
          : creteriaListItem[creteriaListItem['type']]['\$4']['default_value'].toString();
    default:
  }
}
