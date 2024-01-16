import 'package:fitpage_stock_scan_parser/presentation/scan_item/widgets/proccess_string_widget.dart';
import 'package:flutter/material.dart';

class ScanItemScreen extends StatelessWidget {
  const ScanItemScreen({super.key, required this.data});
  final Map<String, dynamic> data;

  @override
  Widget build(BuildContext context) {
    final double screenHeight = MediaQuery.of(context).size.height;
    print(data['criteria'].length);
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
                      data['name'],
                      style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 24),
                      overflow: TextOverflow.ellipsis,
                    ),
                  ),
                ],
              ),
              Expanded(
                child: Center(
                  child: Container(
                    padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 12),
                    color: Colors.black,
                    height: screenHeight / 2,
                    width: double.infinity,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Container(
                          padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 14),
                          width: double.infinity,
                          color: Colors.blue.withOpacity(0.4),
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
                        const SizedBox(height: 16),
                        ListView.separated(
                          padding: const EdgeInsets.symmetric(horizontal: 12),
                          shrinkWrap: true,
                          itemBuilder: (context, index) {
                            final String type = data['criteria'][index]['type'];
                            return type == 'plain_text'
                                ? Text(
                                    "${data['criteria'][index]['text']}",
                                    style: const TextStyle(
                                      fontSize: 18,
                                      color: Colors.white,
                                      fontWeight: FontWeight.w600,
                                    ),
                                  )
                                : ProccessStringWidget(
                                    text: data['criteria'][index]['text'],
                                    creteriaListItem: data['criteria'][index],
                                  );
                          },
                          separatorBuilder: (context, index) {
                            return const Padding(
                              padding: EdgeInsets.symmetric(vertical: 12),
                              child: Text(
                                "and",
                                style: TextStyle(
                                  fontSize: 10,
                                  color: Colors.white,
                                  fontWeight: FontWeight.w600,
                                ),
                              ),
                            );
                          },
                          itemCount: data['criteria'].length,
                        )
                      ],
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
}
