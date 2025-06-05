import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:google_mlkit_text_recognition/google_mlkit_text_recognition.dart';

import 'drug_info_page.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final TextEditingController _controller = TextEditingController();

  Future<void> _scanImage() async {
    final picker = ImagePicker();
    final picked = await picker.pickImage(source: ImageSource.camera);
    if (picked == null) return;

    final inputImage = InputImage.fromFilePath(picked.path);
    final textRecognizer = TextRecognizer(script: TextRecognitionScript.latin);
    final RecognizedText recognized =
        await textRecognizer.processImage(inputImage);
    await textRecognizer.close();

    final text = recognized.text.trim();
    if (text.isNotEmpty) {
      _searchDrug(text.split('\n').first);
    }
  }

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
                  onPressed: _scanImage,
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
