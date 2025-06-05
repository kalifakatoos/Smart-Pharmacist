import 'dart:convert';
import 'package:http/http.dart' as http;
import '../models/drug.dart';

class SearchService {
  Future<Drug> fetchDrugInfo(String query) async {
    final uri = Uri.parse('https://api.fda.gov/drug/label.json?search=openfda.generic_name%3A%22${Uri.encodeComponent(query)}%22&limit=1');
    final response = await http.get(uri);
    if (response.statusCode == 200) {
      final data = json.decode(response.body);
      if (data['results'] != null && data['results'].isNotEmpty) {
        final result = data['results'][0];
        final desc = result['description'] ?? 'No description available';
        final name = result['openfda']?['generic_name']?[0] ?? query;
        return Drug(name: name, description: desc);
      }
    }
    return Drug(name: query, description: 'No data found');
  }
}
