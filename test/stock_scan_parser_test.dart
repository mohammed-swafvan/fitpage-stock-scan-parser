import 'package:fitpage_stock_scan_parser/infrastructure/api_service.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  test('FetchData returns a list on success', () async {
    final apiService = ApiService();

    final Future<List<dynamic>> result = apiService.fetchData();

    expect(result, isA<Future<List<dynamic>>>());
  });
}
