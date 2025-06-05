import 'package:flutter/material.dart';
import '../models/drug.dart';

class DrugDetailsScreen extends StatelessWidget {
  final Drug drug;
  const DrugDetailsScreen({Key? key, required this.drug}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(drug.name),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: Text(drug.description),
      ),
    );
  }
}
