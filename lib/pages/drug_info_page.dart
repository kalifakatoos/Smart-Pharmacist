import 'package:flutter/material.dart';
import 'package:flutter_tts/flutter_tts.dart';

class DrugInfoPage extends StatelessWidget {
  final String drugName;
  const DrugInfoPage({Key? key, required this.drugName}) : super(key: key);

  Future<void> _speak() async {
    final tts = FlutterTts();
    await tts.speak(drugName);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text(drugName)),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  drugName,
                  style: const TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
                ),
                IconButton(
                  icon: const Icon(Icons.volume_up),
                  onPressed: _speak,
                ),
              ],
            ),
            const SizedBox(height: 16),
            const Text('دواعي الاستعمال:', style: TextStyle(fontWeight: FontWeight.bold)),
            const Text('هنا توضع معلومات الاستخدام...'),
            const SizedBox(height: 8),
            const Text('الجرعات:', style: TextStyle(fontWeight: FontWeight.bold)),
            const Text('هنا توضع معلومات الجرعات...'),
            const SizedBox(height: 8),
            const Text('الاحتياطات:', style: TextStyle(fontWeight: FontWeight.bold)),
            const Text('هنا توضع التحذيرات والاحتياطات...'),
          ],
        ),
      ),
    );
  }
}
