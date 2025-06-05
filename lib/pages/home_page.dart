import 'package:flutter/material.dart';
import 'drug_info_page.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final TextEditingController _controller = TextEditingController();

  void _searchDrug(String name) {
    if (name.isEmpty) return;
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (_) => DrugInfoPage(drugName: name),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Smart Pharmacist'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            TextField(
              controller: _controller,
              decoration: const InputDecoration(
                labelText: 'اسم الدواء',
                border: OutlineInputBorder(),
              ),
              onSubmitted: _searchDrug,
            ),
            const SizedBox(height: 16),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                ElevatedButton.icon(
                  onPressed: () {
                    // TODO: integrate camera and OCR search
                  },
                  icon: const Icon(Icons.camera_alt),
                  label: const Text('تصوير'),
                ),
                ElevatedButton.icon(
                  onPressed: () => _searchDrug(_controller.text),
                  icon: const Icon(Icons.search),
                  label: const Text('بحث'),
                ),
                ElevatedButton.icon(
                  onPressed: () {
                    // TODO: integrate voice search
                  },
                  icon: const Icon(Icons.mic),
                  label: const Text('صوت'),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
