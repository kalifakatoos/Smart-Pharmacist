import 'package:flutter/material.dart';
import '../services/search_service.dart';
import '../screens/drug_details_screen.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final TextEditingController _controller = TextEditingController();
  final SearchService _searchService = SearchService();
  bool _loading = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Smart Pharmacist'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          children: [
            TextField(
              controller: _controller,
              decoration: const InputDecoration(
                labelText: 'Enter drug name',
              ),
            ),
            const SizedBox(height: 16),
            ElevatedButton(
              onPressed: _loading ? null : () async {
                setState(() => _loading = true);
                final drug = await _searchService.fetchDrugInfo(_controller.text);
                setState(() => _loading = false);
                if (!mounted) return;
                Navigator.of(context).push(
                  MaterialPageRoute(
                    builder: (_) => DrugDetailsScreen(drug: drug),
                  ),
                );
              },
              child: _loading ? const CircularProgressIndicator() : const Text('Search'),
            ),
          ],
        ),
      ),
    );
  }
}
